# Docker

Docker é um plantaforma de código aberto que permite criar, distribuir e executar aplicativos em contêiners fechados.

## Introduction

### What is Virtualization?

Virtualização é uma tecnologia que permite a criação de ambientes virtuais em um único sistema fisico. Ela permite a execução de múltiplos sistemas operativos ou aplicativos em uma única máquina física, compartilhando eficientemente os recursos de hardware disponíveis.

### What are Containers?

Os `containers` no contexto do Docker são ambientes isolados e autosuficientes que permitem empacotar aplicativos e suas dependências em uma unidade portátil.
Um container inclui tudo o que é necessário para executar um aplicativo, como o código, as bibliotecas e as configurações.

### Why do we need Containers?

1. Containers permitem empacotar um aplicativo juntamente com suas depêndencias e configurações, criando uma unidade isolada. Isso garante que o aplicativo funcione de forma `consistente` em diferentes ambientes, desde a maquina de desenvolvimento até a produção. O que significa que podem ser executados em diferentes sistemas operativos tornando-se `versátil` e `portável`.

2. Os containers oferecem `isolamento` entre aplicativos, permitindo que eles sejam executados de forma independente uns dos outros no mesmo host.

3. Os containers são ``leves`` e consomem ``poucos recursos`` do sistema em comparação com outras formas de virtualização, como máquinas virtuais. Eles compartilham o kernel do sistema operativo hospedeiro. o que resulta em tempos de inicialização rápidos e um melhor aproveitamento dos recursos.

4. Os containers simplificam o processo de `empacotamento`, `distribuição` e `implementação` de um aplicativo, com o uso de `Imagens de Containers`.

5. Containers são essenciais para a adoção de práticas modernas de desenvolvimento de software, como `DevOps` e integração `contínua/entrega`. 

### Bare Metal vs VMs vs Containers

Bare Metal, Máquinas Virtuais e Containers são diferentes abordagens para a execução de aplicativos e têm características distintas.

1. `Bare Metal` é a execução direta do sistema operativo em um hardware físico, sem camadas adicionais de virtualização. Nesse cenário, o sistema operatcional tem acesso total aos recursos da máquina, como CPU, memória e armazenamento. O Bare Metal oferece alto desempenho pois não há sobrecarga adicional de `virtualização`. No entanto. não permite o isolamento e a `compartimentalização` de recursos.

2. `Maquinas Virtuais` são ambientes virtuais completos, que emulam um sistema operativo e executam aplicativos dentro dele. Cada VM possui seu próprio `sistema operativo`, `pilha de software` e `recrusos virtualizados` como `CPU` e `memória`. Elas são criadas e gerenciadas por um hypervisor, que permite a execução de várias VMs em um único host. As VMs oferecem isolamento completo entre si e podem ser executadas em diferentes sistemas operativos.

3. `Containers` fornecem isolamento leve em um nível de sistema operativo. Eles compartilham o kernel do sistema operativo do hospedeiro e têm acesso aos recursos do host, como CPU e a memória. Os cointainers contêm aplicativos e suas dependênciais, mas não emulam um sistema operacional completo. Eles são executados em um ambiente isolado e oferecem maior eficiência e velocidade de inicialização em comparação com as VMs.

### Docker and OCI

Docker e OCI (Open Container Initiative) são termos relacionados à tecnologia de containers.

Docker é uma plantaforma de código aberto que permite a criação, implantação e execução de aplicativos dentro de containers. Um container é uma unidade `isolada` e `portável` que contém tudo o que é necessário para executar um aplicativo, incluindo o código, as bibliotecas, as dependências e as configurações. O Docker simplifica o processo de empacotar um aplicativo e suas dependências em um container, garantido que ele seja executado em diferentes ambientes.

Por outro lado, a OCI é a iniciativa de código que visa criar padrões abertos e comuns para formatos de container e especificações de execução. O seu objetivo é establecer uma especificação comum que possa ser implementada por várias `soluções de containers`, promovendo a `interoperatibilidade` que se trata de diferentes sistemas se comunicarem e interagirem entre si de forma eficiente e sem problemas. Isso significa que diferentes sistemas ou aplicativos podem trocar informações, compartilhar dados e executar tarefas em conjunto, mesmo que tenham sido desenvolvidos por diferentes empresas ou adotem diferentes padrões tecnológicos.

