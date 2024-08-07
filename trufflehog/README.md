# Exemplos Básicos de Trufflehog

![Toolbox Playground](../img/toolbox-playground.png)

[TruffleHog](https://trufflesecurity.com/trufflehog) é uma ferramenta de verificação de segredos que investiga profundamente seus repositórios de código em busca de segredos, senhas e chaves sensíveis.

Para obter mais informações sobre o TruffleHog, visite a [página do TruffleHog](https://trufflesecurity.com/trufflehog?gclid=CjwKCAjwouexBhAuEiwAtW_Zx5IW87JNj97Ci7heFnA5ar6-DuNzT2Y5nIl9DuZ-FOUqx0Qg3vb9nxoClcEQAvD_BwE).

## Instalação

Várias opções estão disponíveis para você:

### Usuários do MacOS

```bash
brew install trufflehog
```

### Uso com Docker

<sub><i>_Certifique-se de que o Docker esteja em execução antes de executar os comandos a seguir:_</i></sub>

#### Unix

```bash
docker run --rm -it -v "$PWD:/pwd" trufflesecurity/trufflehog:latest github --repo https://github.com/trufflesecurity/test_keys
```

#### Prompt de Comando do Windows

```bash
docker run --rm -it -v "%cd:/=\%:/pwd" trufflesecurity/trufflehog:latest github --repo https://github.com/trufflesecurity/test_keys
```

#### PowerShell do Windows

```bash
docker run --rm -it -v "${PWD}:/pwd" trufflesecurity/trufflehog github --repo https://github.com/trufflesecurity/test_keys
```

#### M1 e M2 Mac

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

### Início Rápido

#### 1: Verificar um repositório apenas para segredos verificados

Caso opte por usar o Docker, substitua o comando `trufflehog` pelos comandos exemplificados na seção [Uso com Docker](#uso-com-docker)

Comando:

```bash
trufflehog git https://github.com/trufflesecurity/test_keys --only-verified
```

## 2: Verificar uma organização do GitHub apenas para segredos verificados

```bash
trufflehog github --org=trufflesecurity --only-verified
```

## 3: Verificar um repositório do GitHub apenas para chaves verificadas e obter saída JSON

Comando:

```bash
trufflehog git https://github.com/trufflesecurity/test_keys --only-verified --json
```

## 4: Scan a GitHub Repo + its Issues and Pull Requests

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

## O que é verificação de credenciais?

Para cada credencial em potencial que é detectada, implementamos cuidadosamente a verificação programática contra a API à qual acreditamos que ela pertence. A verificação elimina falsos positivos. Por exemplo, o detector de credenciais da AWS realiza uma chamada de API `GetCallerIdentity` contra a API da AWS para verificar se uma credencial da AWS está ativa.


# Uso

TruffleHog possui um subcomando para cada fonte de dados que você pode querer escanear:

- git
- github
- gitlab
- docker
- s3
- filesystem (arquivos e diretórios)
- syslog
- circleci
- travisci
- gcs (Google Cloud Storage)
- postman
- jenkins
- elasticsearch

Cada subcomando pode ter opções que você pode ver com a flag `--help` fornecida ao subcomando:

```
$ trufflehog git --help
usage: TruffleHog git [<flags>] <uri>

Encontre credenciais nos repositórios git.

Flags:
  -h, --help                Mostra ajuda sensível ao contexto (tente também --help-long e --help-man).
      --debug               Executa no modo de depuração.
      --trace               Executa no modo de rastreamento.
      --profile             Ativa o perfilamento e define um servidor pprof e fgprof em :18066.
  -j, --json                Saída no formato JSON.
      --json-legacy         Usa o formato JSON pré-v3.0. Funciona apenas com fontes git, gitlab e github.
      --github-actions      Saída no formato GitHub Actions.
      --concurrency=20           Número de trabalhadores simultâneos.
      --no-verification     Não verifica os resultados.
      --only-verified       Apenas exibe resultados verificados.
      --allow-verification-overlap
                                 Permite a verificação de credenciais semelhantes em detectores diferentes.
      --filter-unverified   Apenas exibe o primeiro resultado não verificado por fragmento por detector, se houver mais de um resultado.
      --filter-entropy=FILTER-ENTROPY
                                 Filtra resultados não verificados com entropia de Shannon. Comece com 3.0.
      --config=CONFIG            Caminho para o arquivo de configuração.
      --print-avg-detector-time
                                 Exibe o tempo médio gasto em cada detector.
      --no-update           Não verifica atualizações.
      --fail                Sai com o código 183 se forem encontrados resultados.
      --verifier=VERIFIER ...    Define pontos de verificação personalizados.
      --custom-verifiers-only   Usa apenas pontos de verificação personalizados.
      --archive-max-size=ARCHIVE-MAX-SIZE
                                 Tamanho máximo do arquivo para verificação. (Unidades de bytes, por exemplo, 512B, 2KB, 4MB)
      --archive-max-depth=ARCHIVE-MAX-DEPTH
                                 Profundidade máxima do arquivo para verificação.
      --archive-timeout=ARCHIVE-TIMEOUT
                                 Tempo máximo para extrair um arquivo.
      --include-detectors="all"  Lista separada por vírgulas de tipos de detectores a serem incluídos. Pode-se usar o nome ou IDs do Protobuf, bem como intervalos.
      --exclude-detectors=EXCLUDE-DETECTORS
                                 Lista separada por vírgulas de tipos de detectores a serem excluídos. Pode-se usar o nome ou IDs do Protobuf, bem como intervalos. Os IDs definidos aqui têm precedência sobre a lista de inclusão.
      --version             Mostra a versão do aplicativo.
  -i, --include-paths=INCLUDE-PATHS
                                 Caminho para o arquivo com expressões regulares separadas por nova linha para arquivos a serem incluídos na verificação.
  -x, --exclude-paths=EXCLUDE-PATHS
                                 Caminho para o arquivo com expressões regulares separadas por nova linha para arquivos a serem excluídos na verificação.
      --exclude-globs=EXCLUDE-GLOBS
                                 Lista separada por vírgulas de globos a serem excluídos na verificação. Essa opção filtra no nível do `git log`, resultando em verificações mais rápidas.
      --since-commit=SINCE-COMMIT
                                 Commit para iniciar a verificação.
      --branch=BRANCH            Branch para verificação.
      --max-depth=MAX-DEPTH      Profundidade máxima de commits para verificação.
      --bare                Verifica repositório nu (por exemplo, útil ao usar em ganchos pré-receber)

Args:
  <uri>  URL do repositório Git. Esperado esquema https://, file:// ou ssh://.
```

Por exemplo, para verificar um repositório `git`, comece com

```
trufflehog git https://github.com/trufflesecurity/trufflehog.git
```

## S3

A fonte S3 suporta a suposição de funções IAM para verificação, além de usuários IAM. Isso facilita a verificação de várias contas da AWS sem a necessidade de depender de credenciais codificadas para cada conta.

A identidade IAM que o TruffleHog usa inicialmente precisará ter privilégios de "AssumeRole" como um principal na [política de confiança](https://aws.amazon.com/blogs/security/how-to-use-trust-policies-with-iam-roles/) de cada função IAM a ser assumida.

Para verificar um bucket específico usando credenciais definidas localmente ou metadados de instância se estiver em uma instância EC2:

```bash
trufflehog s3 --bucket=<nome-do-bucket>
```

Para verificar um bucket específico usando uma função assumida:

```bash
trufflehog s3 --bucket=<nome-do-bucket> --role-arn=<arn-da-função-iam>
```

Várias funções podem ser passadas como argumentos separados. O comando a seguir tentará verificar todos os buckets para os quais cada função tem permissões de listagem na API do S3:

```bash
trufflehog s3 --role-arn=<arn-da-função-iam-1> --role-arn=<arn-da-função-iam-2>
```

Códigos de Saída:

- 0: Sem erros e nenhum resultado foi encontrado.
- 1: Um erro foi encontrado. As fontes podem não ter concluído as verificações.
- 183: Nenhum erro foi encontrado, mas resultados foram encontrados. Será retornado apenas se a opção `--fail` for usada.

## :octocat: Ação do GitHub TruffleHog

### Uso Geral

```yaml
name: Secrets Check with Trufflehog
on:
  push:
    branches:
      - main  # Aciona o fluxo de trabalho quando houver push na brach main
    paths:
      - 'trufflehog/python'  # Aciona o fluxo de trabalho quando houver push na pasta trufflehog
  pull_request:
    branches:
      - main # Aciona o fluxo de trabalho quando houver PR na brach main
    paths:
      - 'trufflehog/python'  # Aciona o fluxo de trabalho quando houver PR na pasta trufflehog
  workflow_dispatch:  # Aciona manualmente o fluxo de trabalho
    inputs:  # Define entradas para o fluxo de trabalho
      name:  # Define a entrada "name"
        description: 'Acionador manual do fluxo de trabalho'  # Descrição da entrada

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code # Ação para clonar o repositório
      uses: actions/checkout@v4 # Usa a ação para clonar o repositório
      
    - name: Docker Build
      run: docker build -t trufflehog-python:latest -f trufflehog/python/Dockerfile trufflehog/python # Constrói a imagem Docker

    - name: Secret Scanning
      run: docker run --rm -v "$PWD:/pwd" trufflesecurity/trufflehog:latest docker --image trufflehog-python:latest --only-verified # Executa a verificação de segredos

```

No exemplo de configuração acima, estamos verificando segredos na imagem docker gerada, **trufflehog-python:latest**.

O arquivo [trufflehog.yaml](../.github/workflows/trufflehog.yaml) usa o exemplo acima.

### Clonagem Rasa

Se você estiver incorporando o TruffleHog em um fluxo de trabalho independente e não estiver executando nenhuma outra ferramenta de CI/CD junto com o TruffleHog, recomendamos o uso da [Clonagem Rasa](https://git-scm.com/docs/git-clone#Documentation/git-clone.txt---depthltdepthgt) para acelerar seu fluxo de trabalho. Aqui está um exemplo de como fazer isso:

```yaml
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

Dependendo do tipo de evento (push ou PR), calculamos o número de commits presentes. Em seguida, adicionamos 2, para que possamos fazer referência a um commit base antes das alterações de código. Passamos esse valor inteiro para a flag `fetch-depth` na ação de checkout, além do branch relevante. Agora, nosso processo de checkout deve ser muito mais curto.

### Detecção de canário

O TruffleHog detecta estaticamente [https://canarytokens.org/](https://canarytokens.org/) e informa quando eles estão presentes sem ativá-los. Você pode saber mais aqui: [https://trufflesecurity.com/canaries](https://trufflesecurity.com/canaries)

![image](https://github.com/trufflesecurity/trufflehog/assets/52866392/74ace530-08c5-4eaf-a169-84a73e328f6f)

### Uso Avançado

```yaml
- name: TruffleHog
  uses: trufflesecurity/trufflehog@main
  with:
    # Caminho do repositório
    path:
    # Iniciar a verificação a partir daqui (geralmente o branch principal).
    base:
    # Verificar commits até aqui (geralmente o branch de desenvolvimento).
    head: # opcional
    # Argumentos extras a serem passados para o CLI do trufflehog.
    extra_args: --debug --only-verified
```

Se você deseja especificar refs específicos `base` e `head`, você pode usar o argumento `base` (flag `--since-commit` no CLI do TruffleHog) e o argumento `head` (flag `--branch` no CLI do TruffleHog). Recomendamos o uso desses argumentos apenas para casos de uso muito específicos, onde o comportamento padrão não funciona.

#### Uso Avançado: Verificar o branch inteiro

```yaml
- name: scan-push
        uses: trufflesecurity/trufflehog@main
        with:
          base: ""
          head: ${{ github.ref_name }}
          extra_args: --only-verified
```

## TruffleHog GitLab CI

### Exemplo de Uso

```yaml
stages:
  - segurança

segredos-de-segurança:
  stage: segurança
  allow_failure: false
  image: alpine:latest
  variables:
    SCAN_PATH: "." # Defina o caminho relativo no repositório a ser verificado
  before_script:
    - apk add --no-cache git curl jq
    - curl -sSfL https://raw.githubusercontent.com/trufflesecurity/trufflehog/main/scripts/install.sh | sh -s -- -b /usr/local/bin
  script:
    - trufflehog filesystem "$SCAN_PATH" --only-verified --fail --json | jq
  rules:
    - if: '$CI_PIPELINE_SOURCE == "merge_request_event"'
```

No exemplo de pipeline acima, estamos verificando segredos em todos os diretórios e arquivos do repositório. Esse job é executado apenas quando a origem do pipeline é um evento de solicitação de merge, ou seja, é acionado quando uma nova solicitação de merge é criada.

## Hook Pré-commit

O TruffleHog pode ser usado em um hook pré-commit para evitar vazamentos de credenciais antes mesmo de saírem do seu computador.

**Observação importante sobre o uso:**

- **Para obter a eficácia ideal do hook, execute `git add` seguido de `git commit` separadamente.** Isso garante que o TruffleHog analise todas as alterações pretendidas.
- **Evite usar `git commit -am`, pois isso pode ignorar a execução do hook pré-commit para modificações não confirmadas.**

Um exemplo de `.pre-commit-config.yaml` é fornecido (consulte [pre-commit.com](https://pre-commit.com/) para instalação).

```yaml
repos:
  - repo: local
    hooks:
      - id: trufflehog
        name: TruffleHog
        description: Detecta segredos em seus dados.
        entry: bash -c 'trufflehog git file://. --since-commit HEAD --only-verified --fail'
        # Para executar o trufflehog em um contêiner Docker, use a seguinte entrada em vez disso:
        # entry: bash -c 'docker run --rm -v "$(pwd):/workdir" -i --rm trufflesecurity/trufflehog:latest git file:///workdir --since-commit HEAD --only-verified --fail'
        language: system
        stages: ["commit", "push"]
```

## Detector de Regex (alfa)

O TruffleHog suporta a detecção e verificação de expressões regulares personalizadas.
Para a detecção, é necessário pelo menos uma **expressão regular** e uma **palavra-chave**.
Uma **palavra-chave** é uma string literal fixa que aparece na ou ao redor
da regex a ser detectada. Para permitir a máxima flexibilidade para a verificação, é
usado um webhook contendo as correspondências da expressão regular.

O TruffleHog enviará uma solicitação POST JSON contendo as correspondências da regex para um
endpoint de webhook configurado. Se o endpoint responder com um código de status `200 OK`,
o segredo será considerado verificado.

**Observação:** Este recurso está em fase alfa e está sujeito a alterações.

## Exemplo de Detector de Regex

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
        # unsafe deve ser definido se o endpoint for HTTP
        unsafe: true
        headers:
          - "Authorization: super secret authorization header"
```

## Exemplo de Servidor de Verificação (Python)

A menos que você execute um servidor de verificação, os segredos encontrados pelo detector de regex personalizado não serão verificados. Aqui está um exemplo de implementação em Python de um servidor de verificação para o arquivo `config.yaml` acima.

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

            # ler o corpo
            length = int(self.headers['Content-Length'])
            request = json.loads(self.rfile.read(length))
            self.log_message("%s", request)

            # verificar a correspondência, você precisará implementar validateToken, que recebe uma matriz de IDs e Segredos
            if not validateTokens(request['HogTokenDetector']['hogID'], request['HogTokenDetector']['hogSecret']):
                self.send_response(200)
                self.end_headers()
            else:
                # qualquer outra resposta além de 200
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