import 'package:ar_flutter_plugin_2/datatypes/node_types.dart';
import 'package:ar_flutter_plugin_2/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin_2/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin_2/models/ar_node.dart';
import 'package:ar_flutter_plugin_2/datatypes/config_planedetection.dart';
import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin_2/ar_flutter_plugin.dart';
import 'package:vector_math/vector_math_64.dart' as vector;
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart';

//Cria a tela
class ARViewScreen extends StatefulWidget {
  const ARViewScreen({Key? key,  this.width, this.height}) : super(key: key);
  final double? width;
  final double? height;
  @override
  State<ARViewScreen> createState() => _ARViewScreenState();
}

class _ARViewScreenState extends State<ARViewScreen> {
  ARSessionManager? arSessionManager; //gerenciadores
  ARObjectManager? arObjectManager; //gerenciadores
  ARLocationManager? arLocationManager;
  ARAnchorManager? arAnchorManager;

  ARNode? selectedNode;
  List<ARNode> nodes = []; // guarda os objetos . // Saber quais objetos já estão na cena, para atualizar, mover ou excluir
  Map<String, ARNode> nodeMap = {};

  Map<String, String> modelosDiponiveis = {
    "cadeira": "assets/models/arm_chair__furniture/scene.gltf",
    "sofa": "assets/models/hamsah-hsm114/scene.gltf",
    "cama": "assets/models/ikea_idanas_single_bed/scene.gltf",
  };
  vector.Vector3? ultimaPosicaoToque;

  @override
  void dispose() {
    super.dispose();
    arSessionManager!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ARView mostra a camera com AR
      body: Stack(
          children: [
            ARView(
              onARViewCreated: onARViewCreated,
              planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
              showPlatformType: true,
            ),
            Positioned(
              top: 50,
              left: 20,
              child: ElevatedButton(
                  onPressed: () {
                      addObject(
                          assetPath: "assets/models/arm_chair__furniture/scene.gltf",);
                    },
                  child: Text("cadeira ")),
            ),
            Positioned(
              top: 100,
              left: 20,
              child: ElevatedButton(
                  onPressed: () {
                      addObject(
                          assetPath: "assets/models/ikea_idanas_single_bed/scene.gltf",);
                          //position: ultimaPosicaoToque!);
                  },
                  child: Text("cama ")),
            ),
            Positioned(
              top: 150,
              left: 20,
              child: ElevatedButton(
                  onPressed: () {
                      addObject(
                          assetPath: "assets/models/sofa_grey_fabric/scene.gltf",);
                  },
                  child: Text("sofa ")),
            ),
            Positioned(
              top: 200,
              left: 20,
              child: ElevatedButton(
                  onPressed: () {
                      addObject(
                          assetPath: "assets/models/simple_dining_table/scene.gltf");
                  },
                  child: Text("mesa ")),
            ),
          ]),
    );
  }

  //metedos da classe
  void onARViewCreated(ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager,) async {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;

    arSessionManager.onInitialize(
      showPlanes: true,         //Mostra os planos detectados no ambiente, como chão ou mesa.
      showFeaturePoints: false, //Oculta os pontos de características detectados pelo ARCore (pequenos pontos amarelos/brancos).
      showWorldOrigin: true,    //Mostra visualmente o ponto de origem do mundo 3D (eixos X, Y, Z).
      showAnimatedGuide: false,
      handlePans: true,         //ativa os gestos de movimento
      handleRotation: true,
    );


    this.arObjectManager!.onInitialize();
    this.arObjectManager!.onNodeTap = (List<String> nodeNames) {

      try {
        final tappedName = nodes[0].name;
        selectedNode = nodes[0];
        print('✅ Objeto selecionado: ${tappedName}');
      } catch (e) {
        print('❌ Erro ao selecionar objeto: $e');
      }
    };
    this.arObjectManager!.onPanStart = onPanStarted; //Chamado quando o usuário começa a arrastar um objeto
    this.arObjectManager!.onPanChange = onPanChanged; //Chamado continuamente enquanto o usuário move o dedo
    this.arObjectManager!.onPanEnd = onPanEnded; //Chamado quando o usuário solta o dedo (fim do movimento).
  }
  void onPanStarted(String nodeName) {
    selectedNode = nodes[0];
    if (selectedNode != null) {
      print('🟢 Pan iniciado no objeto: $nodeName');
    } else {
      print('⚠️ Objeto $nodeName não encontrado');
    }
  }

  void onPanChanged(String nodeName) {
    print('🌀 Objeto em movimento: $nodeName');
  }
  void onPanEnded(String nodeName, Matrix4 newTransform) async {
    if (selectedNode != null && selectedNode!.name == nodeName) {
      await arObjectManager!.updateNode(
        selectedNode!,
        transformation: newTransform,
      );
      print('✅ Objeto $nodeName movido');
    }
  }



  // Metodo para Adicionando objetos  3d
  Future<void> addObject({required String assetPath}) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    //final nodeName = 'objeto_$timestamp'; // sempre único
    final nodeName = 'objeto_1';
    var newNode = ARNode(
        name: nodeName,
        type: NodeType.localGLTF2,
        uri: assetPath,
        scale: vector.Vector3(0.2, 0.2, 0.2),
        position: vector.Vector3(0.0, 0.0, -1.0),
        // Posição padrão à frente da câmera
        //rotation: vector.Vector4(1.0, 0.0, 0.0, 0.0)
        transformation: null,
    );
    bool? didAddLocalNode = await this.arObjectManager!.addNode(newNode); //addNode() retorna true se o objeto foi adicionado com sucesso, ou false/null se houve erro.
    if (didAddLocalNode == true) {
      nodes.add(newNode); //Armazena o objeto para usar depois
      nodeMap[nodeName] = newNode;
      print('✅ Objeto ${newNode.name} adicionado');
    }
  }

}



