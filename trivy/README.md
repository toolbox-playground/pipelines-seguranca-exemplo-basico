# Exemplos Básicos de Trivy

![Toolbox Playground](../img/toolbox-playground.png)

Trivy ([pronúncia][pronúncia]) é um scanner de segurança abrangente e versátil.
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

Trivy suporta a maioria das linguagens de programação populares, sistemas operacionais e plataformas. Para uma lista completa, consulte a página de [Cobertura de Escaneamento].

Para saber mais, acesse a [página inicial do Trivy][homepage] para ver os destaques dos recursos ou o [site de documentação][docs] para obter informações detalhadas.

## Início rápido

### Obtenha o Trivy

O Trivy está disponível na maioria dos canais de distribuição comuns. A lista completa de opções de instalação está disponível na página de [Instalação]. Aqui estão alguns exemplos populares:

- `brew install trivy`
- `docker run aquasec/trivy`
- Baixe o binário em <https://github.com/aquasecurity/trivy/releases/latest/>
- Consulte a [Instalação] para mais opções

O Trivy está integrado com muitas plataformas e aplicativos populares. A lista completa de integrações está disponível na página de [Ecossistema]. Aqui estão alguns exemplos populares:

- [GitHub Actions](https://github.com/aquasecurity/trivy-action)
- [Operador Kubernetes](https://github.com/aquasecurity/trivy-operator)
- [Plugin VS Code](https://github.com/aquasecurity/trivy-vscode-extension)
- Consulte o [Ecossistema] para mais opções

### Builds canary
Existem builds canary ([Docker Hub](https://hub.docker.com/r/aquasec/trivy/tags?page=1&name=canary), [GitHub](https://github.com/aquasecurity/trivy/pkgs/container/trivy/75776514?tag=canary), [ECR](https://gallery.ecr.aws/aquasecurity/trivy#canary)) e [binários](https://github.com/aquasecurity/trivy/actions/workflows/canary.yaml) gerados a cada push para o branch principal.

Por favor, esteja ciente: as builds canary podem ter bugs críticos, não é recomendado para uso em produção.

### Uso geral

```bash
trivy <alvo> [--scanners <scanner1,scanner2>] <assunto>
```

Exemplos:

```bash
trivy image python:3.4-alpine
```

<details>
<summary>Resultado</summary>

https://user-images.githubusercontent.com/1161307/171013513-95f18734-233d-45d3-aaf5-d6aec687db0e.mov

</details>

```bash
trivy fs --scanners vuln,secret,misconfig myproject/
```

<details>
<summary>Resultado</summary>

https://user-images.githubusercontent.com/1161307/171013917-b1f37810-f434-465c-b01a-22de036bd9b3.mov

</details>

```bash
trivy k8s --report summary cluster
```

<details>
<summary>Resultado</summary>

![k8s summary](docs/imgs/trivy-k8s.png)

</details>

## Perguntas frequentes

### Como pronunciar o nome "Trivy"?

`tri` é pronunciado como **tri**gger, `vy` é pronunciado como en**vy**.

## Quer mais? Confira Aqua

Se você gostou do Trivy, vai adorar o Aqua, que se baseia no Trivy para fornecer capacidades ainda mais aprimoradas para uma oferta completa de gerenciamento de segurança.
Você pode encontrar uma tabela de comparação de alto nível específica para usuários do Trivy [aqui](https://github.com/aquasecurity/resources/blob/main/trivy-aqua.md).
Além disso, confira o site <https://aquasec.com> para obter mais informações sobre nossos produtos e serviços.
Se você deseja entrar em contato com a Aqua ou solicitar uma demonstração, utilize este formulário: <https://www.aquasec.com/demo>

## Comunidade

O Trivy é um projeto de código aberto da [Aqua Security][aquasec].
Saiba mais sobre nosso trabalho de código aberto e portfólio [aqui][oss].
Entre em contato conosco sobre qualquer assunto abrindo uma discussão no GitHub [aqui][discussions].
Junte-se à nossa comunidade no [Slack][slack] para ficar atualizado com os esforços da comunidade.

Por favor, siga nosso [Código de Conduta][code-of-conduct] durante todas as interações.

[test]: https://github.com/aquasecurity/trivy/actions/workflows/test.yaml
[test-img]: https://github.com/aquasecurity/trivy/actions/workflows/test.yaml/badge.svg
[go-report]: https://goreportcard.com/report/github.com/aquasecurity/trivy
[go-report-img]: https://goreportcard.com/badge/github.com/aquasecurity/trivy
[release]: https://github.com/aquasecurity/trivy/releases
[release-img]: https://img.shields.io/github/release/aquasecurity/trivy.svg?logo=github
[github-downloads-img]: https://img.shields.io/github/downloads/aquasecurity/trivy/total?logo=github
[docker-pulls]: https://img.shields.io/docker/pulls/aquasec/trivy?logo=docker&label=docker%20pulls%20%2F%20trivy
[license]: https://github.com/aquasecurity/trivy/blob/main/LICENSE
[license-img]: https://img.shields.io/badge/License-Apache%202.0-blue.svg
[homepage]: https://trivy.dev
[docs]: https://aquasecurity.github.io/trivy
[pronúncia]: #como-pronunciar-o-nome-trivy
[slack]: https://slack.aquasec.com
[code-of-conduct]: https://github.com/aquasecurity/community/blob/main/CODE_OF_CONDUCT.md

[Instalação]:https://aquasecurity.github.io/trivy/latest/getting-started/installation/
[Ecossistema]: https://aquasecurity.github.io/trivy/latest/ecosystem/
[Cobertura de Escaneamento]: https://aquasecurity.github.io/trivy/latest/docs/coverage/

[alpine]: https://ariadne.space/2021/06/08/the-vulnerability-remediation-lifecycle-of-alpine-containers/
[rego]: https://www.openpolicyagent.org/docs/latest/#rego
[sigstore]: https://www.sigstore.dev/

[aquasec]: https://aquasec.com
[oss]: https://www.aquasec.com/products/open-source-projects/
[discussions]: https://github.com/aquasecurity/trivy/discussions