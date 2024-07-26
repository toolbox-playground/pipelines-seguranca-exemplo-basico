# Exemplos Básicos de Snyk

![Toolbox Playground](../img/toolbox-playground.png)

O [Snyk](https://snyk.io/pt-BR/) é uma plataforma de segurança para desenvolvedores. Integrando-se diretamente a ferramentas de desenvolvimento, fluxos de trabalhos e pipelines de automação, a Snyk possibilita que as equipes encontrem, priorizem e corrijam mais facilmente vulnerabilidades em códigos, dependências, contêineres e infraestrutura como código. Com o suporte do melhor aplicativo do setor e inteligência em segurança, a Snyk coloca a experiência em segurança no kit de ferramentas de todo desenvolvedor.

O Snyk tem suporte para as seguintes linguagens: Bazel, C, C++, Dart , Flutter, Elixir, Go, Java, Kotlin, Javascript, .NET, PHP, Python, Ruby, Swift, Typescript e VB.NET. Para saber mais, acesse este [link](https://docs.snyk.io/supported-languages-package-managers-and-frameworks).

## Usos para o Snyk

Proteja seu código: use o [Snyk Open Source](https://docs.snyk.io/scan-using-snyk/snyk-open-source) para corrigir vulnerabilidades em suas dependências de código aberto e o Snyk Code para corrigir vulnerabilidades em seu código-fonte.

Proteja seus containers: use o [Snyk Container](https://docs.snyk.io/scan-using-snyk/snyk-container) para corrigir vulnerabilidades em imagens de containers e aplicações Kubernetes.

Proteja sua infraestrutura: use o [Snyk Infrastructure as Code (IaC)](https://docs.snyk.io/scan-using-snyk/snyk-iac/scan-your-iac-source-code) para corrigir configurações incorretas em templates do Terraform, CloudFormation, Kubernetes e Azure. Use o IaC+ para corrigir configurações incorretas em contas da Amazon Web Services, assinaturas da Microsoft Azure e projetos do Google Cloud.

## Primeiros passos

1. **Crie uma conta**: Acesse o site do [Snyk](https://app.snyk.io/signup) e crie uma conta.

2. **Token**: Após criar a conta, vá até [Account Settings](https://app.snyk.io/account) e copie o **Auth Token** para ser usado abaixo.

3. Certifique-se de ter o Nodejs instalado em sua máquina. Você pode baixar e instalar o Docker a partir do site oficial: [https://nodejs.org/pt/download/package-manager/current](https://nodejs.org/pt/download/package-manager/current).

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

3. Crie a imagem docker do app python com o seguinte comando:

```bash
docker build -t snyk-python:latest -f Dockerfile .
```

4. Após o build da imagem, rode o comando abaixo para testar a imagem:

```bash
snyk test --docker snyk-python:latest --file=Dockerfile

```

5. Após rodar o comando acima, o Snyk irá testar o código.

## Uso do Snyk no GitHub Actions

1. Crie um arquivo de fluxo de trabalho (workflow) no seu repositório. Você pode criar um arquivo chamado [.github/workflows/snyk.yml](../.github/workflows/snyk.yaml) e adicionar o seguinte conteúdo:

```yaml
name: Security Check with Snyk
on:
  push:
    branches:
      - main  # Aciona o fluxo de trabalho quando houver push na brach main
    paths:
      - 'snyk/app/**'  # Aciona o fluxo de trabalho quando houver alterações no diretório 'snyk/app'
  pull_request:
    branches:
      - main # Aciona o fluxo de trabalho quando houver PR na brach main
    paths:
      - 'snyk/app/**'  # Aciona o fluxo de trabalho quando houver alterações no diretório 'snyk/app'
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
        run: snyk auth ${{ secrets.SNYK_TOKEN }} # Autent
      
      - name: Run Snyk test # Executa o teste de segurança com o Snyk
        run: snyk test --docker snyk-python:latest --file=snyk/python/Dockerfile

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