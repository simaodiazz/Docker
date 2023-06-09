# Docker

Docker é um plantaforma de código aberto que permite criar, distribuir e executar aplicativos em contêiners fechados.

## What are Containers?

Os `containers` no contexto do Docker são ambientes isolados e autosuficientes que permitem empacotar aplicativos e suas dependências em uma unidade portátil.
Um container inclui tudo o que é necessário para executar um aplicativo, como o código, as bibliotecas e as configurações.

# Why do we need Containers?

1. Containers permitem empacotar um aplicativo juntamente com suas depêndencias e configurações, criando uma unidade isolada. Isso garante que o aplicativo funcione de forma `consistente` em diferentes ambientes, desde a maquina de desenvolvimento até a produção. O que significa que podem ser executados em diferentes sistemas operativos tornando-se `versátil` e `portável`.

2. Os containers oferecem `isolamento` entre aplicativos, permitindo que eles sejam executados de forma independente uns dos outros no mesmo host.

3. Os containers são ``leves`` e consomem ``poucos recursos`` do sistema em comparação com outras formas de virtualização, como máquinas virtuais. Eles compartilham o kernel do sistema operativo hospedeiro. o que resulta em tempos de inicialização rápidos e um melhor aproveitamento dos recursos.

4. Os containers simplificam