# Deploy do AKS utilizando terraform

No README.md demonstro como realizar a criação de um cluster AKS com system node e após a criação deste cluster adicionar um user node pool.

Neste código terraform, o arquivo usernode.tf  cria o user node pool, no momento da criação do cluster, sem a necessidade de adicionar posteriormente.

## Detalhe dos arquivos .tf

**1- rg.tf:**

- Realiza a criação do resource group

**2 - aks.tf:**

- Realiza a criação do cluster aks com system node default. Nele é definido o nome do system node pool, a quantidade de nodes e o tamanho da vm.

**3 - provider.tf:**

- Neste arquivo passo as informações do cloud provider, como subscription id e tenant id.

**4 - usernode.tf:**

- Este arquivo realiza a criação do user node. Nele é definido o nome do user node pool, a quantidade de nodes e o tamanho da vm.

**5 - version.tf:**

- Neste arquivo informo as configurações do cloud provider.

## Realizando o Deploy

- Baixe o repositório em seu computador

- Altere o arquivo provider.tf, adicionando as informações da sua conta azure

- Execute os seguintes comandos:

 - terraform init: inicia o terraform
 - terraform validate: realiza a validação do seu código
 - terraform fmt: formata a identação do seu código
 - terraform plan: planeja o deploy do aks, informa o que será criado
 - terraform apply: executa o deploy do aks
