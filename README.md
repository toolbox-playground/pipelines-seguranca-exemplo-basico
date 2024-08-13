# Exemplos Básicos de Checkov, Gitleaks, Snyk, TruffleHog e Trivy

![Toolbox Playground](img/toolbox-playground.png)

Este projeto tem como objetivo demonstrar exemplos básicos de configuração de segurança utilizando as ferramentas Checkov, Gitleaks, Snyk, TruffleHog e Trivy.

### Checkov

Checkov é uma ferramenta de segurança de infraestrutura como código (IaC) que verifica se o código de infraestrutura está em conformidade com as melhores práticas de segurança. Neste projeto, você encontrará exemplos de como utilizar o Checkov para analisar e identificar possíveis problemas de segurança em seu código de infraestrutura.

### Gitleaks

Gitleaks é uma ferramenta de segurança que verifica repositórios Git em busca de informações sensíveis, como senhas, chaves de API e tokens de acesso. Neste projeto, você aprenderá como utilizar o Gitleaks para proteger seu repositório Git e evitar vazamentos de informações confidenciais.

### Snyk

Snyk é uma ferramenta de segurança de código aberto que ajuda a identificar e corrigir vulnerabilidades em suas dependências de código. Com o Snyk, você pode garantir que suas bibliotecas e pacotes estejam atualizados e livres de vulnerabilidades conhecidas. Neste projeto, você verá exemplos de como utilizar o Snyk para analisar e corrigir vulnerabilidades em suas dependências.

### TruffleHog

TruffleHog é uma ferramenta de segurança que verifica seus repositórios de código em busca de segredos e informações sensíveis. Ele procura por strings de alta entropia, como chaves de API, senhas e tokens de acesso, que podem ter sido acidentalmente commitados em seu sistema de controle de versão.

Ao usar o TruffleHog, você pode identificar e remover proativamente informações sensíveis de sua base de código, reduzindo o risco de violações de dados e acesso não autorizado.

### Trivy

Trivy é uma ferramenta de segurança de contêineres que verifica imagens de contêiner em busca de vulnerabilidades conhecidas. Com o Trivy, você pode garantir que suas imagens de contêiner estejam seguras e livres de vulnerabilidades conhecidas. Neste projeto, você encontrará exemplos de como utilizar o Trivy para analisar e corrigir vulnerabilidades em suas imagens de contêiner.

Esperamos que este projeto da Toolbox Playground seja útil para você aprender e explorar essas ferramentas de segurança. Fique à vontade para contribuir e compartilhar seus próprios exemplos básicos!

## Uso

1. Abra o terminal ou prompt de comando e navegue até um diretório de sua prefrência. Substitua `suapasta` pelo nome do seu diretório:
   ```bash
   cd suapasta
   ```

2.Clone este repositório para sua máquina local através do comando abaixo:
```bash
git clone https://github.com/toolbox-playground/pipelines-seguranca-exemplo-basico.git
```

3. Navegue até o diretório que você acabou de clonar.

   ```bash
    cd pipelines-seguranca-exemplo-basico
   ```

4. Escolha a pipeline de sua prefrência disponível:

- Checkov:

1. Navegue até o diretório BitBucket.
   ```bash
   cd checkov
   ```
2. Siga as instruções do [Checkov](./checkov/README.md).

- GitLeaks:

1. Navegue até o diretório GitLeaks.
   ```bash
   cd gitleaks
   ```
2. Siga as instruções do [GitLeaks](./gitleaks/README.md)

- Snyk:

1. Navegue até o diretório Snyk.
   ```bash
   cd snyk
   ```
2. Siga as instruções do [Snyk](./snyk/README.md)

- TruffleHog:

1. Navegue até o diretório Snyk.
   ```bash
   cd trufflehog
   ```
2. Siga as instruções do [TruffleHog](./trufflehog/README.md)

- Trivy:

1. Navegue até o diretório Trivy.
   ```bash
   cd trivy
   ```
2. Siga as instruções do [Trivy](./trivy/README.md)

## Contribuindo

Contribuições são bem-vindas! Por favor, leia o arquivo [CONTRIBUTING.md](CONTRIBUTING.md) para mais detalhes.

## Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo [LICENSE.md](LICENSE.md) para mais detalhes.