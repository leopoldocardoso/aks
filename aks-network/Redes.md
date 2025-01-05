# Redes no Azure Kubernetes Service - AKS

## Kubenet Network Plugin

- Plugin de rede simplificado
- Baseado em roteamento de IP
- Conhecido por ser o Network Plugin defaul do AKS
- Os nodes recebem atribuição de IPs pela VNET do AKS
- Os PODs recebem atribuição de IPs por um POD CIDR que é um espaço de endereço lógico
- Utiliza ARP Protocol para facilitar a comunicação entre os PODs no mesmo NODE
- Para comunicação entre NODEs, ele cria uma tabela de roteamento para que seja possível a comunicação dos PODs entre os diferentes NODEs

### Quando usar Kubenet Network Plugin

- Workoads que não dependem de funcionalidades de redes avançadas
- Ambientes que não exigem altos níveis escalabilidade de redes
- Ambientes de laboratório

### Limitações

- Escalabilidade: Não permite vários clusters na mesma subrede
- Máximo de 400 rotas, o que significa o máximo de 400 NODEs em um cluster
- Não suporta NODEs Windows
- Não suporta network policy
- Não suporta virtual nodes

### Deploy do AKS utilizando kubenete através do terraform

[deploy aks - kubenet](https://github.com/leopoldocardoso/aks/tree/develop/deploy-terraform/aks-kubenet)

| ![kubenet.png](/aks-network/imagens-network/kubenet.png) |
|:-----------------------------:|
| Figura 1: kubenet |

## Azure CNI Network Plugin

- Baseado na infraestrutura de redes do Azure
- Utiliza endereços IPs gerenciados pelo Azure para os PODs do Kubernetes
- Os IPs são pré-alocados com base em cada NODE conforme o parâmetro MaxPods
- Um IP para o NODE mais os IPs dos PODs, conforme o parâmetro MaxPods
- O tráfego de rede entre os PODs é encaminhado sem a necessidade de roteamento por meios de UDRs
- Oferece alta performance e baixa latência para comunicação entre os PODs, adequado para workloads exigentes em termos de rede.
- Altamente escalável
- Pode ser utilizado em clusters AKS de grande porte e cenários de alta carga de trabalho com eficiência.

### Quando usar

- Necessidade de alta performance e baixa latência para comunicação entre os PODs.
- Quando houver comunicação com dispositivos fora do cluster
- Necessidade de múltiplos clusters na mesma subrede
- NODEs Windows
- Virtual NODEs

### Desvantagens

- Complexo de configurar, exigindo um bom planejamento em redes
- Aumento dos clusters pode levar a exaustão de endereços IPs

### Deploy do AKS utilizando Azure CNI através do terraform

[deploy aks - Azure CNI](https://github.com/leopoldocardoso/aks/tree/develop/deploy-terraform/aks-azure-cni)

| ![azure-cni.png](/aks-network/imagens-network/azure-cni.png) |
|:-----------------------------:|
| Figura 2: azure-cni |

## Azure CNI Overlay Network Plugin

- Neste plugin os nós são implantados em uma vnet
- Os PODs recebem endereços IPs de um CIDR privado logicamente diferente da vnet que hosped os NODEs
- O tráfego do POD e do Nó dentro do cluster usa uma rede de sobreposição
- Utiliza NAT para permitir que os Nós se comuniquem com recursos externos, como a internet
- O NAT traduz os endereços de IPs internos dos Nós para um único endereço externo
- Cada NODE recebe um espaçõ de endereço /24

### Quando usar

- Quando precisar escalar para um grande número de PODs, mas tem espaço de endereço IP limitado
- Maior parte da comunicação dos PODs está dentro do cluster

### Quando não usar

- Se você possui muita comunicação fora do cluster
- Se tiver NODEs Windows Server 2019, pois não suporta
- Se precisar de um Application Gateway como ingress controller

### Deploy do AKS utilizando Azure CNI Overlay através do terraform

#### Note que para realizar o deploy do aks utilizando Azure CNI Overlay não é necessário informar o Network Profile. Veja que ele está comentando no código

[deploy aks - Azure CNI](https://github.com/leopoldocardoso/aks/tree/develop/deploy-terraform/aks-azure-cni-overlay)

| ![azure-cni-overlay.png](/aks-network/imagens-network/azure-cni-overlay.png) |
|:-----------------------------:|
| Figura 2: azure-cni-overlay |