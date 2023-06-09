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