# Pixel_home
Desing de interiores 
Projeto de realidade aumentada para o trabalho de faculdade 

Este projeto Flutter implementa uma aplicação de realidade aumentada  utilizando o plugin [`ar_flutter_plugin_2`]. O objetivo é permitir que objetos 3D sejam inseridos e interajam com o ambiente real por meio da câmera do dispositivo.


Tema:

O aplicativo foi desenvolvido com o tema de design de interiores, com o objetivo de permitir a visualização de objetos 3D em ambientes reais, como quartos, salas e superfícies diversas. A proposta é ajudar o usuário a entender como os móveis e itens decorativos ficariam dispostos no espaço físico.


Funcionalidades:

Detecção de superfície plana com ARCore
Inserção de objetos 3D em tempo real
Visualização do objeto em 360 graus 
Rastreamento espacial com âncoras


Tecnologias Utilizadas:

Flutter
Dart
ARCore


plugin necessarios:

ar_flutter_plugin_2: ^0.0.3
permission_handler
vector_math
json_annotation
geolocator


permissoes necessarias:

Câmera
internet 
Hardware


Instalação:

Dispositivo com suporte a ARCore
Para que o app funcione corretamente com essa versao do plugin, considere o android 11 ou superior. 
Android Studio


Exemplo de Uso:

O usuário deve esperar uns 15 segundos para que os pacotes sejam carregados. Apos isso ,aponte a câmera para uma superfície, toque no botao , e o objeto 3D aparece sobre ela


Referências
https://pub.dev/packages/ar_flutter_plugin_2
