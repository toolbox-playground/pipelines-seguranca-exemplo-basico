# Exemplos Básicos de Snyk

![Toolbox Playground](../img/toolbox-playground.png)

TruffleHog™ é uma ferramenta de verificação de segredos que investiga profundamente seus repositórios de código em busca de segredos, senhas e chaves sensíveis.

Para obter mais informações sobre o TruffleHog, visite a [página do TruffleHog](https://trufflesecurity.com/trufflehog?gclid=CjwKCAjwouexBhAuEiwAtW_Zx5IW87JNj97Ci7heFnA5ar6-DuNzT2Y5nIl9DuZ-FOUqx0Qg3vb9nxoClcEQAvD_BwE).

## Usage


```bash
docker run --rm -it -v "$PWD:/pwd" trufflesecurity/trufflehog:latest github
```

## Instalação

Várias opções estão disponíveis para você:

### Usuários do MacOS

```bash
brew install trufflehog
```

### Docker:

<sub><i>_Certifique-se de que o Docker esteja em execução antes de executar os comandos a seguir:_</i></sub>

#### &nbsp;&nbsp;&nbsp;&nbsp;Unix

```bash
docker run --rm -it -v "$PWD:/pwd" trufflesecurity/trufflehog:latest github --repo https://github.com/trufflesecurity/test_keys
```

#### &nbsp;&nbsp;&nbsp;&nbsp;Prompt de Comando do Windows

```bash
docker run --rm -it -v "%cd:/=\%:/pwd" trufflesecurity/trufflehog:latest github --repo https://github.com/trufflesecurity/test_keys
```

#### &nbsp;&nbsp;&nbsp;&nbsp;PowerShell do Windows

```bash
docker run --rm -it -v "${PWD}:/pwd" trufflesecurity/trufflehog github --repo https://github.com/trufflesecurity/test_keys
```

#### &nbsp;&nbsp;&nbsp;&nbsp;M1 e M2 Mac

```bash
docker run --platform linux/arm64 --rm -it -v "$PWD:/pwd" trufflesecurity/trufflehog:latest github --repo https://github.com/trufflesecurity/test_keys
```

### Versões binárias

```bash
Baixe e descompacte em https://github.com/trufflesecurity/trufflehog/releases
```

### Compilar a partir do código-fonte

```bash
git clone https://github.com/trufflesecurity/trufflehog.git
cd trufflehog; go install
```

### Usando script de instalação

```bash
curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -b /usr/local/bin
```

### Usando script de instalação, verifique a assinatura do checksum (requer a instalação do cosign)

```bash
curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -v -b /usr/local/bin
```

### Usando script de instalação para instalar uma versão específica

```bash
curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -b /usr/local/bin <ReleaseTag como v3.56.0>
```

# :closed_lock_with_key: Verificando os artefatos

Checksums são aplicados a todos os artefatos, e o arquivo de checksum resultante é assinado usando o cosign.

Você precisa da seguinte ferramenta para verificar a assinatura:

- [Cosign](https://docs.sigstore.dev/cosign/installation/)

As etapas de verificação são as seguintes:

1. Baixe os arquivos de artefato que você deseja e os seguintes arquivos da página de [releases](https://github.com/trufflesecurity/trufflehog/releases).

  - trufflehog\_{versão}\_checksums.txt
  - trufflehog\_{versão}\_checksums.txt.pem
  - trufflehog\_{versão}\_checksums.txt.sig

2. Verifique a assinatura:

  ```shell
  cosign verify-blob <caminho para trufflehog_{versão}_checksums.txt> \
  --certificate <caminho para trufflehog_{versão}_checksums.txt.pem> \
  --signature <caminho para trufflehog_{versão}_checksums.txt.sig> \
  --certificate-identity-regexp 'https://github\.com/trufflesecurity/trufflehog/\.github/workflows/.+' \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com"
  ```

3. Uma vez que a assinatura for confirmada como válida, você pode prosseguir para validar que as somas SHA256 estão alinhadas com o artefato baixado:

  ```shell
  sha256sum --ignore-missing -c trufflehog_{versão}_checksums.txt
  ```

Substitua `{versão}` pela versão dos arquivos baixados.

Alternativamente, se você estiver usando o script de instalação, passe a opção `-v` para realizar a verificação da assinatura. Isso requer que o binário Cosign esteja instalado antes de executar o script de instalação.

# :rocket: Início Rápido

## 1: Verificar um repositório apenas para segredos verificados

Comando:

```bash
trufflehog git https://github.com/trufflesecurity/test_keys --only-verified
```

<<<<<<< HEAD
## 2: Scan a GitHub Org for only verified secrets
=======
Saída esperada:

```
🐷🔑🐷  TruffleHog. Unearth your secrets. 🐷🔑🐷

Found verified result 🐷🔑
Detector Type: AWS
Decoder Type: PLAIN
Raw result: AKIAYVP4CIPPERUVIFXG
Line: 4
Commit: fbc14303ffbf8fb1c2c1914e8dda7d0121633aca
File: keys
Email: counter <counter@counters-MacBook-Air.local>
Repository: https://github.com/trufflesecurity/test_keys
Timestamp: 2022-06-16 10:17:40 -0700 PDT
...
```

## 2: Verificar uma organização do GitHub apenas para segredos verificados
>>>>>>> 1a996b2 (readme)

```bash
trufflehog github --org=trufflesecurity --only-verified
```

## 3: Verificar um repositório do GitHub apenas para chaves verificadas e obter saída JSON

Comando:

```bash
trufflehog git https://github.com/trufflesecurity/test_keys --only-verified --json
```

<<<<<<< HEAD
## 4: Scan a GitHub Repo + its Issues and Pull Requests
=======
Saída esperada:

```
{"SourceMetadata":{"Data":{"Git":{"commit":"fbc14303ffbf8fb1c2c1914e8dda7d0121633aca","file":"keys","email":"counter \u003ccounter@counters-MacBook-Air.local\u003e","repository":"https://github.com/trufflesecurity/test_keys","timestamp":"2022-06-16 10:17:40 -0700 PDT","line":4}}},"SourceID":0,"SourceType":16,"SourceName":"trufflehog - git","DetectorType":2,"DetectorName":"AWS","DecoderName":"PLAIN","Verified":true,"Raw":"AKIAYVP4CIPPERUVIFXG","Redacted":"AKIAYVP4CIPPERUVIFXG","ExtraData":{"account":"595918472158","arn":"arn:aws:iam::595918472158:user/canarytokens.com@@mirux23ppyky6hx3l6vclmhnj","user_id":"AIDAYVP4CIPPJ5M54LRCY"},"StructuredData":null}
...
```

## 4: Verificar um repositório do GitHub + suas Issues e Pull Requests
>>>>>>> 1a996b2 (readme)

```bash
trufflehog github --repo=https://github.com/trufflesecurity/test_keys --issue-comments --pr-comments
```

## 5: Verificar um bucket do S3 para chaves verificadas

```bash
trufflehog s3 --bucket=<nome-do-bucket> --only-verified
```

## 6: Verificar buckets do S3 usando funções IAM

```bash
trufflehog s3 --role-arn=<arn-da-função-iam>
```

## 7: Verificar um repositório do Github usando autenticação SSH no docker

```bash
docker run --rm -v "$HOME/.ssh:/root/.ssh:ro" trufflesecurity/trufflehog:latest git ssh://github.com/trufflesecurity/test_keys
```

## 8: Verificar arquivos ou diretórios individuais

```bash
trufflehog filesystem path/to/file1.txt path/to/file2.txt path/to/dir
```

## 9: Verificar buckets do GCS para segredos verificados

```bash
trufflehog gcs --project-id=<ID-do-projeto> --cloud-environment --only-verified
```

## 10: Verificar uma imagem Docker para segredos verificados

Use a opção `--image` várias vezes para verificar várias imagens.

```bash
trufflehog docker --image trufflesecurity/secrets --only-verified
```

## 11: Verificar no CI

Defina a opção `--since-commit` para o branch padrão que as pessoas mesclam (por exemplo, "main"). Defina a opção `--branch` para o nome do branch do PR (por exemplo, "feature-1"). Dependendo da plataforma CI/CD que você usa, esse valor pode ser extraído dinamicamente (por exemplo, [CIRCLE_BRANCH no Circle CI](https://circleci.com/docs/variables/) e [TRAVIS_PULL_REQUEST_BRANCH no Travis CI](https://docs.travis-ci.com/user/environment-variables/)). Se o repositório for clonado e o branch de destino já estiver verificado durante o fluxo de trabalho do CI/CD, então `--branch HEAD` deve ser suficiente. A opção `--fail` retornará um código de erro 183 se credenciais válidas forem encontradas.

```bash
trufflehog git file://. --since-commit main --branch feature-1 --only-verified --fail
```

## 12: Verificar um workspace do Postman

Use as opções `--workspace-id`, `--collection-id` e `--environment` várias vezes para verificar vários alvos.

```bash
trufflehog postman --token=<token-da-api-do-postman> --workspace-id=<ID-do-workspace>
```

## 13: Verificar um servidor Jenkins

```bash
trufflehog jenkins --url https://jenkins.example.com --username admin --password admin
```

## 14: Verificar um servidor Elasticsearch

### Verificar um cluster local

Existem duas maneiras de autenticar em um cluster local com o TruffleHog: (1) nome de usuário e senha, (2) token de serviço.

#### Conectar a um cluster local com nome de usuário e senha

```bash
trufflehog elasticsearch --nodes 192.168.14.3 192.168.14.4 --username truffle --password hog
```

#### Conectar a um cluster local com um token de serviço

```bash
trufflehog elasticsearch --nodes 192.168.14.3 192.168.14.4 --service-token ‘AAEWVaWM...Rva2VuaSDZ’
```

### Verificar um cluster do Elastic Cloud

Para verificar um cluster no Elastic Cloud, você precisará de um Cloud ID e uma chave de API.

```bash
trufflehog elasticsearch \
  --cloud-id 'search-prod:dXMtY2Vx...YjM1ODNlOWFiZGRlNjI0NA==' \
  --api-key 'MlVtVjBZ...ZSYlduYnF1djh3NG5FQQ=='
```

# :question: FAQ


- All I see is `🐷🔑🐷  TruffleHog. Unearth your secrets. 🐷🔑🐷` and the program exits, what gives?
  - That means no secrets were detected
- Why is the scan taking a long time when I scan a GitHub org
  - Unauthenticated GitHub scans have rate limits. To improve your rate limits, include the `--token` flag with a personal access token
- It says a private key was verified, what does that mean?
  - Check out our Driftwood blog post to learn how to do this, in short we've confirmed the key can be used live for SSH or SSL [Blog post](https://trufflesecurity.com/blog/driftwood-know-if-private-keys-are-sensitive/)
- Is there an easy way to ignore specific secrets?
  - If the scanned source [supports line numbers](https://github.com/trufflesecurity/trufflehog/blob/d6375ba92172fd830abb4247cca15e3176448c5d/pkg/engine/engine.go#L358-L365), then you can add a `trufflehog:ignore` comment on the line containing the secret to ignore that secrets.

# :newspaper: What's new in v3?

TruffleHog v3 is a complete rewrite in Go with many new powerful features.

- We've **added over 700 credential detectors that support active verification against their respective APIs**.
- We've also added native **support for scanning GitHub, GitLab, Docker, filesystems, S3, GCS, Circle CI and Travis CI**.
- **Instantly verify private keys** against millions of github users and **billions** of TLS certificates using our [Driftwood](https://trufflesecurity.com/blog/driftwood) technology.
- Scan binaries, documents, and other file formats
- Available as a GitHub Action and a pre-commit hook

## What is credential verification?

For every potential credential that is detected, we've painstakingly implemented programmatic verification against the API that we think it belongs to. Verification eliminates false positives. For example, the [AWS credential detector](pkg/detectors/aws/aws.go) performs a `GetCallerIdentity` API call against the AWS API to verify if an AWS credential is active.

# :memo: Usage

TruffleHog has a sub-command for each source of data that you may want to scan:

- git
- github
- gitlab
- docker
- s3
- filesystem (files and directories)
- syslog
- circleci
- travisci
- gcs (Google Cloud Storage)
- postman
- jenkins
- elasticsearch

Each subcommand can have options that you can see with the `--help` flag provided to the sub command:

```
$ trufflehog git --help
usage: TruffleHog git [<flags>] <uri>

Find credentials in git repositories.

Flags:
  -h, --help                Show context-sensitive help (also try --help-long and --help-man).
      --debug               Run in debug mode.
      --trace               Run in trace mode.
      --profile             Enables profiling and sets a pprof and fgprof server on :18066.
  -j, --json                Output in JSON format.
      --json-legacy         Use the pre-v3.0 JSON format. Only works with git, gitlab, and github sources.
      --github-actions      Output in GitHub Actions format.
      --concurrency=20           Number of concurrent workers.
      --no-verification     Don't verify the results.
      --only-verified       Only output verified results.
      --allow-verification-overlap
                                 Allow verification of similar credentials across detectors
      --filter-unverified   Only output first unverified result per chunk per detector if there are more than one results.
      --filter-entropy=FILTER-ENTROPY
                                 Filter unverified results with Shannon entropy. Start with 3.0.
      --config=CONFIG            Path to configuration file.
      --print-avg-detector-time
                                 Print the average time spent on each detector.
      --no-update           Don't check for updates.
      --fail                Exit with code 183 if results are found.
      --verifier=VERIFIER ...    Set custom verification endpoints.
      --custom-verifiers-only   Only use custom verification endpoints.
      --archive-max-size=ARCHIVE-MAX-SIZE
                                 Maximum size of archive to scan. (Byte units eg. 512B, 2KB, 4MB)
      --archive-max-depth=ARCHIVE-MAX-DEPTH
                                 Maximum depth of archive to scan.
      --archive-timeout=ARCHIVE-TIMEOUT
                                 Maximum time to spend extracting an archive.
      --include-detectors="all"  Comma separated list of detector types to include. Protobuf name or IDs may be used, as well as ranges.
      --exclude-detectors=EXCLUDE-DETECTORS
                                 Comma separated list of detector types to exclude. Protobuf name or IDs may be used, as well as ranges. IDs defined here take precedence over the include list.
      --version             Show application version.
  -i, --include-paths=INCLUDE-PATHS
                                 Path to file with newline separated regexes for files to include in scan.
  -x, --exclude-paths=EXCLUDE-PATHS
                                 Path to file with newline separated regexes for files to exclude in scan.
      --exclude-globs=EXCLUDE-GLOBS
                                 Comma separated list of globs to exclude in scan. This option filters at the `git log` level, resulting in faster scans.
      --since-commit=SINCE-COMMIT
                                 Commit to start scan from.
      --branch=BRANCH            Branch to scan.
      --max-depth=MAX-DEPTH      Maximum depth of commits to scan.
      --bare                Scan bare repository (e.g. useful while using in pre-receive hooks)

Args:
  <uri>  Git repository URL. https://, file://, or ssh:// schema expected.
```

For example, to scan a `git` repository, start with

```
trufflehog git https://github.com/trufflesecurity/trufflehog.git
```

## S3

The S3 source supports assuming IAM roles for scanning in addition to IAM users. This makes it easier for users to scan multiple AWS accounts without needing to rely on hardcoded credentials for each account.

The IAM identity that TruffleHog uses initially will need to have `AssumeRole` privileges as a principal in the [trust policy](https://aws.amazon.com/blogs/security/how-to-use-trust-policies-with-iam-roles/) of each IAM role to assume.

To scan a specific bucket using locally set credentials or instance metadata if on an EC2 instance:

```bash
trufflehog s3 --bucket=<bucket-name>
```

To scan a specific bucket using an assumed role:

```bash
trufflehog s3 --bucket=<bucket-name> --role-arn=<iam-role-arn>
```

Multiple roles can be passed as separate arguments. The following command will attempt to scan every bucket each role has permissions to list in the S3 API:

```bash
trufflehog s3 --role-arn=<iam-role-arn-1> --role-arn=<iam-role-arn-2>
```

Exit Codes:

- 0: No errors and no results were found.
- 1: An error was encountered. Sources may not have completed scans.
- 183: No errors were encountered, but results were found. Will only be returned if `--fail` flag is used.

## :octocat: TruffleHog Github Action

### General Usage

```
on:
  push:
    branches:
      - main
  pull_request:

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v4
      with:
        fetch-depth: 0
    - name: Secret Scanning
      uses: trufflesecurity/trufflehog@main
      with:
        extra_args: --only-verified
```

In the example config above, we're scanning for live secrets in all PRs and Pushes to `main`. Only code changes in the referenced commits are scanned. If you'd like to scan an entire branch, please see the "Advanced Usage" section below.

### Shallow Cloning

If you're incorporating TruffleHog into a standalone workflow and aren't running any other CI/CD tooling alongside TruffleHog, then we recommend using [Shallow Cloning](https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---depthltdepthgt) to speed up your workflow. Here's an example for how to do it:

```
...
      - shell: bash
        run: |
          if [ "${{ github.event_name }}" == "push" ]; then
            echo "depth=$(($(jq length <<< '${{ toJson(github.event.commits) }}') + 2))" >> $GITHUB_ENV
            echo "branch=${{ github.ref_name }}" >> $GITHUB_ENV
          fi
          if [ "${{ github.event_name }}" == "pull_request" ]; then
            echo "depth=$((${{ github.event.pull_request.commits }}+2))" >> $GITHUB_ENV
            echo "branch=${{ github.event.pull_request.head.ref }}" >> $GITHUB_ENV
          fi
      - uses: actions/checkout@v3
        with:
          ref: ${{env.branch}}
          fetch-depth: ${{env.depth}}
      - uses: trufflesecurity/trufflehog@main
        with:
          extra_args: --only-verified
...
```

Depending on the event type (push or PR), we calculate the number of commits present. Then we add 2, so that we can reference a base commit before our code changes. We pass that integer value to the `fetch-depth` flag in the checkout action in addition to the relevant branch. Now our checkout process should be much shorter.

### Canary detection

TruffleHog statically detects [https://canarytokens.org/](https://canarytokens.org/) and lets you know when they're present without setting them off. You can learn more here: [https://trufflesecurity.com/canaries](https://trufflesecurity.com/canaries)

![image](https://github.com/trufflesecurity/trufflehog/assets/52866392/74ace530-08c5-4eaf-a169-84a73e328f6f)

### Advanced Usage

```yaml
- name: TruffleHog
  uses: trufflesecurity/trufflehog@main
  with:
    # Repository path
    path:
    # Start scanning from here (usually main branch).
    base:
    # Scan commits until here (usually dev branch).
    head: # optional
    # Extra args to be passed to the trufflehog cli.
    extra_args: --debug --only-verified
```

If you'd like to specify specific `base` and `head` refs, you can use the `base` argument (`--since-commit` flag in TruffleHog CLI) and the `head` argument (`--branch` flag in the TruffleHog CLI). We only recommend using these arguments for very specific use cases, where the default behavior does not work.

#### Advanced Usage: Scan entire branch

```
- name: scan-push
        uses: trufflesecurity/trufflehog@main
        with:
          base: ""
          head: ${{ github.ref_name }}
          extra_args: --only-verified
```

## TruffleHog GitLab CI

### Example Usage

```yaml
stages:
  - security

security-secrets:
  stage: security
  allow_failure: false
  image: alpine:latest
  variables:
    SCAN_PATH: "." # Set the relative path in the repo to scan
  before_script:
    - apk add --no-cache git curl jq
    - curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -b /usr/local/bin
  script:
    - trufflehog filesystem "$SCAN_PATH" --only-verified --fail --json | jq
  rules:
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
```

In the example pipeline above, we're scanning for live secrets in all repository directories and files. This job runs only when the pipeline source is a merge request event, meaning it's triggered when a new merge request is created.

## Pre-commit Hook

TruffleHog can be used in a pre-commit hook to prevent credentials from leaking before they ever leave your computer.

**Key Usage Note:**

- **For optimal hook efficacy, execute `git add` followed by `git commit` separately.** This ensures TruffleHog analyzes all intended changes.
- **Avoid using `git commit -am`, as it might bypass pre-commit hook execution for unstaged modifications.**

An example `.pre-commit-config.yaml` is provided (see [pre-commit.com](https://pre-commit.com/) for installation).

```yaml
repos:
  - repo: local
    hooks:
      - id: trufflehog
        name: TruffleHog
        description: Detect secrets in your data.
        entry: bash -c 'trufflehog git file://. --since-commit HEAD --only-verified --fail'
        # For running trufflehog in docker, use the following entry instead:
        # entry: bash -c 'docker run --rm -v "$(pwd):/workdir" -i --rm trufflesecurity/trufflehog:latest git file:///workdir --since-commit HEAD --only-verified --fail'
        language: system
        stages: ["commit", "push"]
```

## Regex Detector (alpha)

TruffleHog supports detection and verification of custom regular expressions.
For detection, at least one **regular expression** and **keyword** is required.
A **keyword** is a fixed literal string identifier that appears in or around
the regex to be detected. To allow maximum flexibility for verification, a
webhook is used containing the regular expression matches.

TruffleHog will send a JSON POST request containing the regex matches to a
configured webhook endpoint. If the endpoint responds with a `200 OK` response
status code, the secret is considered verified.

**NB:** This feature is alpha and subject to change.

## Regex Detector Example

```yaml
# config.yaml
detectors:
  - name: HogTokenDetector
    keywords:
      - hog
    regex:
      hogID: '\b(HOG[0-9A-Z]{17})\b'
      hogToken: '[^A-Za-z0-9+\/]{0,1}([A-Za-z0-9+\/]{40})[^A-Za-z0-9+\/]{0,1}'
    verify:
      - endpoint: http://localhost:8000/
        # unsafe must be set if the endpoint is HTTP
        unsafe: true
        headers:
          - "Authorization: super secret authorization header"
```

## Verification Server Example (Python)

Unless you run a verification server, secrets found by the custom regex
detector will be unverified. Here is an example Python implementation of a
verification server for the above `config.yaml` file.

```python
import json
from http.server import BaseHTTPRequestHandler, HTTPServer

AUTH_HEADER = 'super secret authorization header'


class Verifier(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(405)
        self.end_headers()

    def do_POST(self):
        try:
            if self.headers['Authorization'] != AUTH_HEADER:
                self.send_response(401)
                self.end_headers()
                return

            # read the body
            length = int(self.headers['Content-Length'])
            request = json.loads(self.rfile.read(length))
            self.log_message("%s", request)

            # check the match, you'll need to implement validateToken, which takes an array of ID's and Secrets
            if not validateTokens(request['HogTokenDetector']['hogID'], request['HogTokenDetector']['hogSecret']):
                self.send_response(200)
                self.end_headers()
            else:
                # any other response besides 200
                self.send_response(406)
                self.end_headers()
        except Exception:
            self.send_response(400)
            self.end_headers()


with HTTPServer(('', 8000), Verifier) as server:
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
```

# :heart: Contributors

This project exists thanks to all the people who contribute. [[Contribute](CONTRIBUTING.md)].

<a href="https://github.com/trufflesecurity/trufflehog/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=trufflesecurity/trufflehog" />
</a>

# :computer: Contributing

Contributions are very welcome! Please see our [contribution guidelines first](CONTRIBUTING.md).

We no longer accept contributions to TruffleHog v2, but that code is available in the `v2` branch.

## Adding new secret detectors

We have published some [documentation and tooling to get started on adding new secret detectors](hack/docs/Adding_Detectors_external.md). Let's improve detection together!

# Use as a library

Currently, trufflehog is in heavy development and no guarantees can be made on
the stability of the public APIs at this time.

# License Change

Since v3.0, TruffleHog is released under a AGPL 3 license, included in [`LICENSE`](LICENSE). TruffleHog v3.0 uses none of the previous codebase, but care was taken to preserve backwards compatibility on the command line interface. The work previous to this release is still available licensed under GPL 2.0 in the history of this repository and the previous package releases and tags. A completed CLA is required for us to accept contributions going forward.