A OCI possui duas principais especificações.

1. `OCI Image Specification` define o formato padrão para imagens de containers, permitindo que elas sejam criadas, distribuídas e executadas em qualquer ambiente compatível com a especificação.

2. `OCI Runtime Specification` descreve como um container deve ser executado e controlado, difinindo a interface entre o runtime do container e o sistema operativo do hospedeiro.

## Tecnologias subjacentes

As tecnologias subjacentes aos containers, como Docker e OCI, são compostas por diversos componentes.

### Namespaces

`Namespaces` são uma tecnologia do Kernel Linux que permite isolar e separar diferentes aspectos do ambiente de execução de um processo.

1. `PID` Namespace isola a visão dos processos. Isso quer dizer que um determinado namespace não pode acessar ou interagir com processos fora desse namespace. Isso permite que cada container tenha sua própria hierarquia.

2. `Network Namespace` isola a pilha de rede. Isso permite que cada container tenha sua própria configuração de rede.

3. `Mount Namespace` isola o sistema de arquivos. Isso permite que cada container tenha seu próprio sistema de arquivos.

4. `UTS Namespace` isola o hostname e o domínio do sistema. Permitindo que cada um tenha seu hostname e domínio de sistema.

5. `User Namespace` isola identidades e permissões de utilizador entre os processos de excução. Permitindo que cada um tenha seus processos de execução e permissões.

6. `IPC Namespace` isola os recursos de comunicação interprocessual entre os processos que é o mecanismo pelo qual os procesos em um sistema operacional compartilahm informações, trocam mensagens e coordenam suas atividades. É uma forma de comunicação entre diferentes processos em um mesmo sistema. Quando vários processos estão em execução simultaneamente, pode ser necessário que eles se comuniquem para trocar dados, cordenar ações ou sincronizar suas atividades.

    + `Pipe` é um canal de comunicação unidirecional entre processos. Um processo pode escrever dados em um lado e o outro processo só pode ler esses dados.

    + `Sockets` são uma interface de comunicação bidirecional que permite a troca de dados entre processos, mesmo em diferentes hosts em uma rede.

    + `Memória compartilhada` permite que vários processos acessem uma área de memória comum. Essa área de memória pode ser usada para compartilhar dados e trocar informações entre os processos de forma eficiente.

    + `Filas de mensagens` fornecem uma forma `assíncrona` de comunicação entre processos, onde os processos enviam mensagens para uma fila e outros processos recebem dessa fila.
 
    + `Sinais` são um mecanismo de comunicação `sincrona` são utilizados para notificar eventos ou ações entre processos.

#### How Docker use Namespaces?

O Docker utiliza namespaces extensivamente para fornecer isolamento de processos e controlo de recursos para containers.

### CGroups 
São uma funcionabilidade do Kernel Linux que permite controlar e limitar o uso de recursos, como CPU, memória, disco e rede, entre os processos em execução no sistema. É possível atribuir limites e prioridades aos recursos utilizados pelos containers, garantido que cada um não interfira negativamente no desempenho dos outros

1. Isolamento de Recursos refere-se à capacidade dos contêineres de serem executados em um ambiente isolado.

2. Limiting Resources refere-se à capacidade de definir limites para uso de recursos por parte dos contêineres.

3. Prioritizing Containers é a capacidade de atribuir prioridades diferentes a diferentes contêineres em termos de acesso e utilização de recursos.

4. Monitoring refere-se ao acompanhamento contínuo do uso de recursos pelos contêineres. Isso envolve coletar métricas e estatísticas sobre o consumo de CPU, memória, E/S de discord, rede e outros recursos relevantes.

### Union Filesystems

Os sistemas `Union Filesystems` são tecnologias que permitem combinar vários sitemas de arquivos em uma única visualização lógica, criando uma imagem de sistema de arquivos composta por várias camadas ou snapshots.

#### What is Snapshots?

Uma snapshot é uma representação imutável de um sistema de arquivos em um determinado momento. Ele preserva a integridade dos dados e permite que acesso ou restaure o sistema de arquivos em um estado específico, mesmo que o sistema orignal tenha sido modificado.