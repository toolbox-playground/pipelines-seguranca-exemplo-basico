# Exemplos Básicos de Trivy

![Toolbox Playground](../img/toolbox-playground.png)

Trivy é um scanner de segurança abrangente e versátil.
Trivy possui *scanners* que procuram por problemas de segurança e *alvos* onde ele pode encontrar esses problemas.

Alvos (o que o Trivy pode escanear):

- Imagem de contêiner
- Sistema de arquivos
- Repositório Git (remoto)
- Imagem de máquina virtual
- Kubernetes
- AWS

Scanners (o que o Trivy pode encontrar lá):

- Pacotes do sistema operacional e dependências de software em uso (SBOM)
- Vulnerabilidades conhecidas (CVEs)
- Problemas e configurações incorretas de IaC
- Informações sensíveis e segredos
- Licenças de software

Trivy suporta a maioria das linguagens de programação populares, sistemas operacionais e plataformas. Para uma lista completa, consulte a página de [Cobertura de Escaneamento](https://aquasecurity.github.io/trivy/latest/docs/coverage/).

Para saber mais, acesse a [página inicial do Trivy](https://trivy.dev/) para ver os destaques dos recursos ou o [site de documentação](https://github.com/aquasecurity/trivy) para obter informações detalhadas.

## Início rápido

### Obtenha o Trivy

O Trivy está disponível na maioria dos canais de distribuição comuns. A lista completa de opções de instalação está disponível na página de [Instalação](https://aquasecurity.github.io/trivy/v0.57/getting-started/installation/). Aqui estão alguns exemplos populares:

- `brew install trivy`
- `docker run aquasec/trivy`
- Baixe o binário em <https://github.com/aquasecurity/trivy/releases/latest/>
- Consulte a [Instalação](https://aquasecurity.github.io/trivy/v0.57/getting-started/installation/) para mais opções

O Trivy está integrado com muitas plataformas e aplicativos populares. A lista completa de integrações está disponível na página de [Ecossistema](https://aquasecurity.github.io/trivy/v0.57/ecosystem/). Aqui estão alguns exemplos populares:

- [GitHub Actions](https://github.com/aquasecurity/trivy-action)
- [Operador Kubernetes](https://github.com/aquasecurity/trivy-operator)
- [Plugin VS Code](https://github.com/aquasecurity/trivy-vscode-extension)
- Consulte o [Ecossistema](https://aquasecurity.github.io/trivy/v0.57/ecosystem/) para mais opções

### Uso geral

```bash
trivy <alvo> [--scanners <scanner1,scanner2>] <assunto>
```

Exemplos:

```bash
trivy image python:3.4-alpine
```

```bash
trivy fs --scanners vuln,secret,misconfig myproject/
```

```bash
trivy k8s --report summary cluster
```

## :octocat: Integração com GitHub Actions

O Trivy pode ser facilmente integrado com GitHub Actions para automatizar a verificação de segurança em seu fluxo de trabalho de CI/CD. 

Aqui está um exemplo de configuração:

```yaml
name: Secrets Check with Trivy
on:
  push:
    branches:
      - main  # Aciona o fluxo de trabalho quando houver push na brach main
    paths:
      - 'trivy/python'  # Aciona o fluxo de trabalho quando houver push na pasta trivy
  pull_request:
    branches:
      - main # Aciona o fluxo de trabalho quando houver PR na brach main
    paths:
      - 'trivy/python'  # Aciona o fluxo de trabalho quando houver PR na pasta trivy
  workflow_dispatch:  # Aciona manualmente o fluxo de trabalho
    inputs:  # Define entradas para o fluxo de trabalho
      name:  # Define a entrada "name"
        description: 'Acionador manual do fluxo de trabalho'  # Descrição da entrada
jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code # Ação para clonar o repositório
        uses: actions/checkout@v4 # Usa a ação para clonar o repositório
        
      - name: Docker Build # Constrói a imagem Docker
        run: docker build -t trivy-python:latest -f trivy/python/Dockerfile trivy/python # Constrói a imagem Docker

      - name: Run Trivy vulnerability scanner in repo mode
        uses: aquasecurity/trivy-action@0.20.0 # Usa a ação para executar o scanner de vulnerabilidades Trivy
        with:
          scan-type: 'image' # Define o tipo de verificação
          image-ref: 'trivy-python:latest' # Define a referência da imagem

```

No exemplo de configuração acima, estamos verificando a segurança da imagem gerada, **trivy-python:latest**.

O arquivo [trivy.yaml](../.github/workflows/trivy.yaml) usa o exemplo acima.