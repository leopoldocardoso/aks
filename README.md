# Azure Kubenertes Services - AKS

 O Azure Kubernetes Services (AKS) é um serviço gerenciado da Microsoft Azure para orquestração de conteineres usando o kubernetes.

## Principais Caracteristicas do AKS

 **1 - Gerenciamento Simplificado:**

 - O control plane do Kubernetes é gerenciado pela Microsoft, incluindo atualizações, patches e escalabilidade, permitindo que os usuários foquem nas cargas de trabalho e menos na infraestrutura

**2 - Escalabilidade Automática:**

- Suporte para autoescalonamento de nós(nodes) e pods com base na demanda de recursos.

**3 - Integração com Azure:**

- Funciona de forma integrada com outros serviços do Azure, como Microsoft Entra ID e integração com ferramentas de segurança, como Azure Policy.

**4 - Custo-efetividade:**

- Você paga apenas pelos nós do cluster em execução, enquanto o plano de controle (control plane) é gratuito.

**5 - Segurança**

- Suporte para controle de acesso baseado em funções (RBAC).

- Autenticação via Microsoft Entra e integração com ferramentas de segurança como Azure Policy

**6 - Flexibilidade Multilingue:**

- Suporte para executar aplicativos em contêiners usando qualquer linguagem ou estrutura que possa ser contida em um contêiner Docker.

## Principais Componentes do Cluster AKS

**1 - Containerd:**

- Container runtime padrão
- Instalado em cada node que gerencia e roda imagens de container

**2 - Kubelet:**

- Agente que é executado no worker node
- Comunica-se com o control plane e outros componentes dentro do worker.
- Garante que os conteineres e os nós funcionem corretamente

**3 - Kube-Proxy**

- Proxy de rede que roda em cada nó
- Instalado como daemonset no AKS
- Responsável por manter as regras de rede nos nós e manipular o tráfego de dos PODs e para os PODs

**4 - Coredns**

- Instalação realizada durante a implantação do AKS
- Servidor DNS autoritativo
- Utiliza plugins adicionais ao coredns
- Usado para resolver nomes de dominio e serviços e PODs do cluster
- Requisições dentro do cluster usa o plugin kubernetes
- Requisições fora do cluster usa o plugin forward