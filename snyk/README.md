# Exemplos Básicos de Snyk

![Toolbox Playground](../img/toolbox-playground.png)

O [Snyk](https://snyk.io/pt-BR/) é uma plataforma de segurança para desenvolvedores. Integrando-se diretamente a ferramentas de desenvolvimento, fluxos de trabalhos e pipelines de automação, a Snyk possibilita que as equipes encontrem, priorizem e corrijam mais facilmente vulnerabilidades em códigos, dependências, contêineres e infraestrutura como código. Com o suporte do melhor aplicativo do setor e inteligência em segurança, a Snyk coloca a experiência em segurança no kit de ferramentas de todo desenvolvedor.

O Snyk tem suporte para as seguintes linguagens: Bazel, C, C++, Dart , Flutter, Elixir, Go, Java, Kotlin, Javascript, .NET, PHP, Python, Ruby, Swift, Typescript e VB.NET. Para saber mais, acesse este [link](https://docs.snyk.io/supported-languages-package-managers-and-frameworks).

## Usos para o Snyk

Proteja seu código: use o [Snyk Open Source](https://docs.snyk.io/scan-using-snyk/snyk-open-source) para corrigir vulnerabilidades em suas dependências de código aberto e o Snyk Code para corrigir vulnerabilidades em seu código-fonte.

Proteja seus containers: use o [Snyk Container](https://docs.snyk.io/scan-using-snyk/snyk-container) para corrigir vulnerabilidades em imagens de containers e aplicações Kubernetes.

Proteja sua infraestrutura: use o [Snyk Infrastructure as Code (IaC)](https://docs.snyk.io/scan-using-snyk/snyk-iac/scan-your-iac-source-code) para corrigir configurações incorretas em templates do Terraform, CloudFormation, Kubernetes e Azure. Use o IaC+ para corrigir configurações incorretas em contas da Amazon Web Services, assinaturas da Microsoft Azure e projetos do Google Cloud.

## Uso deste Lab

1. Certifique-se de ter o Python instalado em sua máquina. Você pode verificar a versão do Python digitando o seguinte comando no terminal:

    ```bash
    python --version
    ```

    Se o Python não estiver instalado, faça o download e a instalação a partir do site oficial do Python: [Link do site oficial do Python](https://www.python.org/)

2. Dentro do diretório [python](./python/), crie um ambiente virtual (venv) para isolar as dependências do projeto. No terminal, execute o seguinte comando:

    ```bash
    python -m venv myenv
    ```

    Isso criará um novo diretório chamado `myenv` que conterá o ambiente virtual.

3. Ative o ambiente virtual. No terminal, execute o seguinte comando:

    - No Windows:

    ```bash
    myenv\Scripts\activate
    ```

    - No macOS/Linux:

    ```bash
    source myenv/bin/activate
    ```

4. Instale as dependências do projeto a partir do arquivo `requirements.txt`. No terminal, execute o seguinte comando:

    ```bash
    pip install -r requirements.txt
    ```

## Primeiros passos

1. **Crie uma conta**: Acesse o site do [Snyk](https://app.snyk.io/signup) e crie uma conta.

2. **Token**: Após criar a conta, vá até [Account Settings](https://app.snyk.io/account) e copie o **Auth Token** para ser usado abaixo.

## Uso do Snyk com Docker

1. Certifique-se de ter o Docker instalado em sua máquina. Você pode baixar e instalar o Docker a partir do site oficial: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/).

2. Rode o seguinte comando, substituindo o `SEU_SNYK_TOKEN` pelo **Auth Token**, **/caminho/para/seu/repositorio** pelo caminho onde se encontra o seu código.

```bash
docker run --rm \
-e SNYK_TOKEN=SEU_SNYK_TOKEN \
-v /caminho/para/seu/repositorio:/app \
snyk/snyk:python snyk test \
--all-projects=true
```

4. Após rodar o comando acima, o Snyk irá testar o código.

## Uso do CLI Snyk

1. Certifique-se de ter o Nodejs instalado em sua máquina. Você pode baixar e instalar o Docker a partir do site oficial: [https://nodejs.org/pt/download/package-manager/current](https://nodejs.org/pt/download/package-manager/current).

2. Instale o pacote do Snyk com o seguinte comando:

```bash
npm install snyk -g
```

3. Após instalado, autentique usando o seu **Auth Token**:

```bash
snyk auth token
```

4. Após logado, rode o comando abaixo para testar o código:

```bash
snyk test /caminho/para/seu/repositorio --all-projects

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
  pull_request:
    branches:
      - main # Aciona o fluxo de trabalho quando houver PR na brach main
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

      - name: Install dependencies
        run: pip install -r requirements

      - name: Run Snyk to check for vulnerabilities # Executa o Snyk para verificar vulnerabilidades
        uses: snyk/actions/python@master # Usa a ação do Snyk para Python
        with: # Define os parâmetros da ação
          args: --all-projects # Veirifica todas as dependências do projeto
        env: # Define as variáveis de ambiente
          SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }} # Define o token do Snyk

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