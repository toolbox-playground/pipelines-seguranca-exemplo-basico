# Exemplos Básicos de Checkov

![Toolbox Playground](../img/toolbox-playground.png)

O Checkov analisa e fornece relatórios sobre possíveis problemas de segurança em seus arquivos de configuração. As políticas que o Checkov verifica no Terraform encontram-se no seguinte link: [https://www.checkov.io/5.Policy%20Index/terraform.html](https://www.checkov.io/5.Policy%20Index/terraform.html)

Neste exemplo o Checkov irá analisar o arquivo [main.tf](./tf/main.tf) que possui o seguinte conteudo:
```
resource "google_storage_bucket" "my_bucket" {
  name     = "my-bucket"
  location = "us-central1"
  project  = "toolbox-playground"

  logging {
    log_bucket = "my-logs-bucket"
  }

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true

  public_access_prevention = "enforced"

}
```

## Uso

Você pode usar o Checkov localmente ou utilizar o workflow do GitHub Actions.

### Uso do Checkov localmente

Para utilizar o Checkov com venv e instalar as dependências a partir de um arquivo `requirements.txt`, siga os passos abaixo:

1. Certifique-se de ter o Python instalado em sua máquina. Você pode verificar a versão do Python digitando o seguinte comando no terminal:

    ```bash
    python --version
    ```

    Se o Python não estiver instalado, faça o download e a instalação a partir do site oficial do Python: [Link do site oficial do Python](https://www.python.org/)

2. Crie um ambiente virtual (venv) para isolar as dependências do projeto. No terminal, execute o seguinte comando:

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

    Isso instalará todas as dependências listadas no arquivo `requirements.txt`, incluindo o Checkov.

5. Navegue até o diretório do seu projeto onde se encontram os arquivos do Terraform, no nosso caso é [checkov/tf](./tf/), e execute o Checkov usando o seguinte comando:

    ```bash
    checkov -d .
    ```

6. Analise os resultados fornecidos pelo Checkov e faça as correções necessárias em seus arquivos de configuração.

Com esses passos, você poderá usar o Checkov com venv e instalar as dependências a partir do arquivo `requirements.txt` para verificar a segurança de seus arquivos de configuração.

### Uso do Checkov no Actions do GitHub

Para utilizar o Checkov no GitHub Actions, siga os passos abaixo:

1. Certifique-se de ter um repositório configurado no GitHub que contenha os arquivos de configuração do Terraform que deseja verificar com o Checkov.

2. Crie um arquivo de fluxo de trabalho (workflow) no seu repositório. Você pode criar um arquivo chamado [.github/workflows/checkov.yml](../.github/workflows/checkov.yaml) e adicionar o seguinte conteúdo:

```yaml
name: Terraform Security Check with Checkov
on:
  push:
    branches:
      - main
    paths:
      - 'checkov/tf/**'  # Aciona o fluxo de trabalho quando houver alterações no diretório 'checkov/tf'
  pull_request:
    branches:
      - main
    paths:
      - 'checkov/tf/**'  # Aciona o fluxo de trabalho quando houver alterações no diretório 'checkov/tf'
  workflow_dispatch:  # Aciona manualmente o fluxo de trabalho
    inputs:  # Define as entradas para o fluxo de trabalho
      name:  # Define a entrada "name"
        description: 'Acionador manual do Fluxo de Trabalho'  # Descrição da entrada

jobs:
  checkov-scan:
    runs-on: ubuntu-latest  # Executa o trabalho na versão mais recente do Ubuntu

    steps:
      - name: Checkout do Repositório  # Passo para fazer checkout do repositório
        uses: actions/checkout@v2  # Usa a ação 'actions/checkout' para fazer checkout do repositório

      - name: Set up Python 3.8
        uses: actions/setup-python@v4
        with:
          python-version: 3.8 # Define a versão do Python como 3.8

      - name: Test with Checkov
        id: checkov
        uses: bridgecrewio/checkov-action@master
        with:
          directory: checkov/tf # Define o diretório de verificação como 'checkov/tf'
          framework: terraform # Define o framework como Terraform

```

Este arquivo de fluxo de trabalho configura o Checkov para ser executado sempre que houver um push ou pull request na branch "main" do seu repositório alterando os arquivos presentes na pasta `checkov/tf`.

3. Faça um commit e push do arquivo de fluxo de trabalho para o seu repositório. Você pode também disparar o flxo de trabalho manualmente.

4. O GitHub Actions executará automaticamente o fluxo de trabalho e o Checkov analisará os arquivos de configuração do Terraform, fornecendo relatórios sobre possíveis problemas de segurança.

Com esses passos, você poderá utilizar o Checkov no GitHub Actions para verificar a segurança dos seus arquivos de configuração do Terraform.