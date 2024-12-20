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

## Estrutura de recursos do AKS

Quando criamos um Cluster AKS, automaticamente um grupo de recursos gerenciado pela Microsoft é criado e normalmente é nomeado com o prefixo MC.

Dentro deste grupo de recursos gerenciado alguns componentes são criados para o funcionamento do AKS.

No exemplo abaixo vejam que criei o recurso aks-devlab01 no grupo de recursos *rg-aks-devlab01* e automaticamente foi criado um grupo de recurso chamado
*MC_rg-aks-devlab01_aks-devlab01_eastus*. 

Clicando na figura 1, podemos notar que foi criado o aks-devlab01 e clicando na figura 2 podemos visualizar que foram criados componentes gerenciados pela Microsoft.

É possível notar que o grupo de recursos *MC_rg-aks-devlab01_aks-devlab01_eastus* contém as tags informando qual cluster ele é gerenciado e em qual resource group ele se encontra.

<figure>
  <img src="images/rg-aks.png" alt="rg-aks-devlab01" style="width:400px; height:300;">
  <figcaption>Figura 1: rg-aks-devlab01</figcaption>
</figure>


<figure>
  <img src="images/mc-rg-aks.png" alt="MC_rg-aks-devlab01_aks-devlab01_eastus" style="width:200px; height:auto;">
  <figcaption>Figura 2: MC_rg-aks-devlab01_aks-devlab01_eastus</figcaption>
</figure>



Os recursos criados automaticamente e gerenciados pela Micrososft são:

**1 - Virtual Machine Scale Set (VMSS):** 
- Utilizada para hospedar os nodes do cluster

**2 - Virtual Network (VNET):** 
- Representa a própria rede do Azure
- Proporciona isolamento e controle de tráfego
- Permite que os *Nós* e *PODs* do kubernetes se comuniquem de forma segura

**3 - Network Security Group:**
- Filtro de rede que pode conter várias regras de segurança
- Permite ou nega tráfego de rede para recursos conectados a VNET

**4 - Route Table:**
- Contém um conjunto de regras chamadas rotas que determina para onde o tráfego de rede deve ser direcioinado
- No AKS direciona o tráfego de rede entre os *PODs* e para fora do cluster

**5 - Load Balancer:**
- Usado para distribuir as solicitações de usuários entre diferentes instâncias de um serviço ou aplicação
- Garante desempenho e disponibilidade

**6 - Public IP:**
- Utilizado para expor serviços ao tráfego externo

**7 - Managed Identity**
- Fornece uma identidade do Microsoft Entra, gerenciada automaticamente pelo Azure
- No AKS é utilizada para conceder permissões de acesso aos *Nós* do cluster a outros recursos do Azure