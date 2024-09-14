# Exemplos Básicos de Snyk

![Toolbox Playground](../img/toolbox-playground.png)

O [Snyk](https://snyk.io/pt-BR/) é uma plataforma de segurança para desenvolvedores. Integrando-se diretamente a ferramentas de desenvolvimento, fluxos de trabalhos e pipelines de automação, a Snyk possibilita que as equipes encontrem, priorizem e corrijam mais facilmente vulnerabilidades em códigos, dependências, contêineres e infraestrutura como código. Com o suporte do melhor aplicativo do setor e inteligência em segurança, a Snyk coloca a experiência em segurança no kit de ferramentas de todo desenvolvedor.

O Snyk tem suporte para as seguintes linguagens: Bazel, C, C++, Dart , Flutter, Elixir, Go, Java, Kotlin, Javascript, .NET, PHP, Python, Ruby, Swift, Typescript e VB.NET. Para saber mais, acesse este [link](https://docs.snyk.io/supported-languages-package-managers-and-frameworks).

## Usos para o Snyk

Proteja seu código: use o [Snyk Open Source](https://docs.snyk.io/scan-using-snyk/snyk-open-source) para corrigir vulnerabilidades em suas dependências de código aberto e o [Snyk Code](https://docs.snyk.io/scan-using-snyk/snyk-code) para corrigir vulnerabilidades em seu código-fonte.

Proteja seus containers: use o [Snyk Container](https://docs.snyk.io/scan-using-snyk/snyk-container) para corrigir vulnerabilidades em imagens de containers e aplicações Kubernetes.

Proteja sua infraestrutura: use o [Snyk Infrastructure as Code (IaC)](https://docs.snyk.io/scan-using-snyk/snyk-iac/scan-your-iac-source-code) para corrigir configurações incorretas em templates do Terraform, CloudFormation, Kubernetes e Azure. Use o IaC+ para corrigir configurações incorretas em contas da Amazon Web Services, assinaturas da Microsoft Azure e projetos do Google Cloud.

## Snyk Container

O Snyk Container é uma ferramenta que ajuda a identificar e corrigir vulnerabilidades de segurança em contêineres de software. Ele é projetado para analisar imagens de contêineres e fornecer informações sobre quaisquer vulnerabilidades conhecidas presentes nessas imagens.

Ao usar o Snyk Container, você pode verificar se as imagens de contêineres que você está usando contêm componentes com vulnerabilidades conhecidas. Ele verifica o banco de dados de vulnerabilidades do Snyk para identificar quaisquer problemas de segurança e fornece informações detalhadas sobre as vulnerabilidades encontradas.

Além disso, o Snyk Container também pode ajudar a corrigir essas vulnerabilidades, fornecendo recomendações de patches ou atualizações para os componentes afetados. Isso ajuda a garantir que seus contêineres estejam protegidos contra possíveis ataques e vulnerabilidades conhecidas.

O Snyk Container é uma ferramenta útil para equipes de desenvolvimento e operações que desejam garantir a segurança de seus contêineres de software. Ele pode ser integrado a pipelines de CI/CD para automatizar a verificação de segurança de imagens de contêineres e garantir que apenas imagens seguras sejam implantadas em produção.

## Test e Monitor

### Test

O comando `snyk container test` é usado para testar a segurança de um contêiner Docker em relação a vulnerabilidades conhecidas.

Quando você executa o comando `snyk container test`, o Snyk analisa o contêiner Docker especificado e verifica se há vulnerabilidades conhecidas nas imagens e nas dependências do contêiner. Ele também fornece informações detalhadas sobre as vulnerabilidades encontradas, incluindo o nível de gravidade e as recomendações para corrigi-las.

Essa verificação de segurança é importante para garantir que os contêineres Docker utilizados em seus projetos estejam protegidos contra possíveis ataques e vulnerabilidades conhecidas.

### Monitor

O comando `snyk container monitor` captura as camadas de imagem do contêiner e as dependências em um projeto e monitora esse snapshot em busca de vulnerabilidades, enviando os resultados para [snyk.io](snyk.io).

Use o comando `container monitor` antes de integrar seu código em produção, para tirar uma snapshot do código a ser monitorado, a fim de evitar a introdução de vulnerabilidades em produção. Escolha uma frequência de teste em suas configurações se você deseja alterar a frequência padrão, que é diária.

Se você fizer alterações no seu código, será necessário executar o comando `container monitor` novamente.

Para obter mais informações, consulte [Snyk CLI para segurança de contêineres](https://docs.snyk.io/products/snyk-container/snyk-cli-for-container-security).

## Primeiros passos

1. **Crie uma conta**: Acesse o site do [Snyk](https://app.snyk.io/signup) e crie uma conta.

2. **Token**: Após criar a conta, vá até [Account Settings](https://app.snyk.io/account) e copie o **Auth Token** para ser usado abaixo.

3. Certifique-se de ter o Nodejs instalado em sua máquina. Você pode baixar e instalar o Nodejs a partir do site oficial: [https://nodejs.org/pt/download/package-manager/current](https://nodejs.org/pt/download/package-manager/current).

4. Certifique-se de ter o Docker instalado em sua máquina. Você pode baixar e instalar o Docker a partir do site oficial: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/).

## Uso do CLI Snyk

1. Instale o pacote do Snyk com o seguinte comando:

```bash
npm install snyk -g
```

2. Após instalado, autentique usando o seu **Auth Token**:

```bash
snyk auth token
```

3. Acesse a pasta [pipelines-seguranca-exemplo-basico/snyk/python](./python/).

4. Crie a imagem docker do app python com o seguinte comando:

```bash
docker build -t snyk-python:latest -f Dockerfile .
```

5 Após o build da imagem, rode o comando abaixo para testar a imagem:

```bash
snyk container test --docker snyk-python:latest --file=Dockerfile

```
Obs.: Esse comando irá gerar um relatório de falhas encontradas.

6. Para monitorar o código por meio da plataforma Snyk, rode o seguinte comando: 

```bash
snyk container monitor --docker snyk-python:latest --file=Dockerfile --project-name=snyk-python
```
- Esse comando irá gerar um um projeto no Snyk com o nome **snyk-python**.
- Quando estiver usando uma [Organização](https://docs.snyk.io/snyk-admin/groups-and-organizations/organizations) diferente, colocar no final do código `--org=sua_org`, conforme o código abaixo:

```bash
  snyk container monitor --docker snyk-python:latest --file=Dockerfile --project-name=snyk-python --org=sua_org
```

Se você fizer alterações no seu código, será necessário executar o comando de `monitor` novamente.

## Uso do Snyk no GitHub Actions

1. Crie um arquivo de fluxo de trabalho (workflow) no seu repositório. Você pode criar um arquivo chamado [.github/workflows/snyk.yml](../.github/workflows/snyk.yaml) e adicionar o seguinte conteúdo:

```yaml
name: Security Check with Snyk
on:
  push:
    branches:
      - main  # Aciona o fluxo de trabalho quando houver push na brach main
    paths:
      - 'snyk/python/**'  # Aciona o fluxo de trabalho quando houver alterações no diretório 'snyk/python'
  pull_request:
    branches:
      - main # Aciona o fluxo de trabalho quando houver PR na brach main
    paths:
      - 'snyk/python/**'  # Aciona o fluxo de trabalho quando houver alterações no diretório 'snyk/python'
  workflow_dispatch:  # Aciona manualmente o fluxo de trabalho
    inputs:  # Define entradas para o fluxo de trabalho
      name:  # Define a entrada "name"
        description: 'Acionador manual do fluxo de trabalho'  # Descrição da entrada

jobs:
  snyk-scan:
    name: Snyk Security Check # Nome do trabalho
    runs-on: ubuntu-latest # Sistema operacional em que o trabalho será executado (no caso, Ubuntu)
    steps: # Passos a serem executados no trabalho
      - uses: actions/checkout@master # Passo para fazer o checkout do repositório

      - name: Docker Build
        run: docker build -t snyk-python:latest -f snyk/python/Dockerfile snyk/python # Constrói a imagem Docker

      - name: Install Snyk CLI # Instala a CLI do Snyk
        run: npm install -g snyk # Instala a CLI do Snyk

      - name: Authenticate with Snyk # Autentica com o Snyk
        run: snyk auth ${{ secrets.SNYK_TOKEN }} # Autenica com o Snyk usando o token
      
      - name: Run Snyk test # Executa o teste de segurança com o Snyk
        run: snyk container test --docker snyk-python:latest --file=snyk/python/Dockerfile
        continue-on-error: true # Continua mesmo com erro

      - name: Generate Snyk report # Gera o relatório do Snyk
        run: snyk container monitor --docker snyk-python:latest --file=snyk/python/Dockerfile --project-name=snyk-python

```

O exemplo acima é para código em Python. Para saber quais linguagens podem ser usadas no Github Actions acesse [https://github.com/snyk/actions/tree/master](https://github.com/snyk/actions/tree/master)

### secrets.SNYK_TOKEN

O **secrets.SNYK_TOKEN** é uma variável de ambiente que armazena um token de autenticação necessário para acessar recursos protegidos no Snyk.

1. No seu repositório do GitHub, vá para as configurações do repositório.

2. Na seção "Secrets" ou "Segredos", clique em "New repository secret" ou "Novo segredo do repositório".

3. Digite "SNYK_TOKEN" como nome do segredo e cole o valor do token que você copiou anteriormente.

4. Clique em "Add secret" ou "Adicionar segredo" para salvar o token como um segredo do repositório.

## Comandos com o Snyk

Link para os comando do CLI Snyk [https://docs.snyk.io/snyk-cli/cli-commands-and-options-summary](https://docs.snyk.io/snyk-cli/cli-commands-and-options-summary).