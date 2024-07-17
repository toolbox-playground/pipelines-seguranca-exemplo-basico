# Exemplos Básicos de Checkov, Gitleaks, Snyk e Trivy

![Toolbox Playground](../img/toolbox-playground.png)

Este projeto tem como objetivo demonstrar exemplos básicos de configuração de segurança utilizando as ferramentas Checkov, Gitleaks, Snyk e Trivy.

## Uso

Você pode usar o Checkov localmente ou utilizar o workflow do GitHub Actions.

### Uso do Checkov localmente

Para utilizar o Checkov com venv e instalar as dependências a partir de um arquivo `requirements.txt`, siga os passos abaixo:

1. Certifique-se de ter o Python instalado em sua máquina. Você pode verificar a versão do Python digitando o seguinte comando no terminal:

    ```
    python --version
    ```

    Se o Python não estiver instalado, faça o download e a instalação a partir do site oficial do Python: [Link do site oficial do Python](https://www.python.org/)

2. Crie um ambiente virtual (venv) para isolar as dependências do projeto. No terminal, execute o seguinte comando:

    ```
    python -m venv myenv
    ```

    Isso criará um novo diretório chamado `myenv` que conterá o ambiente virtual.

3. Ative o ambiente virtual. No terminal, execute o seguinte comando:

    - No Windows:

    ```
    myenv\Scripts\activate
    ```

    - No macOS/Linux:

    ```
    source myenv/bin/activate
    ```

4. Instale as dependências do projeto a partir do arquivo `requirements.txt`. No terminal, execute o seguinte comando:

    ```
    pip install -r requirements.txt
    ```

    Isso instalará todas as dependências listadas no arquivo `requirements.txt`, incluindo o Checkov.

5. Navegue até o diretório do seu projeto, [tf](./tf/), e execute o Checkov usando o seguinte comando:

    ```
    checkov -d . --output json 
    ```

    O Checkov analisará o diretório atual e fornecerá relatórios sobre possíveis problemas de segurança em seus arquivos de configuração. As políticas que o Checkov verifica no Terraform encontram-se no seguinte link: [https://www.checkov.io/5.Policy%20Index/terraform.html](https://www.checkov.io/5.Policy%20Index/terraform.html)

6. Analise os resultados fornecidos pelo Checkov e faça as correções necessárias em seus arquivos de configuração.

Com esses passos, você poderá usar o Checkov com venv e instalar as dependências a partir do arquivo `requirements.txt` para verificar a segurança de seus arquivos de configuração.