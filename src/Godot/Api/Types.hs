{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TemplateHaskell #-}
module Godot.Api.Types
       (HasBaseClass(..), GlobalConstants(..), ARVRAnchor(..),
        ARVRCamera(..), ARVRController(..), ARVRInterface(..),
        ARVRInterfaceGDNative(..), ARVROrigin(..),
        ARVRPositionalTracker(..), ARVRServer(..), AStar(..), AStar2D(..),
        AcceptDialog(..), AnimatedSprite(..), AnimatedSprite3D(..),
        AnimatedTexture(..), Animation(..), AnimationNode(..),
        AnimationNodeAdd2(..), AnimationNodeAdd3(..),
        AnimationNodeAnimation(..), AnimationNodeBlend2(..),
        AnimationNodeBlend3(..), AnimationNodeBlendSpace1D(..),
        AnimationNodeBlendSpace2D(..), AnimationNodeBlendTree(..),
        AnimationNodeOneShot(..), AnimationNodeOutput(..),
        AnimationNodeStateMachine(..),
        AnimationNodeStateMachinePlayback(..),
        AnimationNodeStateMachineTransition(..),
        AnimationNodeTimeScale(..), AnimationNodeTimeSeek(..),
        AnimationNodeTransition(..), AnimationPlayer(..),
        AnimationRootNode(..), AnimationTrackEditPlugin(..),
        AnimationTree(..), AnimationTreePlayer(..), Area(..), Area2D(..),
        ArrayMesh(..), AtlasTexture(..), AudioBusLayout(..),
        AudioEffect(..), AudioEffectAmplify(..),
        AudioEffectBandLimitFilter(..), AudioEffectBandPassFilter(..),
        AudioEffectChorus(..), AudioEffectCompressor(..),
        AudioEffectDelay(..), AudioEffectDistortion(..), AudioEffectEQ(..),
        AudioEffectEQ10(..), AudioEffectEQ21(..), AudioEffectEQ6(..),
        AudioEffectFilter(..), AudioEffectHighPassFilter(..),
        AudioEffectHighShelfFilter(..), AudioEffectInstance(..),
        AudioEffectLimiter(..), AudioEffectLowPassFilter(..),
        AudioEffectLowShelfFilter(..), AudioEffectNotchFilter(..),
        AudioEffectPanner(..), AudioEffectPhaser(..),
        AudioEffectPitchShift(..), AudioEffectRecord(..),
        AudioEffectReverb(..), AudioEffectSpectrumAnalyzer(..),
        AudioEffectSpectrumAnalyzerInstance(..),
        AudioEffectStereoEnhance(..), AudioServer(..), AudioStream(..),
        AudioStreamGenerator(..), AudioStreamGeneratorPlayback(..),
        AudioStreamMicrophone(..), AudioStreamOGGVorbis(..),
        AudioStreamPlayback(..), AudioStreamPlaybackResampled(..),
        AudioStreamPlayer(..), AudioStreamPlayer2D(..),
        AudioStreamPlayer3D(..), AudioStreamRandomPitch(..),
        AudioStreamSample(..), BackBufferCopy(..), BakedLightmap(..),
        BakedLightmapData(..), BaseButton(..), BitMap(..), BitmapFont(..),
        Bone2D(..), BoneAttachment(..), BoxContainer(..), BoxShape(..),
        BulletPhysicsDirectBodyState(..), BulletPhysicsServer(..),
        Button(..), ButtonGroup(..), CPUParticles(..), CPUParticles2D(..),
        CSGBox(..), CSGCombiner(..), CSGCylinder(..), CSGMesh(..),
        CSGPolygon(..), CSGPrimitive(..), CSGShape(..), CSGSphere(..),
        CSGTorus(..), Camera(..), Camera2D(..), CameraFeed(..),
        CameraServer(..), CameraTexture(..), CanvasItem(..),
        CanvasItemMaterial(..), CanvasLayer(..), CanvasModulate(..),
        CapsuleMesh(..), CapsuleShape(..), CapsuleShape2D(..),
        CenterContainer(..), CharFXTransform(..), CheckBox(..),
        CheckButton(..), CircleShape2D(..), ClippedCamera(..),
        CollisionObject(..), CollisionObject2D(..), CollisionPolygon(..),
        CollisionPolygon2D(..), CollisionShape(..), CollisionShape2D(..),
        ColorPicker(..), ColorPickerButton(..), ColorRect(..),
        ConcavePolygonShape(..), ConcavePolygonShape2D(..),
        ConeTwistJoint(..), ConfigFile(..), ConfirmationDialog(..),
        Container(..), Control(..), ConvexPolygonShape(..),
        ConvexPolygonShape2D(..), Crypto(..), CryptoKey(..), CubeMap(..),
        CubeMesh(..), Curve(..), Curve2D(..), Curve3D(..),
        CurveTexture(..), CylinderMesh(..), CylinderShape(..),
        DampedSpringJoint2D(..), DirectionalLight(..), DynamicFont(..),
        DynamicFontData(..), EditorExportPlugin(..),
        EditorFeatureProfile(..), EditorFileDialog(..),
        EditorFileSystem(..), EditorFileSystemDirectory(..),
        EditorImportPlugin(..), EditorInspector(..),
        EditorInspectorPlugin(..), EditorInterface(..),
        EditorNavigationMeshGenerator(..), EditorPlugin(..),
        EditorProperty(..), EditorResourceConversionPlugin(..),
        EditorResourcePreview(..), EditorResourcePreviewGenerator(..),
        EditorSceneImporter(..), EditorSceneImporterAssimp(..),
        EditorScenePostImport(..), EditorScript(..), EditorSelection(..),
        EditorSettings(..), EditorSpatialGizmo(..),
        EditorSpatialGizmoPlugin(..), EditorSpinSlider(..),
        EditorVCSInterface(..), EncodedObjectAsID(..), Environment(..),
        Expression(..), FileDialog(..), Font(..), FuncRef(..),
        GDNative(..), GDNativeLibrary(..), GDScript(..),
        GDScriptFunctionState(..), GIProbe(..), GIProbeData(..),
        Generic6DOFJoint(..), GeometryInstance(..), Gradient(..),
        GradientTexture(..), GraphEdit(..), GraphNode(..),
        GridContainer(..), GridMap(..), GrooveJoint2D(..),
        HBoxContainer(..), HScrollBar(..), HSeparator(..), HSlider(..),
        HSplitContainer(..), HTTPClient(..), HTTPRequest(..),
        HashingContext(..), HeightMapShape(..), HingeJoint(..), IP(..),
        IP_Unix(..), Image(..), ImageTexture(..), ImmediateGeometry(..),
        Input(..), InputDefault(..), InputEvent(..), InputEventAction(..),
        InputEventGesture(..), InputEventJoypadButton(..),
        InputEventJoypadMotion(..), InputEventKey(..), InputEventMIDI(..),
        InputEventMagnifyGesture(..), InputEventMouse(..),
        InputEventMouseButton(..), InputEventMouseMotion(..),
        InputEventPanGesture(..), InputEventScreenDrag(..),
        InputEventScreenTouch(..), InputEventWithModifiers(..),
        InputMap(..), InstancePlaceholder(..), InterpolatedCamera(..),
        ItemList(..), JSONParseResult(..), JSONRPC(..), JavaClass(..),
        JavaClassWrapper(..), JavaScript(..), Joint(..), Joint2D(..),
        KinematicBody(..), KinematicBody2D(..), KinematicCollision(..),
        KinematicCollision2D(..), Label(..), LargeTexture(..), Light(..),
        Light2D(..), LightOccluder2D(..), Line2D(..), LineEdit(..),
        LineShape2D(..), LinkButton(..), Listener(..), MainLoop(..),
        MarginContainer(..), Material(..), MenuButton(..), Mesh(..),
        MeshDataTool(..), MeshInstance(..), MeshInstance2D(..),
        MeshLibrary(..), MeshTexture(..), MobileVRInterface(..),
        MultiMesh(..), MultiMeshInstance(..), MultiMeshInstance2D(..),
        MultiplayerAPI(..), MultiplayerPeerGDNative(..), NativeScript(..),
        Navigation(..), Navigation2D(..), NavigationMesh(..),
        NavigationMeshInstance(..), NavigationPolygon(..),
        NavigationPolygonInstance(..), NetworkedMultiplayerENet(..),
        NetworkedMultiplayerPeer(..), NinePatchRect(..), Node(..),
        Node2D(..), NoiseTexture(..), OccluderPolygon2D(..), OmniLight(..),
        OpenSimplexNoise(..), OptionButton(..), PCKPacker(..),
        PHashTranslation(..), PackedDataContainer(..),
        PackedDataContainerRef(..), PackedScene(..), PacketPeer(..),
        PacketPeerGDNative(..), PacketPeerStream(..), PacketPeerUDP(..),
        Panel(..), PanelContainer(..), PanoramaSky(..),
        ParallaxBackground(..), ParallaxLayer(..), Particles(..),
        Particles2D(..), ParticlesMaterial(..), Path(..), Path2D(..),
        PathFollow(..), PathFollow2D(..), Performance(..),
        PhysicalBone(..), Physics2DDirectBodyState(..),
        Physics2DDirectBodyStateSW(..), Physics2DDirectSpaceState(..),
        Physics2DServer(..), Physics2DServerSW(..),
        Physics2DShapeQueryParameters(..), Physics2DShapeQueryResult(..),
        Physics2DTestMotionResult(..), PhysicsBody(..), PhysicsBody2D(..),
        PhysicsDirectBodyState(..), PhysicsDirectSpaceState(..),
        PhysicsMaterial(..), PhysicsServer(..),
        PhysicsShapeQueryParameters(..), PhysicsShapeQueryResult(..),
        PinJoint(..), PinJoint2D(..), PlaneMesh(..), PlaneShape(..),
        PluginScript(..), PointMesh(..), Polygon2D(..),
        PolygonPathFinder(..), Popup(..), PopupDialog(..), PopupMenu(..),
        PopupPanel(..), Position2D(..), Position3D(..), PrimitiveMesh(..),
        PrismMesh(..), ProceduralSky(..), ProgressBar(..),
        ProjectSettings(..), ProximityGroup(..), ProxyTexture(..),
        QuadMesh(..), RandomNumberGenerator(..), Range(..), RayCast(..),
        RayCast2D(..), RayShape(..), RayShape2D(..), RectangleShape2D(..),
        Reference(..), ReferenceRect(..), ReflectionProbe(..), RegEx(..),
        RegExMatch(..), RemoteTransform(..), RemoteTransform2D(..),
        Resource(..), ResourceFormatLoader(..),
        ResourceFormatLoaderCrypto(..), ResourceFormatSaver(..),
        ResourceFormatSaverCrypto(..), ResourceImporter(..),
        ResourceInteractiveLoader(..), ResourcePreloader(..),
        RichTextEffect(..), RichTextLabel(..), RigidBody(..),
        RigidBody2D(..), RootMotionView(..), SceneState(..), SceneTree(..),
        SceneTreeTimer(..), Script(..), ScriptCreateDialog(..),
        ScriptEditor(..), ScrollBar(..), ScrollContainer(..),
        SegmentShape2D(..), Separator(..), Shader(..), ShaderMaterial(..),
        Shape(..), Shape2D(..), ShortCut(..), Skeleton(..), Skeleton2D(..),
        SkeletonIK(..), Skin(..), SkinReference(..), Sky(..), Slider(..),
        SliderJoint(..), SoftBody(..), Spatial(..), SpatialGizmo(..),
        SpatialMaterial(..), SpatialVelocityTracker(..), SphereMesh(..),
        SphereShape(..), SpinBox(..), SplitContainer(..), SpotLight(..),
        SpringArm(..), Sprite(..), Sprite3D(..), SpriteBase3D(..),
        SpriteFrames(..), StaticBody(..), StaticBody2D(..), StreamPeer(..),
        StreamPeerBuffer(..), StreamPeerGDNative(..), StreamPeerSSL(..),
        StreamPeerTCP(..), StreamTexture(..), StyleBox(..),
        StyleBoxEmpty(..), StyleBoxFlat(..), StyleBoxLine(..),
        StyleBoxTexture(..), SurfaceTool(..), TCP_Server(..),
        TabContainer(..), Tabs(..), TextEdit(..), TextFile(..),
        Texture(..), Texture3D(..), TextureArray(..), TextureButton(..),
        TextureLayered(..), TextureProgress(..), TextureRect(..),
        Theme(..), TileMap(..), TileSet(..), Timer(..), ToolButton(..),
        TouchScreenButton(..), Translation(..), TranslationServer(..),
        Tree(..), TreeItem(..), TriangleMesh(..), Tween(..), UPNP(..),
        UPNPDevice(..), UndoRedo(..), VBoxContainer(..), VScrollBar(..),
        VSeparator(..), VSlider(..), VSplitContainer(..), VehicleBody(..),
        VehicleWheel(..), VideoPlayer(..), VideoStream(..),
        VideoStreamGDNative(..), VideoStreamTheora(..),
        VideoStreamWebm(..), Viewport(..), ViewportContainer(..),
        ViewportTexture(..), VisibilityEnabler(..),
        VisibilityEnabler2D(..), VisibilityNotifier(..),
        VisibilityNotifier2D(..), VisualInstance(..), VisualScript(..),
        VisualScriptBasicTypeConstant(..), VisualScriptBuiltinFunc(..),
        VisualScriptClassConstant(..), VisualScriptComment(..),
        VisualScriptComposeArray(..), VisualScriptCondition(..),
        VisualScriptConstant(..), VisualScriptConstructor(..),
        VisualScriptCustomNode(..), VisualScriptDeconstruct(..),
        VisualScriptEmitSignal(..), VisualScriptEngineSingleton(..),
        VisualScriptExpression(..), VisualScriptFunction(..),
        VisualScriptFunctionCall(..), VisualScriptFunctionState(..),
        VisualScriptGlobalConstant(..), VisualScriptIndexGet(..),
        VisualScriptIndexSet(..), VisualScriptInputAction(..),
        VisualScriptIterator(..), VisualScriptLists(..),
        VisualScriptLocalVar(..), VisualScriptLocalVarSet(..),
        VisualScriptMathConstant(..), VisualScriptNode(..),
        VisualScriptOperator(..), VisualScriptPreload(..),
        VisualScriptPropertyGet(..), VisualScriptPropertySet(..),
        VisualScriptResourcePath(..), VisualScriptReturn(..),
        VisualScriptSceneNode(..), VisualScriptSceneTree(..),
        VisualScriptSelect(..), VisualScriptSelf(..),
        VisualScriptSequence(..), VisualScriptSubCall(..),
        VisualScriptSwitch(..), VisualScriptTypeCast(..),
        VisualScriptVariableGet(..), VisualScriptVariableSet(..),
        VisualScriptWhile(..), VisualScriptYield(..),
        VisualScriptYieldSignal(..), VisualServer(..), VisualShader(..),
        VisualShaderNode(..), VisualShaderNodeBooleanConstant(..),
        VisualShaderNodeBooleanUniform(..),
        VisualShaderNodeColorConstant(..), VisualShaderNodeColorFunc(..),
        VisualShaderNodeColorOp(..), VisualShaderNodeColorUniform(..),
        VisualShaderNodeCompare(..), VisualShaderNodeCubeMap(..),
        VisualShaderNodeCubeMapUniform(..), VisualShaderNodeCustom(..),
        VisualShaderNodeDeterminant(..), VisualShaderNodeDotProduct(..),
        VisualShaderNodeExpression(..), VisualShaderNodeFaceForward(..),
        VisualShaderNodeFresnel(..), VisualShaderNodeGlobalExpression(..),
        VisualShaderNodeGroupBase(..), VisualShaderNodeIf(..),
        VisualShaderNodeInput(..), VisualShaderNodeIs(..),
        VisualShaderNodeOuterProduct(..), VisualShaderNodeOutput(..),
        VisualShaderNodeScalarClamp(..),
        VisualShaderNodeScalarConstant(..),
        VisualShaderNodeScalarDerivativeFunc(..),
        VisualShaderNodeScalarFunc(..), VisualShaderNodeScalarInterp(..),
        VisualShaderNodeScalarOp(..), VisualShaderNodeScalarSmoothStep(..),
        VisualShaderNodeScalarSwitch(..),
        VisualShaderNodeScalarUniform(..), VisualShaderNodeSwitch(..),
        VisualShaderNodeTexture(..), VisualShaderNodeTextureUniform(..),
        VisualShaderNodeTextureUniformTriplanar(..),
        VisualShaderNodeTransformCompose(..),
        VisualShaderNodeTransformConstant(..),
        VisualShaderNodeTransformDecompose(..),
        VisualShaderNodeTransformFunc(..),
        VisualShaderNodeTransformMult(..),
        VisualShaderNodeTransformUniform(..),
        VisualShaderNodeTransformVecMult(..), VisualShaderNodeUniform(..),
        VisualShaderNodeVec3Constant(..), VisualShaderNodeVec3Uniform(..),
        VisualShaderNodeVectorClamp(..), VisualShaderNodeVectorCompose(..),
        VisualShaderNodeVectorDecompose(..),
        VisualShaderNodeVectorDerivativeFunc(..),
        VisualShaderNodeVectorDistance(..), VisualShaderNodeVectorFunc(..),
        VisualShaderNodeVectorInterp(..), VisualShaderNodeVectorLen(..),
        VisualShaderNodeVectorOp(..), VisualShaderNodeVectorRefract(..),
        VisualShaderNodeVectorScalarMix(..),
        VisualShaderNodeVectorScalarSmoothStep(..),
        VisualShaderNodeVectorScalarStep(..),
        VisualShaderNodeVectorSmoothStep(..), WeakRef(..),
        WebRTCDataChannel(..), WebRTCDataChannelGDNative(..),
        WebRTCMultiplayer(..), WebRTCPeerConnection(..),
        WebRTCPeerConnectionGDNative(..), WebSocketClient(..),
        WebSocketMultiplayerPeer(..), WebSocketPeer(..),
        WebSocketServer(..), WindowDialog(..), World(..), World2D(..),
        WorldEnvironment(..), X509Certificate(..), XMLParser(..),
        YSort(..), ClassDB(..), Directory(..), Engine(..), File(..),
        Geometry(..), JSON(..), Marshalls(..), Mutex(..), OS(..),
        ResourceLoader(..), ResourceSaver(..), Semaphore(..), Thread(..),
        VisualScriptEditor(..))
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import Godot.Gdnative.Internal

newtype GlobalConstants = GlobalConstants Object
                            deriving newtype AsVariant

-- | Anchor point in AR Space.
--   The ARVR Anchor point is a spatial node that maps a real world location identified by the AR platform to a position within the game world. For example, as long as plane detection in ARKit is on, ARKit will identify and update the position of planes (tables, floors, etc) and create anchors for them.
--   		This node is mapped to one of the anchors through its unique id. When you receive a signal that a new anchor is available, you should add this node to your scene for that anchor. You can predefine nodes and set the id and the nodes will simply remain on 0,0,0 until a plane is recognized.
--   		Keep in mind that, as long as plane detection is enabled, the size, placing and orientation of an anchor will be updated as the detection logic learns more about the real world out there especially if only part of the surface is in view.
newtype ARVRAnchor = ARVRAnchor Object
                       deriving newtype AsVariant

instance HasBaseClass ARVRAnchor where
        type BaseClass ARVRAnchor = Spatial
        super = coerce

-- | A camera node with a few overrules for AR/VR applied, such as location tracking.
--   This is a helper spatial node for our camera; note that, if stereoscopic rendering is applicable (VR-HMD), most of the camera properties are ignored, as the HMD information overrides them. The only properties that can be trusted are the near and far planes.
--   		The position and orientation of this node is automatically updated by the ARVR Server to represent the location of the HMD if such tracking is available and can thus be used by game logic. Note that, in contrast to the ARVR Controller, the render thread has access to the most up-to-date tracking data of the HMD and the location of the ARVRCamera can lag a few milliseconds behind what is used for rendering as a result.
newtype ARVRCamera = ARVRCamera Object
                       deriving newtype AsVariant

instance HasBaseClass ARVRCamera where
        type BaseClass ARVRCamera = Camera
        super = coerce

-- | A spatial node representing a spatially tracked controller.
--   This is a helper spatial node that is linked to the tracking of controllers. It also offers several handy passthroughs to the state of buttons and such on the controllers.
--   		Controllers are linked by their id. You can create controller nodes before the controllers are available. Say your game always uses two controllers (one for each hand) you can predefine the controllers with id 1 and 2 and they will become active as soon as the controllers are identified. If you expect additional controllers to be used, you should react to the signals and add ARVRController nodes to your scene.
--   		The position of the controller node is automatically updated by the ARVR Server. This makes this node ideal to add child nodes to visualise the controller.
newtype ARVRController = ARVRController Object
                           deriving newtype AsVariant

instance HasBaseClass ARVRController where
        type BaseClass ARVRController = Spatial
        super = coerce

-- | Base class for ARVR interface implementation.
--   This class needs to be implemented to make an AR or VR platform available to Godot and these should be implemented as C++ modules or GDNative modules (note that for GDNative the subclass ARVRScriptInterface should be used). Part of the interface is exposed to GDScript so you can detect, enable and configure an AR or VR platform.
--   		Interfaces should be written in such a way that simply enabling them will give us a working setup. You can query the available interfaces through ARVRServer.
newtype ARVRInterface = ARVRInterface Object
                          deriving newtype AsVariant

instance HasBaseClass ARVRInterface where
        type BaseClass ARVRInterface = Reference
        super = coerce

newtype ARVRInterfaceGDNative = ARVRInterfaceGDNative Object
                                  deriving newtype AsVariant

instance HasBaseClass ARVRInterfaceGDNative where
        type BaseClass ARVRInterfaceGDNative = ARVRInterface
        super = coerce

-- | Our origin point in AR/VR.
--   This is a special node within the AR/VR system that maps the physical location of the center of our tracking space to the virtual location within our game world.
--   		There should be only one of these nodes in your scene and you must have one. All the ARVRCamera, ARVRController and ARVRAnchor nodes should be direct children of this node for spatial tracking to work correctly.
--   		It is the position of this node that you update when your character needs to move through your game world while we're not moving in the real world. Movement in the real world is always in relation to this origin point.
--   		So say that your character is driving a car, the ARVROrigin node should be a child node of this car. If you implement a teleport system to move your character, you change the position of this node. Etc.
newtype ARVROrigin = ARVROrigin Object
                       deriving newtype AsVariant

instance HasBaseClass ARVROrigin where
        type BaseClass ARVROrigin = Spatial
        super = coerce

-- | A tracked object
--   An instance of this object represents a device that is tracked such as a controller or anchor point. HMDs aren't represented here as they are fully handled internally.
--   		As controllers are turned on and the AR/VR interface detects them instances of this object are automatically added to this list of active tracking objects accessible through the ARVRServer
--   		The ARVRController and ARVRAnchor both consume objects of this type and should be the objects you use in game. The positional trackers are just the under the hood objects that make this all work and are mostly exposed so GDNative based interfaces can interact with them.
newtype ARVRPositionalTracker = ARVRPositionalTracker Object
                                  deriving newtype AsVariant

instance HasBaseClass ARVRPositionalTracker where
        type BaseClass ARVRPositionalTracker = Object
        super = coerce

-- | This is our AR/VR Server.
--   The AR/VR Server is the heart of our AR/VR solution and handles all the processing.
newtype ARVRServer = ARVRServer Object
                       deriving newtype AsVariant

instance HasBaseClass ARVRServer where
        type BaseClass ARVRServer = Object
        super = coerce

-- | AStar class representation that uses vectors as edges.
--   A* (A star) is a computer algorithm that is widely used in pathfinding and graph traversal, the process of plotting an efficiently directed path between multiple points. It enjoys widespread use due to its performance and accuracy. Godot's A* implementation make use of vectors as points.
--   		You must add points manually with [method AStar.add_point] and create segments manually with [method AStar.connect_points]. So you can test if there is a path between two points with the [method AStar.are_points_connected] function, get the list of existing ids in the found path with [method AStar.get_id_path], or the points list with [method AStar.get_point_path].
newtype AStar = AStar Object
                  deriving newtype AsVariant

instance HasBaseClass AStar where
        type BaseClass AStar = Reference
        super = coerce

newtype AStar2D = AStar2D Object
                    deriving newtype AsVariant

instance HasBaseClass AStar2D where
        type BaseClass AStar2D = Reference
        super = coerce

-- | Base dialog for user notification.
--   This dialog is useful for small notifications to the user about an event. It can only be accepted or closed, with the same result.
newtype AcceptDialog = AcceptDialog Object
                         deriving newtype AsVariant

instance HasBaseClass AcceptDialog where
        type BaseClass AcceptDialog = WindowDialog
        super = coerce

-- | Sprite node that can use multiple textures for animation.
--   Animations are created using a [SpriteFrames] resource, which can be configured in the editor via the SpriteFrames panel.
newtype AnimatedSprite = AnimatedSprite Object
                           deriving newtype AsVariant

instance HasBaseClass AnimatedSprite where
        type BaseClass AnimatedSprite = Node2D
        super = coerce

-- | 2D sprite node in 3D world, that can use multiple 2D textures for animation.
--   Animations are created using a [SpriteFrames] resource, which can be configured in the editor via the SpriteFrames panel.
newtype AnimatedSprite3D = AnimatedSprite3D Object
                             deriving newtype AsVariant

instance HasBaseClass AnimatedSprite3D where
        type BaseClass AnimatedSprite3D = SpriteBase3D
        super = coerce

-- | Proxy texture for simple frame-based animations.
--   [code]AnimatedTexture[/code] is a resource format for frame-based animations, where multiple textures can be chained automatically with a predefined delay for each frame. Unlike [AnimationPlayer] or [AnimatedSprite], it isn't a [Node], but has the advantage of being usable anywhere a [Texture] resource can be used, e.g. in a [TileSet].
--   		The playback of the animation is controlled by the [member fps] property as well as each frame's optional delay (see [method set_frame_delay]). The animation loops, i.e. it will restart at frame 0 automatically after playing the last frame.
--   		[code]AnimatedTexture[/code] currently requires all frame textures to have the same size, otherwise the bigger ones will be cropped to match the smallest one.
newtype AnimatedTexture = AnimatedTexture Object
                            deriving newtype AsVariant

instance HasBaseClass AnimatedTexture where
        type BaseClass AnimatedTexture = Texture
        super = coerce

-- | Contains data used to animate everything in the engine.
--   An Animation resource contains data used to animate everything in the engine. Animations are divided into tracks, and each track must be linked to a node. The state of that node can be changed through time, by adding timed keys (events) to the track.
--   		[codeblock]
--   		# This creates an animation that makes the node "Enemy" move to the right by
--   		# 100 pixels in 1 second.
--   		var animation = Animation.new()
--   		var track_index = animation.add_track(Animation.TYPE_VALUE)
--   		animation.track_set_path(track_index, "Enemy:position.x")
--   		animation.track_insert_key(track_index, 0.0, 0)
--   		animation.track_insert_key(track_index, 0.5, 100)
--   		[/codeblock]
--   		Animations are just data containers, and must be added to nodes such as an [AnimationPlayer] or [AnimationTreePlayer] to be played back.
newtype Animation = Animation Object
                      deriving newtype AsVariant

instance HasBaseClass Animation where
        type BaseClass Animation = Resource
        super = coerce

-- | Base resource for [AnimationTree] nodes.
--    In general it's not used directly but you can create custom ones with custom blending formulas.
--   	Inherit this when creating nodes mainly for use in [AnimationNodeBlendTree], otherwise [AnimationRootNode] should be used instead.
newtype AnimationNode = AnimationNode Object
                          deriving newtype AsVariant

instance HasBaseClass AnimationNode where
        type BaseClass AnimationNode = Resource
        super = coerce

-- | Blends two animations additively inside of an [AnimationNodeBlendTree].
--   A resource to add to an [AnimationNodeBlendTree]. Blends two animations additively based on an amount value in the [code][0.0, 1.0][/code] range.
newtype AnimationNodeAdd2 = AnimationNodeAdd2 Object
                              deriving newtype AsVariant

instance HasBaseClass AnimationNodeAdd2 where
        type BaseClass AnimationNodeAdd2 = AnimationNode
        super = coerce

-- | Blends two of three animations additively inside of an [AnimationNodeBlendTree].
--   A resource to add to an [AnimationNodeBlendTree]. Blends two animations together additively out of three based on a value in the [code][-1.0, 1.0][/code] range.
--   		This node has three inputs:
--   		- The base animation to add to
--   		- A -add animation to blend with when the blend amount is in the [code][-1.0, 0.0][/code] range.
--   		- A +add animation to blend with when the blend amount is in the [code][0.0, 1.0][/code] range
newtype AnimationNodeAdd3 = AnimationNodeAdd3 Object
                              deriving newtype AsVariant

instance HasBaseClass AnimationNodeAdd3 where
        type BaseClass AnimationNodeAdd3 = AnimationNode
        super = coerce

-- | Input animation to use in an [AnimationNodeBlendTree].
--   A resource to add to an [AnimationNodeBlendTree]. Only features one output set using the [member animation] property. Use it as an input for [AnimationNode] that blend animations together.
newtype AnimationNodeAnimation = AnimationNodeAnimation Object
                                   deriving newtype AsVariant

instance HasBaseClass AnimationNodeAnimation where
        type BaseClass AnimationNodeAnimation = AnimationRootNode
        super = coerce

-- | Blends two animations linearly inside of an [AnimationNodeBlendTree].
--   A resource to add to an [AnimationNodeBlendTree]. Blends two animations linearly based on an amount value in the [code][0.0, 1.0][/code] range.
newtype AnimationNodeBlend2 = AnimationNodeBlend2 Object
                                deriving newtype AsVariant

instance HasBaseClass AnimationNodeBlend2 where
        type BaseClass AnimationNodeBlend2 = AnimationNode
        super = coerce

-- | Blends two of three animations linearly inside of an [AnimationNodeBlendTree].
--   A resource to add to an [AnimationNodeBlendTree]. Blends two animations together linearly out of three based on a value in the [code][-1.0, 1.0][/code] range.
--   		This node has three inputs:
--   		- The base animation
--   		- A -blend animation to blend with when the blend amount is in the [code][-1.0, 0.0][/code] range.
--   		- A +blend animation to blend with when the blend amount is in the [code][0.0, 1.0][/code] range
newtype AnimationNodeBlend3 = AnimationNodeBlend3 Object
                                deriving newtype AsVariant

instance HasBaseClass AnimationNodeBlend3 where
        type BaseClass AnimationNodeBlend3 = AnimationNode
        super = coerce

-- | Blends linearly between two of any number of [AnimationNode] of any type placed on a virtual axis.
--   A resource to add to an [AnimationNodeBlendTree].
--   		This is a virtual axis on which you can add any type of [AnimationNode] using [method add_blend_point].
--   		Outputs the linear blend of the two [code]AnimationNode[/code] closest to the node's current [code]value[/code].
--   		You can set the extents of the axis using the [member min_space] and [member max_space].
newtype AnimationNodeBlendSpace1D = AnimationNodeBlendSpace1D Object
                                      deriving newtype AsVariant

instance HasBaseClass AnimationNodeBlendSpace1D where
        type BaseClass AnimationNodeBlendSpace1D = AnimationRootNode
        super = coerce

-- | Blends linearly between three [AnimationNode] of any type placed in a 2d space.
--   A resource to add to an [AnimationNodeBlendTree].
--   		This node allows you to blend linearly between three animations using a [Vector2] weight.
--   		You can add vertices to the blend space with [method add_blend_point] and automatically triangulate it by setting [member auto_triangles] to [code]true[/code]. Otherwise, use [method add_triangle] and [method remove_triangle] to create up the blend space by hand.
newtype AnimationNodeBlendSpace2D = AnimationNodeBlendSpace2D Object
                                      deriving newtype AsVariant

instance HasBaseClass AnimationNodeBlendSpace2D where
        type BaseClass AnimationNodeBlendSpace2D = AnimationRootNode
        super = coerce

newtype AnimationNodeBlendTree = AnimationNodeBlendTree Object
                                   deriving newtype AsVariant

instance HasBaseClass AnimationNodeBlendTree where
        type BaseClass AnimationNodeBlendTree = AnimationRootNode
        super = coerce

newtype AnimationNodeOneShot = AnimationNodeOneShot Object
                                 deriving newtype AsVariant

instance HasBaseClass AnimationNodeOneShot where
        type BaseClass AnimationNodeOneShot = AnimationNode
        super = coerce

newtype AnimationNodeOutput = AnimationNodeOutput Object
                                deriving newtype AsVariant

instance HasBaseClass AnimationNodeOutput where
        type BaseClass AnimationNodeOutput = AnimationNode
        super = coerce

-- | State machine for control of animations.
--   Contains multiple nodes representing animation states, connected in a graph. Nodes transitions can be configured to happen automatically or via code, using a shortest-path algorithm. Retrieve the AnimationNodeStateMachinePlayback object from the [code]AnimationTree[/code] node to control it programatically. Example:
--   		[codeblock]
--   		var state_machine = $AnimationTree.get("parameters/playback")
--   		state_machine.travel("some_state")
--   		[/codeblock]
newtype AnimationNodeStateMachine = AnimationNodeStateMachine Object
                                      deriving newtype AsVariant

instance HasBaseClass AnimationNodeStateMachine where
        type BaseClass AnimationNodeStateMachine = AnimationRootNode
        super = coerce

-- | Playback control for AnimationNodeStateMachine.
--   Allows control of [AnimationTree] state machines created with [AnimationNodeStateMachine]. Retrieve with [code]$AnimationTree.get("parameters/playback")[/code]. Example:
--   		[codeblock]
--   		var state_machine = $AnimationTree.get("parameters/playback")
--   		state_machine.travel("some_state")
--   		[/codeblock]
newtype AnimationNodeStateMachinePlayback = AnimationNodeStateMachinePlayback Object
                                              deriving newtype AsVariant

instance HasBaseClass AnimationNodeStateMachinePlayback where
        type BaseClass AnimationNodeStateMachinePlayback = Resource
        super = coerce

newtype AnimationNodeStateMachineTransition = AnimationNodeStateMachineTransition Object
                                                deriving newtype AsVariant

instance HasBaseClass AnimationNodeStateMachineTransition where
        type BaseClass AnimationNodeStateMachineTransition = Resource
        super = coerce

newtype AnimationNodeTimeScale = AnimationNodeTimeScale Object
                                   deriving newtype AsVariant

instance HasBaseClass AnimationNodeTimeScale where
        type BaseClass AnimationNodeTimeScale = AnimationNode
        super = coerce

newtype AnimationNodeTimeSeek = AnimationNodeTimeSeek Object
                                  deriving newtype AsVariant

instance HasBaseClass AnimationNodeTimeSeek where
        type BaseClass AnimationNodeTimeSeek = AnimationNode
        super = coerce

newtype AnimationNodeTransition = AnimationNodeTransition Object
                                    deriving newtype AsVariant

instance HasBaseClass AnimationNodeTransition where
        type BaseClass AnimationNodeTransition = AnimationNode
        super = coerce

-- | Container and player of [Animation] resources.
--   An animation player is used for general purpose playback of [Animation] resources. It contains a dictionary of animations (referenced by name) and custom blend times between their transitions. Additionally, animations can be played and blended in different channels.
newtype AnimationPlayer = AnimationPlayer Object
                            deriving newtype AsVariant

instance HasBaseClass AnimationPlayer where
        type BaseClass AnimationPlayer = Node
        super = coerce

newtype AnimationRootNode = AnimationRootNode Object
                              deriving newtype AsVariant

instance HasBaseClass AnimationRootNode where
        type BaseClass AnimationRootNode = AnimationNode
        super = coerce

newtype AnimationTrackEditPlugin = AnimationTrackEditPlugin Object
                                     deriving newtype AsVariant

instance HasBaseClass AnimationTrackEditPlugin where
        type BaseClass AnimationTrackEditPlugin = Reference
        super = coerce

newtype AnimationTree = AnimationTree Object
                          deriving newtype AsVariant

instance HasBaseClass AnimationTree where
        type BaseClass AnimationTree = Node
        super = coerce

-- | Animation Player that uses a node graph for blending Animations.
--   A node graph tool for blending multiple animations bound to an [AnimationPlayer]. Especially useful for animating characters or other skeleton-based rigs. It can combine several animations to form a desired pose.
--   		It takes [Animation]s from an [AnimationPlayer] node and mixes them depending on the graph.
newtype AnimationTreePlayer = AnimationTreePlayer Object
                                deriving newtype AsVariant

instance HasBaseClass AnimationTreePlayer where
        type BaseClass AnimationTreePlayer = Node
        super = coerce

-- | General purpose area node for detection and 3D physics influence.
--   3D area that detects [CollisionObject] nodes overlapping, entering, or exiting. Can also alter or override local physics parameters (gravity, damping).
newtype Area = Area Object
                 deriving newtype AsVariant

instance HasBaseClass Area where
        type BaseClass Area = CollisionObject
        super = coerce

-- | 2D area for detection and 2D physics influence.
--   2D area that detects [CollisionObject2D] nodes overlapping, entering, or exiting. Can also alter or override local physics parameters (gravity, damping).
newtype Area2D = Area2D Object
                   deriving newtype AsVariant

instance HasBaseClass Area2D where
        type BaseClass Area2D = CollisionObject2D
        super = coerce

-- | [Mesh] type that provides utility for constructing a surface from arrays.
--   The [code]ArrayMesh[/code] is used to construct a [Mesh] by specifying the attributes as arrays. The most basic example is the creation of a single triangle
--   		[codeblock]
--   		var vertices = PoolVector3Array()
--   		vertices.push_back(Vector3(0, 1, 0))
--   		vertices.push_back(Vector3(1, 0, 0))
--   		vertices.push_back(Vector3(0, 0, 1))
--   		# Initialize the ArrayMesh.
--   		var arr_mesh = ArrayMesh.new()
--   		var arrays = []
--   		arrays.resize(ArrayMesh.ARRAY_MAX)
--   		arrays[ArrayMesh.ARRAY_VERTEX] = vertices
--   		# Create the Mesh.
--   		arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
--   		var m = MeshInstance.new()
--   		m.mesh = arr_mesh
--   		[/codeblock]
--   		The [code]MeshInstance[/code] is ready to be added to the SceneTree to be shown.
newtype ArrayMesh = ArrayMesh Object
                      deriving newtype AsVariant

instance HasBaseClass ArrayMesh where
        type BaseClass ArrayMesh = Mesh
        super = coerce

-- | Packs multiple small textures in a single, bigger one. Helps to optimize video memory costs and render calls.
--   [Texture] resource aimed at managing big textures files that pack multiple smaller textures. Consists of a [Texture], a margin that defines the border width,
--   		and a region that defines the actual area of the AtlasTexture.
newtype AtlasTexture = AtlasTexture Object
                         deriving newtype AsVariant

instance HasBaseClass AtlasTexture where
        type BaseClass AtlasTexture = Texture
        super = coerce

-- | Stores information about the audiobusses.
--   Stores position, muting, solo, bypass, effects, effect position, volume, and the connections between buses. See [AudioServer] for usage.
newtype AudioBusLayout = AudioBusLayout Object
                           deriving newtype AsVariant

instance HasBaseClass AudioBusLayout where
        type BaseClass AudioBusLayout = Resource
        super = coerce

-- | Audio Effect For Audio.
--   Base resource for audio bus. Applies an audio effect on the bus that the resource is applied on.
newtype AudioEffect = AudioEffect Object
                        deriving newtype AsVariant

instance HasBaseClass AudioEffect where
        type BaseClass AudioEffect = Resource
        super = coerce

-- | Adds a Amplify audio effect to an Audio bus.
--   		Increases or decreases the volume of the selected audio bus.
--   Increases or decreases the volume being routed through the audio bus.
newtype AudioEffectAmplify = AudioEffectAmplify Object
                               deriving newtype AsVariant

instance HasBaseClass AudioEffectAmplify where
        type BaseClass AudioEffectAmplify = AudioEffect
        super = coerce

-- | Adds a band limit filter to the Audio Bus.
--   Limits the frequencies in a range around the [member AudioEffectFilter.cutoff_hz] and allows frequencies outside of this range to pass.
newtype AudioEffectBandLimitFilter = AudioEffectBandLimitFilter Object
                                       deriving newtype AsVariant

instance HasBaseClass AudioEffectBandLimitFilter where
        type BaseClass AudioEffectBandLimitFilter = AudioEffectFilter
        super = coerce

-- | Adds a band pass filter to the Audio Bus.
--   Attenuates the frequencies inside of a range around the [member AudioEffectFilter.cutoff_hz] and cuts frequencies outside of this band.
newtype AudioEffectBandPassFilter = AudioEffectBandPassFilter Object
                                      deriving newtype AsVariant

instance HasBaseClass AudioEffectBandPassFilter where
        type BaseClass AudioEffectBandPassFilter = AudioEffectFilter
        super = coerce

-- | Adds a chorus audio effect.
--    The effect applies a filter with voices to duplicate the audio source and manipulate it through the filter.
newtype AudioEffectChorus = AudioEffectChorus Object
                              deriving newtype AsVariant

instance HasBaseClass AudioEffectChorus where
        type BaseClass AudioEffectChorus = AudioEffect
        super = coerce

-- | Adds a Compressor audio effect to an Audio bus.
--   		Reduces sounds that exceed a certain threshold level, smooths out the dynamics and increases the overall volume.
--   Dynamic range compressor reduces the level of the sound when the amplitude goes over a certain threshold in Decibels. One of the main uses of a compressor is to increase the dynamic range by clipping as little as possible (when sound goes over 0dB).
--   		Compressor has many uses in the mix:
--   		- In the Master bus to compress the whole output (Although a [AudioEffectLimiter] is probably better)
--   		- In voice channels to ensure they sound as balanced as possible.
--   		- Sidechained. Sidechained, which can reduce the sound level sidechained with another audio bus for threshold detection.. This technique is very common in video game mixing to download the level of Music/SFX while voices are being heard.
--   		- Accentuates transients by using a wider attack, making effects sound more punchy.
newtype AudioEffectCompressor = AudioEffectCompressor Object
                                  deriving newtype AsVariant

instance HasBaseClass AudioEffectCompressor where
        type BaseClass AudioEffectCompressor = AudioEffect
        super = coerce

-- | Adds a Delay audio effect to an Audio bus. Plays input signal back after a period of time.
--   		Two tap delay and feedback options.
--   Plays input signal back after a period of time. The delayed signal may be played back multiple times to create the sound of a repeating, decaying echo. Delay effects range from a subtle echo effect to a pronounced blending of previous sounds with new sounds.
newtype AudioEffectDelay = AudioEffectDelay Object
                             deriving newtype AsVariant

instance HasBaseClass AudioEffectDelay where
        type BaseClass AudioEffectDelay = AudioEffect
        super = coerce

-- | Adds a Distortion audio effect to an Audio bus.
--   		Modify the sound to make it dirty.
--   Modify the sound and make it dirty. Different types are available : clip, tan, lofi (bit crushing), overdrive, or waveshape.
--   		By distorting the waveform the frequency content change, which will often make the sound "crunchy" or "abrasive". For games, it can simulate sound coming from some saturated device or speaker very efficiently.
newtype AudioEffectDistortion = AudioEffectDistortion Object
                                  deriving newtype AsVariant

instance HasBaseClass AudioEffectDistortion where
        type BaseClass AudioEffectDistortion = AudioEffect
        super = coerce

-- | Base class for audio equalizers. Gives you control over frequencies.
--   		Use it to create a custom equalizer if [AudioEffectEQ6], [AudioEffectEQ10] or [AudioEffectEQ21] don't fit your needs.
--   AudioEffectEQ gives you control over frequencies. Use it to compensate for existing deficiencies in audio. AudioEffectEQ are very useful on the Master Bus to completely master a mix and give it character. They are also very useful when a game is run on a mobile device, to adjust the mix to that kind of speakers (it can be added but disabled when headphones are plugged).
newtype AudioEffectEQ = AudioEffectEQ Object
                          deriving newtype AsVariant

instance HasBaseClass AudioEffectEQ where
        type BaseClass AudioEffectEQ = AudioEffect
        super = coerce

-- | Adds a 10-band equalizer audio effect to an Audio bus. Gives you control over frequencies from 31 Hz to 16000 Hz.
--   		Each frequency can be modulated between -60/+24 dB.
--   Frequency bands :
--   		Band 1 : 31 Hz
--   		Band 2 : 62 Hz
--   		Band 3 : 125 Hz
--   		Band 4 : 250 Hz
--   		Band 5 : 500 Hz
--   		Band 6 : 1000 Hz
--   		Band 7 : 2000 Hz
--   		Band 8 : 4000 Hz
--   		Band 9 : 8000 Hz
--   		Band 10 : 16000 Hz
--   		See also [AudioEffectEQ], [AudioEffectEQ6], [AudioEffectEQ21].
newtype AudioEffectEQ10 = AudioEffectEQ10 Object
                            deriving newtype AsVariant

instance HasBaseClass AudioEffectEQ10 where
        type BaseClass AudioEffectEQ10 = AudioEffectEQ
        super = coerce

-- | Adds a 21-band equalizer audio effect to an Audio bus. Gives you control over frequencies from 22 Hz to 22000 Hz.
--   		Each frequency can be modulated between -60/+24 dB.
--   Frequency bands :
--   		Band 1 : 22 Hz
--   		Band 2 : 32 Hz
--   		Band 3 : 44 Hz
--   		Band 4 : 63 Hz
--   		Band 5 : 90 Hz
--   		Band 6 : 125 Hz
--   		Band 7 : 175 Hz
--   		Band 8 : 250 Hz
--   		Band 9 : 350 Hz
--   		Band 10 : 500 Hz
--   		Band 11 : 700 Hz
--   		Band 12 : 1000 Hz
--   		Band 13 : 1400 Hz
--   		Band 14 : 2000 Hz
--   		Band 15 : 2800 Hz
--   		Band 16 : 4000 Hz
--   		Band 17 : 5600 Hz
--   		Band 18 : 8000 Hz
--   		Band 19 : 11000 Hz
--   		Band 20 : 16000 Hz
--   		Band 21 : 22000 Hz
--   		See also [AudioEffectEQ], [AudioEffectEQ6], [AudioEffectEQ10].
newtype AudioEffectEQ21 = AudioEffectEQ21 Object
                            deriving newtype AsVariant

instance HasBaseClass AudioEffectEQ21 where
        type BaseClass AudioEffectEQ21 = AudioEffectEQ
        super = coerce

-- | Adds a 6-band equalizer audio effect to an Audio bus. Gives you control over frequencies from 32 Hz to 10000 Hz.
--   		Each frequency can be modulated between -60/+24 dB.
--   Frequency bands :
--   		Band 1 : 32 Hz
--   		Band 2 : 100 Hz
--   		Band 3 : 320 Hz
--   		Band 4 : 1000 Hz
--   		Band 5 : 3200 Hz
--   		Band 6 : 10000 Hz
--   		See also [AudioEffectEQ], [AudioEffectEQ10], [AudioEffectEQ21].
newtype AudioEffectEQ6 = AudioEffectEQ6 Object
                           deriving newtype AsVariant

instance HasBaseClass AudioEffectEQ6 where
        type BaseClass AudioEffectEQ6 = AudioEffectEQ
        super = coerce

-- | Adds a filter to the Audio Bus.
--   Allows frequencies other than the [member cutoff_hz] to pass.
newtype AudioEffectFilter = AudioEffectFilter Object
                              deriving newtype AsVariant

instance HasBaseClass AudioEffectFilter where
        type BaseClass AudioEffectFilter = AudioEffect
        super = coerce

-- | Adds a high pass filter to the Audio Bus.
--   Cuts frequencies lower than the [member AudioEffectFilter.cutoff_hz] and allows higher frequencies to pass.
newtype AudioEffectHighPassFilter = AudioEffectHighPassFilter Object
                                      deriving newtype AsVariant

instance HasBaseClass AudioEffectHighPassFilter where
        type BaseClass AudioEffectHighPassFilter = AudioEffectFilter
        super = coerce

newtype AudioEffectHighShelfFilter = AudioEffectHighShelfFilter Object
                                       deriving newtype AsVariant

instance HasBaseClass AudioEffectHighShelfFilter where
        type BaseClass AudioEffectHighShelfFilter = AudioEffectFilter
        super = coerce

newtype AudioEffectInstance = AudioEffectInstance Object
                                deriving newtype AsVariant

instance HasBaseClass AudioEffectInstance where
        type BaseClass AudioEffectInstance = Reference
        super = coerce

-- | Adds a soft clip Limiter audio effect to an Audio bus.
--   A limiter is similar to a compressor, but it's less flexible and designed to disallow sound going over a given dB threshold. Adding one in the Master Bus is always recommended to reduce the effects of clipping.
--   		Soft clipping starts to reduce the peaks a little below the threshold level and progressively increases its effect as the input level increases such that the threshold is never exceeded.
newtype AudioEffectLimiter = AudioEffectLimiter Object
                               deriving newtype AsVariant

instance HasBaseClass AudioEffectLimiter where
        type BaseClass AudioEffectLimiter = AudioEffect
        super = coerce

-- | Adds a low pass filter to the Audio Bus.
--   Cuts frequencies higher than the [member AudioEffectFilter.cutoff_hz] and allows lower frequencies to pass.
newtype AudioEffectLowPassFilter = AudioEffectLowPassFilter Object
                                     deriving newtype AsVariant

instance HasBaseClass AudioEffectLowPassFilter where
        type BaseClass AudioEffectLowPassFilter = AudioEffectFilter
        super = coerce

newtype AudioEffectLowShelfFilter = AudioEffectLowShelfFilter Object
                                      deriving newtype AsVariant

instance HasBaseClass AudioEffectLowShelfFilter where
        type BaseClass AudioEffectLowShelfFilter = AudioEffectFilter
        super = coerce

-- | Adds a notch filter to the Audio Bus.
--   Attenuates frequencies in a narrow band around the [member AudioEffectFilter.cutoff_hz] and cuts frequencies outside of this range.
newtype AudioEffectNotchFilter = AudioEffectNotchFilter Object
                                   deriving newtype AsVariant

instance HasBaseClass AudioEffectNotchFilter where
        type BaseClass AudioEffectNotchFilter = AudioEffectFilter
        super = coerce

-- | Adds a Panner audio effect to an Audio bus. Pans sound left or right.
--   Determines how much of an audio signal is sent to the left and right buses.
newtype AudioEffectPanner = AudioEffectPanner Object
                              deriving newtype AsVariant

instance HasBaseClass AudioEffectPanner where
        type BaseClass AudioEffectPanner = AudioEffect
        super = coerce

-- | Adds a Phaser audio effect to an Audio bus.
--   		Combines the original signal with a copy that is slightly out of phase with the original.
--   Combines phase-shifted signals with the original signal. The movement of the phase-shifted signals is controlled using a Low Frequency Oscillator.
newtype AudioEffectPhaser = AudioEffectPhaser Object
                              deriving newtype AsVariant

instance HasBaseClass AudioEffectPhaser where
        type BaseClass AudioEffectPhaser = AudioEffect
        super = coerce

-- | Adds a Pitch shift audio effect to an Audio bus.
--   		Raises or lowers the pitch of original sound.
--   Allows modulation of pitch independently of tempo. All frequencies can be increased/decreased with minimal effect on transients.
newtype AudioEffectPitchShift = AudioEffectPitchShift Object
                                  deriving newtype AsVariant

instance HasBaseClass AudioEffectPitchShift where
        type BaseClass AudioEffectPitchShift = AudioEffect
        super = coerce

newtype AudioEffectRecord = AudioEffectRecord Object
                              deriving newtype AsVariant

instance HasBaseClass AudioEffectRecord where
        type BaseClass AudioEffectRecord = AudioEffect
        super = coerce

-- | Adds a Reverb audio effect to an Audio bus.
--   		Simulates the sound of acoustic environments such as rooms, concert halls, caverns, or an open spaces.
--   Simulates rooms of different sizes. Its parameters can be adjusted to simulate the sound of a specific room.
newtype AudioEffectReverb = AudioEffectReverb Object
                              deriving newtype AsVariant

instance HasBaseClass AudioEffectReverb where
        type BaseClass AudioEffectReverb = AudioEffect
        super = coerce

newtype AudioEffectSpectrumAnalyzer = AudioEffectSpectrumAnalyzer Object
                                        deriving newtype AsVariant

instance HasBaseClass AudioEffectSpectrumAnalyzer where
        type BaseClass AudioEffectSpectrumAnalyzer = AudioEffect
        super = coerce

newtype AudioEffectSpectrumAnalyzerInstance = AudioEffectSpectrumAnalyzerInstance Object
                                                deriving newtype AsVariant

instance HasBaseClass AudioEffectSpectrumAnalyzerInstance where
        type BaseClass AudioEffectSpectrumAnalyzerInstance =
             AudioEffectInstance
        super = coerce

newtype AudioEffectStereoEnhance = AudioEffectStereoEnhance Object
                                     deriving newtype AsVariant

instance HasBaseClass AudioEffectStereoEnhance where
        type BaseClass AudioEffectStereoEnhance = AudioEffect
        super = coerce

-- | Server interface for low level audio access.
--   AudioServer is a low level server interface for audio access. It is in charge of creating sample data (playable audio) as well as its playback via a voice interface.
newtype AudioServer = AudioServer Object
                        deriving newtype AsVariant

instance HasBaseClass AudioServer where
        type BaseClass AudioServer = Object
        super = coerce

-- | Base class for audio streams.
--    Audio streams are used for sound effects and music playback, and support WAV (via [AudioStreamSample]) and OGG (via [AudioStreamOGGVorbis]) file formats.
newtype AudioStream = AudioStream Object
                        deriving newtype AsVariant

instance HasBaseClass AudioStream where
        type BaseClass AudioStream = Resource
        super = coerce

newtype AudioStreamGenerator = AudioStreamGenerator Object
                                 deriving newtype AsVariant

instance HasBaseClass AudioStreamGenerator where
        type BaseClass AudioStreamGenerator = AudioStream
        super = coerce

newtype AudioStreamGeneratorPlayback = AudioStreamGeneratorPlayback Object
                                         deriving newtype AsVariant

instance HasBaseClass AudioStreamGeneratorPlayback where
        type BaseClass AudioStreamGeneratorPlayback =
             AudioStreamPlaybackResampled
        super = coerce

newtype AudioStreamMicrophone = AudioStreamMicrophone Object
                                  deriving newtype AsVariant

instance HasBaseClass AudioStreamMicrophone where
        type BaseClass AudioStreamMicrophone = AudioStream
        super = coerce

newtype AudioStreamOGGVorbis = AudioStreamOGGVorbis Object
                                 deriving newtype AsVariant

instance HasBaseClass AudioStreamOGGVorbis where
        type BaseClass AudioStreamOGGVorbis = AudioStream
        super = coerce

-- | Meta class for playing back audio.
--   Can play, loop, pause a scroll through Audio. See [AudioStream] and [AudioStreamOGGVorbis] for usage.
newtype AudioStreamPlayback = AudioStreamPlayback Object
                                deriving newtype AsVariant

instance HasBaseClass AudioStreamPlayback where
        type BaseClass AudioStreamPlayback = Reference
        super = coerce

newtype AudioStreamPlaybackResampled = AudioStreamPlaybackResampled Object
                                         deriving newtype AsVariant

instance HasBaseClass AudioStreamPlaybackResampled where
        type BaseClass AudioStreamPlaybackResampled = AudioStreamPlayback
        super = coerce

-- | Plays back audio.
--   Plays background audio.
newtype AudioStreamPlayer = AudioStreamPlayer Object
                              deriving newtype AsVariant

instance HasBaseClass AudioStreamPlayer where
        type BaseClass AudioStreamPlayer = Node
        super = coerce

-- | Plays audio in 2D.
--   Plays audio that dampens with distance from screen center.
newtype AudioStreamPlayer2D = AudioStreamPlayer2D Object
                                deriving newtype AsVariant

instance HasBaseClass AudioStreamPlayer2D where
        type BaseClass AudioStreamPlayer2D = Node2D
        super = coerce

-- | Plays 3D sound in 3D space.
--   Plays a sound effect with directed sound effects, dampens with distance if needed, generates effect of hearable position in space.
newtype AudioStreamPlayer3D = AudioStreamPlayer3D Object
                                deriving newtype AsVariant

instance HasBaseClass AudioStreamPlayer3D where
        type BaseClass AudioStreamPlayer3D = Spatial
        super = coerce

-- | Plays audio with random pitch tweaking.
--   Randomly varies pitch on each start.
newtype AudioStreamRandomPitch = AudioStreamRandomPitch Object
                                   deriving newtype AsVariant

instance HasBaseClass AudioStreamRandomPitch where
        type BaseClass AudioStreamRandomPitch = AudioStream
        super = coerce

-- | Stores audio data loaded from [code].wav[/code] files.
--   AudioStreamSample stores sound samples loaded from [code].wav[/code] files. To play the stored sound use an [AudioStreamPlayer] (for background music) or [AudioStreamPlayer2D]/[AudioStreamPlayer3D] (for positional audio). The sound can be looped.
--   		This class can also be used to store dynamically generated PCM audio data.
newtype AudioStreamSample = AudioStreamSample Object
                              deriving newtype AsVariant

instance HasBaseClass AudioStreamSample where
        type BaseClass AudioStreamSample = AudioStream
        super = coerce

-- | Copies a region of the screen (or the whole screen) to a buffer so it can be accessed with [code]SCREEN_TEXTURE[/code] in the [code]texture()[/code] function.
--   Node for back-buffering the currently displayed screen. The region defined in the BackBufferCopy node is bufferized with the content of the screen it covers, or the entire screen according to the copy mode set. Use [code]SCREEN_TEXTURE[/code] in the [code]texture()[/code] function to access the buffer.
newtype BackBufferCopy = BackBufferCopy Object
                           deriving newtype AsVariant

instance HasBaseClass BackBufferCopy where
        type BaseClass BackBufferCopy = Node2D
        super = coerce

-- | Prerendered indirect light map for a scene.
--   Baked lightmaps are an alternative workflow for adding indirect (or baked) lighting to a scene. Unlike the [GIProbe] approach, baked lightmaps work fine on low-end PCs and mobile devices as they consume almost no resources in run-time.
newtype BakedLightmap = BakedLightmap Object
                          deriving newtype AsVariant

instance HasBaseClass BakedLightmap where
        type BaseClass BakedLightmap = VisualInstance
        super = coerce

newtype BakedLightmapData = BakedLightmapData Object
                              deriving newtype AsVariant

instance HasBaseClass BakedLightmapData where
        type BaseClass BakedLightmapData = Resource
        super = coerce

-- | Base class for different kinds of buttons.
--   BaseButton is the abstract base class for buttons, so it shouldn't be used directly (it doesn't display anything). Other types of buttons inherit from it.
newtype BaseButton = BaseButton Object
                       deriving newtype AsVariant

instance HasBaseClass BaseButton where
        type BaseClass BaseButton = Control
        super = coerce

-- | Boolean matrix.
--   A two-dimensional array of boolean values, can be used to efficiently store a binary matrix (every matrix element takes only one bit) and query the values using natural cartesian coordinates.
newtype BitMap = BitMap Object
                   deriving newtype AsVariant

instance HasBaseClass BitMap where
        type BaseClass BitMap = Resource
        super = coerce

-- | Renders text using [code]*.fnt[/code] fonts.
--   Renders text using [code]*.fnt[/code] fonts containing texture atlases. Supports distance fields. For using vector font files like TTF directly, see [DynamicFont].
newtype BitmapFont = BitmapFont Object
                       deriving newtype AsVariant

instance HasBaseClass BitmapFont where
        type BaseClass BitmapFont = Font
        super = coerce

-- | Joint used with [Skeleton2D] to control and animate other nodes.
--   Use a hierarchy of [code]Bone2D[/code] bound to a [Skeleton2D] to control, and animate other [Node2D] nodes.
--   		You can use [code]Bone2D[/code] and [code]Skeleton2D[/code] nodes to animate 2D meshes created with the Polygon 2D UV editor.
--   		Each bone has a [member rest] transform that you can reset to with [method apply_rest]. These rest poses are relative to the bone's parent.
--   		If in the editor, you can set the rest pose of an entire skeleton using a menu option, from the code, you need to iterate over the bones to set their individual rest poses.
newtype Bone2D = Bone2D Object
                   deriving newtype AsVariant

instance HasBaseClass Bone2D where
        type BaseClass Bone2D = Node2D
        super = coerce

-- | A node that will attach to a bone.
--   This node must be the child of a [Skeleton] node. You can then select a bone for this node to attach to. The BoneAttachment node will copy the transform of the selected bone.
newtype BoneAttachment = BoneAttachment Object
                           deriving newtype AsVariant

instance HasBaseClass BoneAttachment where
        type BaseClass BoneAttachment = Spatial
        super = coerce

-- | Base class for box containers.
--   Arranges child controls vertically or horizontally, and rearranges the controls automatically when their minimum size changes.
newtype BoxContainer = BoxContainer Object
                         deriving newtype AsVariant

instance HasBaseClass BoxContainer where
        type BaseClass BoxContainer = Container
        super = coerce

-- | Box shape resource.
--   3D box shape that can be a child of a [PhysicsBody] or [Area].
newtype BoxShape = BoxShape Object
                     deriving newtype AsVariant

instance HasBaseClass BoxShape where
        type BaseClass BoxShape = Shape
        super = coerce

newtype BulletPhysicsDirectBodyState = BulletPhysicsDirectBodyState Object
                                         deriving newtype AsVariant

instance HasBaseClass BulletPhysicsDirectBodyState where
        type BaseClass BulletPhysicsDirectBodyState =
             PhysicsDirectBodyState
        super = coerce

newtype BulletPhysicsServer = BulletPhysicsServer Object
                                deriving newtype AsVariant

instance HasBaseClass BulletPhysicsServer where
        type BaseClass BulletPhysicsServer = PhysicsServer
        super = coerce

-- | Standard themed Button.
--   Button is the standard themed button. It can contain text and an icon, and will display them according to the current [Theme].
newtype Button = Button Object
                   deriving newtype AsVariant

instance HasBaseClass Button where
        type BaseClass Button = BaseButton
        super = coerce

-- | Group of Buttons.
--   Group of [Button]. All direct and indirect children buttons become radios. Only one allows being pressed.
--   		[member BaseButton.toggle_mode] should be [code]true[/code].
newtype ButtonGroup = ButtonGroup Object
                        deriving newtype AsVariant

instance HasBaseClass ButtonGroup where
        type BaseClass ButtonGroup = Resource
        super = coerce

-- | CPU-based 3D particle emitter.
--   CPU-based 3D particle node used to create a variety of particle systems and effects.
--   		See also [Particles], which provides the same functionality with hardware acceleration, but may not run on older devices.
newtype CPUParticles = CPUParticles Object
                         deriving newtype AsVariant

instance HasBaseClass CPUParticles where
        type BaseClass CPUParticles = GeometryInstance
        super = coerce

-- | CPU-based 2D particle emitter.
--   CPU-based 2D particle node used to create a variety of particle systems and effects.
--   		See also [Particles2D], which provides the same functionality with hardware acceleration, but may not run on older devices.
newtype CPUParticles2D = CPUParticles2D Object
                           deriving newtype AsVariant

instance HasBaseClass CPUParticles2D where
        type BaseClass CPUParticles2D = Node2D
        super = coerce

newtype CSGBox = CSGBox Object
                   deriving newtype AsVariant

instance HasBaseClass CSGBox where
        type BaseClass CSGBox = CSGPrimitive
        super = coerce

newtype CSGCombiner = CSGCombiner Object
                        deriving newtype AsVariant

instance HasBaseClass CSGCombiner where
        type BaseClass CSGCombiner = CSGShape
        super = coerce

newtype CSGCylinder = CSGCylinder Object
                        deriving newtype AsVariant

instance HasBaseClass CSGCylinder where
        type BaseClass CSGCylinder = CSGPrimitive
        super = coerce

newtype CSGMesh = CSGMesh Object
                    deriving newtype AsVariant

instance HasBaseClass CSGMesh where
        type BaseClass CSGMesh = CSGPrimitive
        super = coerce

newtype CSGPolygon = CSGPolygon Object
                       deriving newtype AsVariant

instance HasBaseClass CSGPolygon where
        type BaseClass CSGPolygon = CSGPrimitive
        super = coerce

newtype CSGPrimitive = CSGPrimitive Object
                         deriving newtype AsVariant

instance HasBaseClass CSGPrimitive where
        type BaseClass CSGPrimitive = CSGShape
        super = coerce

newtype CSGShape = CSGShape Object
                     deriving newtype AsVariant

instance HasBaseClass CSGShape where
        type BaseClass CSGShape = GeometryInstance
        super = coerce

newtype CSGSphere = CSGSphere Object
                      deriving newtype AsVariant

instance HasBaseClass CSGSphere where
        type BaseClass CSGSphere = CSGPrimitive
        super = coerce

newtype CSGTorus = CSGTorus Object
                     deriving newtype AsVariant

instance HasBaseClass CSGTorus where
        type BaseClass CSGTorus = CSGPrimitive
        super = coerce

-- | Camera node, displays from a point of view.
--   Camera is a special node that displays what is visible from its current location. Cameras register themselves in the nearest [Viewport] node (when ascending the tree). Only one camera can be active per viewport. If no viewport is available ascending the tree, the Camera will register in the global viewport. In other words, a Camera just provides [i]3D[/i] display capabilities to a [Viewport], and, without one, a scene registered in that [Viewport] (or higher viewports) can't be displayed.
newtype Camera = Camera Object
                   deriving newtype AsVariant

instance HasBaseClass Camera where
        type BaseClass Camera = Spatial
        super = coerce

-- | Camera node for 2D scenes.
--    It forces the screen (current layer) to scroll following this node. This makes it easier (and faster) to program scrollable scenes than manually changing the position of [CanvasItem] based nodes.
--   		This node is intended to be a simple helper to get things going quickly and it may happen often that more functionality is desired to change how the camera works. To make your own custom camera node, simply inherit from [Node2D] and change the transform of the canvas by calling get_viewport().set_canvas_transform(m) in [Viewport].
newtype Camera2D = Camera2D Object
                     deriving newtype AsVariant

instance HasBaseClass Camera2D where
        type BaseClass Camera2D = Node2D
        super = coerce

newtype CameraFeed = CameraFeed Object
                       deriving newtype AsVariant

instance HasBaseClass CameraFeed where
        type BaseClass CameraFeed = Reference
        super = coerce

newtype CameraServer = CameraServer Object
                         deriving newtype AsVariant

instance HasBaseClass CameraServer where
        type BaseClass CameraServer = Object
        super = coerce

newtype CameraTexture = CameraTexture Object
                          deriving newtype AsVariant

instance HasBaseClass CameraTexture where
        type BaseClass CameraTexture = Texture
        super = coerce

-- | Base class of anything 2D.
--    Canvas items are laid out in a tree; children inherit and extend their parent's transform. CanvasItem is extended by [Control] for anything GUI-related, and by [Node2D] for anything related to the 2D engine.
--   		Any CanvasItem can draw. For this, [method update] must be called, then [constant NOTIFICATION_DRAW] will be received on idle time to request redraw. Because of this, canvas items don't need to be redrawn on every frame, improving the performance significantly. Several functions for drawing on the CanvasItem are provided (see [code]draw_*[/code] functions). However, they can only be used inside the [method Object._notification], signal or [method _draw] virtual functions.
--   		Canvas items are drawn in tree order. By default, children are on top of their parents so a root CanvasItem will be drawn behind everything. This behavior can be changed on a per-item basis.
--   		A CanvasItem can also be hidden, which will also hide its children. It provides many ways to change parameters such as modulation (for itself and its children) and self modulation (only for itself), as well as its blend mode.
--   		Ultimately, a transform notification can be requested, which will notify the node that its global position changed in case the parent tree changed.
newtype CanvasItem = CanvasItem Object
                       deriving newtype AsVariant

instance HasBaseClass CanvasItem where
        type BaseClass CanvasItem = Node
        super = coerce

-- | A material for [CanvasItem]s.
--   [code]CanvasItemMaterial[/code]s provide a means of modifying the textures associated with a CanvasItem. They specialize in describing blend and lighting behaviors for textures. Use a [ShaderMaterial] to more fully customize a material's interactions with a [CanvasItem].
newtype CanvasItemMaterial = CanvasItemMaterial Object
                               deriving newtype AsVariant

instance HasBaseClass CanvasItemMaterial where
        type BaseClass CanvasItemMaterial = Material
        super = coerce

-- | Canvas drawing layer.
--    [CanvasItem] nodes that are direct or indirect children of a [code]CanvasLayer[/code] will be drawn in that layer. The layer is a numeric index that defines the draw order. The default 2D scene renders with index 0, so a [code]CanvasLayer[/code] with index -1 will be drawn below, and one with index 1 will be drawn above. This is very useful for HUDs (in layer 1+ or above), or backgrounds (in layer -1 or below).
newtype CanvasLayer = CanvasLayer Object
                        deriving newtype AsVariant

instance HasBaseClass CanvasLayer where
        type BaseClass CanvasLayer = Node
        super = coerce

-- | Tint the entire canvas.
--   [code]CanvasModulate[/code] tints the canvas elements using its assigned [code]color[/code].
newtype CanvasModulate = CanvasModulate Object
                           deriving newtype AsVariant

instance HasBaseClass CanvasModulate where
        type BaseClass CanvasModulate = Node2D
        super = coerce

-- | Class representing a capsule-shaped [PrimitiveMesh].
newtype CapsuleMesh = CapsuleMesh Object
                        deriving newtype AsVariant

instance HasBaseClass CapsuleMesh where
        type BaseClass CapsuleMesh = PrimitiveMesh
        super = coerce

-- | Capsule shape for collisions.
newtype CapsuleShape = CapsuleShape Object
                         deriving newtype AsVariant

instance HasBaseClass CapsuleShape where
        type BaseClass CapsuleShape = Shape
        super = coerce

-- | Capsule shape for 2D collisions.
newtype CapsuleShape2D = CapsuleShape2D Object
                           deriving newtype AsVariant

instance HasBaseClass CapsuleShape2D where
        type BaseClass CapsuleShape2D = Shape2D
        super = coerce

-- | Keeps children controls centered.
--   CenterContainer Keeps children controls centered. This container keeps all children to their minimum size, in the center.
newtype CenterContainer = CenterContainer Object
                            deriving newtype AsVariant

instance HasBaseClass CenterContainer where
        type BaseClass CenterContainer = Container
        super = coerce

newtype CharFXTransform = CharFXTransform Object
                            deriving newtype AsVariant

instance HasBaseClass CharFXTransform where
        type BaseClass CharFXTransform = Reference
        super = coerce

-- | Binary choice user interface widget.
--   A checkbox allows the user to make a binary choice (choosing only one of two possible options), for example Answer 'yes' or 'no'.
newtype CheckBox = CheckBox Object
                     deriving newtype AsVariant

instance HasBaseClass CheckBox where
        type BaseClass CheckBox = Button
        super = coerce

-- | Checkable button.
--   CheckButton is a toggle button displayed as a check field.
newtype CheckButton = CheckButton Object
                        deriving newtype AsVariant

instance HasBaseClass CheckButton where
        type BaseClass CheckButton = Button
        super = coerce

-- | Circular shape for 2D collisions.
--    This shape is useful for modeling balls or small characters and its collision detection with everything else is very fast.
newtype CircleShape2D = CircleShape2D Object
                          deriving newtype AsVariant

instance HasBaseClass CircleShape2D where
        type BaseClass CircleShape2D = Shape2D
        super = coerce

newtype ClippedCamera = ClippedCamera Object
                          deriving newtype AsVariant

instance HasBaseClass ClippedCamera where
        type BaseClass ClippedCamera = Camera
        super = coerce

-- | Base node for collision objects.
--   CollisionObject is the base class for physics objects. It can hold any number of collision [Shape]s. Each shape must be assigned to a [i]shape owner[/i]. The CollisionObject can have any number of shape owners. Shape owners are not nodes and do not appear in the editor, but are accessible through code using the [code]shape_owner_*[/code] methods.
newtype CollisionObject = CollisionObject Object
                            deriving newtype AsVariant

instance HasBaseClass CollisionObject where
        type BaseClass CollisionObject = Spatial
        super = coerce

-- | Base node for 2D collision objects.
--   CollisionObject2D is the base class for 2D physics objects. It can hold any number of 2D collision [Shape2D]s. Each shape must be assigned to a [i]shape owner[/i]. The CollisionObject2D can have any number of shape owners. Shape owners are not nodes and do not appear in the editor, but are accessible through code using the [code]shape_owner_*[/code] methods.
newtype CollisionObject2D = CollisionObject2D Object
                              deriving newtype AsVariant

instance HasBaseClass CollisionObject2D where
        type BaseClass CollisionObject2D = Node2D
        super = coerce

-- | Editor-only class for defining a collision polygon in 3D space.
--   Allows editing a collision polygon's vertices on a selected plane. Can also set a depth perpendicular to that plane. This class is only available in the editor. It will not appear in the scene tree at runtime. Creates a [Shape] for gameplay. Properties modified during gameplay will have no effect.
newtype CollisionPolygon = CollisionPolygon Object
                             deriving newtype AsVariant

instance HasBaseClass CollisionPolygon where
        type BaseClass CollisionPolygon = Spatial
        super = coerce

-- | Defines a 2D collision polygon.
--   Provides a 2D collision polygon to a [CollisionObject2D] parent. Polygon can be drawn in the editor or specified by a list of vertices.
newtype CollisionPolygon2D = CollisionPolygon2D Object
                               deriving newtype AsVariant

instance HasBaseClass CollisionPolygon2D where
        type BaseClass CollisionPolygon2D = Node2D
        super = coerce

-- | Node that represents collision shape data in 3D space.
--   Editor facility for creating and editing collision shapes in 3D space. You can use this node to represent all sorts of collision shapes, for example, add this to an [Area] to give it a detection shape, or add it to a [PhysicsBody] to create a solid object. [b]IMPORTANT[/b]: this is an Editor-only helper to create shapes, use [method CollisionObject.shape_owner_get_shape] to get the actual shape.
newtype CollisionShape = CollisionShape Object
                           deriving newtype AsVariant

instance HasBaseClass CollisionShape where
        type BaseClass CollisionShape = Spatial
        super = coerce

-- | Node that represents collision shape data in 2D space.
--   Editor facility for creating and editing collision shapes in 2D space. You can use this node to represent all sorts of collision shapes, for example, add this to an [Area2D] to give it a detection shape, or add it to a [PhysicsBody2D] to create a solid object. [b]IMPORTANT[/b]: this is an Editor-only helper to create shapes, use [method CollisionObject2D.shape_owner_get_shape] to get the actual shape.
newtype CollisionShape2D = CollisionShape2D Object
                             deriving newtype AsVariant

instance HasBaseClass CollisionShape2D where
        type BaseClass CollisionShape2D = Node2D
        super = coerce

-- | Color picker control.
--   [Control] node displaying a color picker widget. It's useful for selecting a color from an RGB/RGBA colorspace.
newtype ColorPicker = ColorPicker Object
                        deriving newtype AsVariant

instance HasBaseClass ColorPicker where
        type BaseClass ColorPicker = BoxContainer
        super = coerce

-- | Button that pops out a [ColorPicker].
--   Encapsulates a [ColorPicker] making it accessible by pressing a button. Pressing the button will toggle the [ColorPicker] visibility.
newtype ColorPickerButton = ColorPickerButton Object
                              deriving newtype AsVariant

instance HasBaseClass ColorPickerButton where
        type BaseClass ColorPickerButton = Button
        super = coerce

-- | Colored rectangle.
--   Displays a colored rectangle.
newtype ColorRect = ColorRect Object
                      deriving newtype AsVariant

instance HasBaseClass ColorRect where
        type BaseClass ColorRect = Control
        super = coerce

-- | Concave polygon shape.
--   Concave polygon shape resource, which can be set into a [PhysicsBody] or area. This shape is created by feeding a list of triangles.
newtype ConcavePolygonShape = ConcavePolygonShape Object
                                deriving newtype AsVariant

instance HasBaseClass ConcavePolygonShape where
        type BaseClass ConcavePolygonShape = Shape
        super = coerce

-- | Concave polygon 2D shape resource for physics.
--    It is made out of segments and is very optimal for complex polygonal concave collisions. It is really not advised to use for [RigidBody2D] nodes. A CollisionPolygon2D in convex decomposition mode (solids) or several convex objects are advised for that instead. Otherwise, a concave polygon 2D shape is better for static collisions.
--   		The main difference between a [ConvexPolygonShape2D] and a [code]ConcavePolygonShape2D[/code] is that a concave polygon assumes it is concave and uses a more complex method of collision detection, and a convex one forces itself to be convex in order to speed up collision detection.
newtype ConcavePolygonShape2D = ConcavePolygonShape2D Object
                                  deriving newtype AsVariant

instance HasBaseClass ConcavePolygonShape2D where
        type BaseClass ConcavePolygonShape2D = Shape2D
        super = coerce

-- | A twist joint between two 3D bodies.
--   The joint can rotate the bodies across an axis defined by the local x-axes of the [Joint].
--   		The twist axis is initiated as the x-axis of the [Joint].
--   		Once the Bodies swing, the twist axis is calculated as the middle of the x-axes of the Joint in the local space of the two Bodies.
newtype ConeTwistJoint = ConeTwistJoint Object
                           deriving newtype AsVariant

instance HasBaseClass ConeTwistJoint where
        type BaseClass ConeTwistJoint = Joint
        super = coerce

-- | Helper class to handle INI-style files.
--   This helper class can be used to store [Variant] values on the filesystem using INI-style formatting. The stored values are identified by a section and a key:
--   		[codeblock]
--   		[section]
--   		some_key=42
--   		string_example="Hello World!"
--   		a_vector=Vector3( 1, 0, 2 )
--   		[/codeblock]
--   		The stored data can be saved to or parsed from a file, though ConfigFile objects can also be used directly without accessing the filesystem.
--   		The following example shows how to parse an INI-style file from the system, read its contents and store new values in it:
--   		[codeblock]
--   		var config = ConfigFile.new()
--   		var err = config.load("user://settings.cfg")
--   		if err == OK: # if not, something went wrong with the file loading
--   		    # Look for the display/width pair, and default to 1024 if missing
--   		    var screen_width = config.get_value("display", "width", 1024)
--   		    # Store a variable if and only if it hasn't been defined yet
--   		    if not config.has_section_key("audio", "mute"):
--   		        config.set_value("audio", "mute", false)
--   		    # Save the changes by overwriting the previous file
--   		    config.save("user://settings.cfg")
--   		[/codeblock]
--   		Keep in mind that section and property names can't contain spaces. Anything after a space will be ignored on save and on load.
newtype ConfigFile = ConfigFile Object
                       deriving newtype AsVariant

instance HasBaseClass ConfigFile where
        type BaseClass ConfigFile = Reference
        super = coerce

-- | Dialog for confirmation of actions.
--    This dialog inherits from [AcceptDialog], but has by default an OK and Cancel button (in host OS order).
newtype ConfirmationDialog = ConfirmationDialog Object
                               deriving newtype AsVariant

instance HasBaseClass ConfirmationDialog where
        type BaseClass ConfirmationDialog = AcceptDialog
        super = coerce

-- | Base node for containers.
--    A [code]Container[/code] contains other controls and automatically arranges them in a certain way.
--   		A Control can inherit this to create custom container classes.
newtype Container = Container Object
                      deriving newtype AsVariant

instance HasBaseClass Container where
        type BaseClass Container = Control
        super = coerce

-- | All User Interface nodes inherit from Control. A control's anchors and margins adapt its position and size relative to its parent.
--   Base class for all User Interface or [i]UI[/i] related nodes. [code]Control[/code] features a bounding rectangle that defines its extents, an anchor position relative to its parent control or the current viewport, and margins that represent an offset to the anchor. The margins update automatically when the node, any of its parents, or the screen size change.
--   		For more information on Godot's UI system, anchors, margins, and containers, see the related tutorials in the manual. To build flexible UIs, you'll need a mix of UI elements that inherit from [code]Control[/code] and [Container] nodes.
--   		[b]User Interface nodes and input[/b]
--   		Godot sends input events to the scene's root node first, by calling [method Node._input]. [method Node._input] forwards the event down the node tree to the nodes under the mouse cursor, or on keyboard focus. To do so, it calls [method MainLoop._input_event]. Call [method accept_event] so no other node receives the event. Once you accepted an input, it becomes handled so [method Node._unhandled_input] will not process it.
--   		Only one [code]Control[/code] node can be in keyboard focus. Only the node in focus will receive keyboard events. To get the focus, call [method grab_focus]. [code]Control[/code] nodes lose focus when another node grabs it, or if you hide the node in focus.
--   		Set [member mouse_filter] to [constant MOUSE_FILTER_IGNORE] to tell a [code]Control[/code] node to ignore mouse or touch events. You'll need it if you place an icon on top of a button.
--   		[Theme] resources change the Control's appearance. If you change the [Theme] on a [code]Control[/code] node, it affects all of its children. To override some of the theme's parameters, call one of the [code]add_*_override[/code] methods, like [method add_font_override]. You can override the theme with the inspector.
newtype Control = Control Object
                    deriving newtype AsVariant

instance HasBaseClass Control where
        type BaseClass Control = CanvasItem
        super = coerce

-- | Convex polygon shape for 3D physics.
--   Convex polygon shape resource, which can be added to a [PhysicsBody] or area.
newtype ConvexPolygonShape = ConvexPolygonShape Object
                               deriving newtype AsVariant

instance HasBaseClass ConvexPolygonShape where
        type BaseClass ConvexPolygonShape = Shape
        super = coerce

-- | Convex Polygon Shape for 2D physics.
--    A convex polygon, whatever its shape, is internally decomposed into as many convex polygons as needed to ensure all collision checks against it are always done on convex polygons (which are faster to check).
--   		The main difference between a [code]ConvexPolygonShape2D[/code] and a [ConcavePolygonShape2D] is that a concave polygon assumes it is concave and uses a more complex method of collision detection, and a convex one forces itself to be convex in order to speed up collision detection.
newtype ConvexPolygonShape2D = ConvexPolygonShape2D Object
                                 deriving newtype AsVariant

instance HasBaseClass ConvexPolygonShape2D where
        type BaseClass ConvexPolygonShape2D = Shape2D
        super = coerce

newtype Crypto = Crypto Object
                   deriving newtype AsVariant

instance HasBaseClass Crypto where
        type BaseClass Crypto = Reference
        super = coerce

newtype CryptoKey = CryptoKey Object
                      deriving newtype AsVariant

instance HasBaseClass CryptoKey where
        type BaseClass CryptoKey = Resource
        super = coerce

-- | A CubeMap is a 6 sided 3D texture.
--   A 6-sided 3D texture typically used for faking reflections. It can be used to make an object look as if it's reflecting its surroundings. This usually delivers much better performance than other reflection methods.
newtype CubeMap = CubeMap Object
                    deriving newtype AsVariant

instance HasBaseClass CubeMap where
        type BaseClass CubeMap = Resource
        super = coerce

-- | Generate an axis-aligned cuboid [PrimitiveMesh].
--   
--   		The cube's UV layout is arranged in a 3×2 layout that allows texturing each face individually. To apply the same texture on all faces, change the material's UV property to [code]Vector3(3, 2, 1)[/code].
newtype CubeMesh = CubeMesh Object
                     deriving newtype AsVariant

instance HasBaseClass CubeMesh where
        type BaseClass CubeMesh = PrimitiveMesh
        super = coerce

-- | A mathematic curve.
--   A curve that can be saved and re-used for other objects. By default it ranges between [code]0[/code] and [code]1[/code] on the y-axis and positions points relative to the [code]0.5[/code] y-position.
newtype Curve = Curve Object
                  deriving newtype AsVariant

instance HasBaseClass Curve where
        type BaseClass Curve = Resource
        super = coerce

-- | Describes a Bezier curve in 2D space.
--   This class describes a Bezier curve in 2D space. It is mainly used to give a shape to a [Path2D], but can be manually sampled for other purposes.
--   		It keeps a cache of precalculated points along the curve, to speed further calculations up.
newtype Curve2D = Curve2D Object
                    deriving newtype AsVariant

instance HasBaseClass Curve2D where
        type BaseClass Curve2D = Resource
        super = coerce

-- | Describes a Bezier curve in 3D space.
--   This class describes a Bezier curve in 3D space. It is mainly used to give a shape to a [Path], but can be manually sampled for other purposes.
--   		It keeps a cache of precalculated points along the curve, to speed further calculations up.
newtype Curve3D = Curve3D Object
                    deriving newtype AsVariant

instance HasBaseClass Curve3D where
        type BaseClass Curve3D = Resource
        super = coerce

-- | A texture that shows a curve.
--   Renders a given [Curve] provided to it. Simplifies the task of drawing curves and/or saving them as image files.
newtype CurveTexture = CurveTexture Object
                         deriving newtype AsVariant

instance HasBaseClass CurveTexture where
        type BaseClass CurveTexture = Texture
        super = coerce

-- | Class representing a cylindrical [PrimitiveMesh].
--    This class can be used to create cones by setting either the [member top_radius] or [member bottom_radius] properties to 0.0.
newtype CylinderMesh = CylinderMesh Object
                         deriving newtype AsVariant

instance HasBaseClass CylinderMesh where
        type BaseClass CylinderMesh = PrimitiveMesh
        super = coerce

-- | Cylinder shape for collisions.
newtype CylinderShape = CylinderShape Object
                          deriving newtype AsVariant

instance HasBaseClass CylinderShape where
        type BaseClass CylinderShape = Shape
        super = coerce

-- | Damped spring constraint for 2D physics.
--    This resembles a spring joint that always wants to go back to a given length.
newtype DampedSpringJoint2D = DampedSpringJoint2D Object
                                deriving newtype AsVariant

instance HasBaseClass DampedSpringJoint2D where
        type BaseClass DampedSpringJoint2D = Joint2D
        super = coerce

-- | Directional light from a distance, as from the Sun.
--   A directional light is a type of [Light] node that models an infinite number of parallel rays covering the entire scene. It is used for lights with strong intensity that are located far away from the scene to model sunlight or moonlight. The worldspace location of the DirectionalLight transform (origin) is ignored. Only the basis is used do determine light direction.
newtype DirectionalLight = DirectionalLight Object
                             deriving newtype AsVariant

instance HasBaseClass DirectionalLight where
        type BaseClass DirectionalLight = Light
        super = coerce

-- | DynamicFont renders vector font files at runtime.
--   DynamicFont renders vector font files (such as TTF or OTF) dynamically at runtime instead of using a prerendered texture atlas like [BitmapFont]. This trades the faster loading time of [BitmapFont]s for the ability to change font parameters like size and spacing during runtime. [DynamicFontData] is used for referencing the font file paths.
--   		[codeblock]
--   		var dynamic_font = DynamicFont.new()
--   		dynamic_font.font_data = load("res://BarlowCondensed-Bold.ttf")
--   		dynamic_font.size = 64
--   		$"Label".set("custom_fonts/font", dynamic_font)
--   		[/codeblock]
newtype DynamicFont = DynamicFont Object
                        deriving newtype AsVariant

instance HasBaseClass DynamicFont where
        type BaseClass DynamicFont = Font
        super = coerce

-- | Used with [DynamicFont] to describe the location of a font file.
--   Used with [DynamicFont] to describe the location of a vector font file for dynamic rendering at runtime.
newtype DynamicFontData = DynamicFontData Object
                            deriving newtype AsVariant

instance HasBaseClass DynamicFontData where
        type BaseClass DynamicFontData = Resource
        super = coerce

newtype EditorExportPlugin = EditorExportPlugin Object
                               deriving newtype AsVariant

instance HasBaseClass EditorExportPlugin where
        type BaseClass EditorExportPlugin = Reference
        super = coerce

newtype EditorFeatureProfile = EditorFeatureProfile Object
                                 deriving newtype AsVariant

instance HasBaseClass EditorFeatureProfile where
        type BaseClass EditorFeatureProfile = Reference
        super = coerce

newtype EditorFileDialog = EditorFileDialog Object
                             deriving newtype AsVariant

instance HasBaseClass EditorFileDialog where
        type BaseClass EditorFileDialog = ConfirmationDialog
        super = coerce

-- | Resource filesystem, as the editor sees it.
--   This object holds information of all resources in the filesystem, their types, etc.
newtype EditorFileSystem = EditorFileSystem Object
                             deriving newtype AsVariant

instance HasBaseClass EditorFileSystem where
        type BaseClass EditorFileSystem = Node
        super = coerce

-- | A directory for the resource filesystem.
--   A more generalized, low-level variation of the directory concept.
newtype EditorFileSystemDirectory = EditorFileSystemDirectory Object
                                      deriving newtype AsVariant

instance HasBaseClass EditorFileSystemDirectory where
        type BaseClass EditorFileSystemDirectory = Object
        super = coerce

-- | Registers a custom resource importer in the editor. Use the class to parse any file and import it as a new resource type.
--   EditorImportPlugins provide a way to extend the editor's resource import functionality. Use them to import resources from custom files or to provide alternatives to the editor's existing importers. Register your [EditorPlugin] with [method EditorPlugin.add_import_plugin].
--   		EditorImportPlugins work by associating with specific file extensions and a resource type. See [method get_recognized_extensions] and [method get_resource_type]). They may optionally specify some import presets that affect the import process. EditorImportPlugins are responsible for creating the resources and saving them in the [code].import[/code] directory.
--   		Below is an example EditorImportPlugin that imports a [Mesh] from a file with the extension ".special" or ".spec":
--   		[codeblock]
--   		tool
--   		extends EditorImportPlugin
--   
--   		func get_importer_name():
--   		    return "my.special.plugin"
--   
--   		func get_visible_name():
--   		    return "Special Mesh Importer"
--   
--   		func get_recognized_extensions():
--   		    return ["special", "spec"]
--   
--   		func get_save_extension():
--   		    return "mesh"
--   
--   		func get_resource_type():
--   		    return "Mesh"
--   
--   		func get_preset_count():
--   		    return 1
--   
--   		func get_preset_name(i):
--   		    return "Default"
--   
--   		func get_import_options(i):
--   		    return [{"name": "my_option", "default_value": false}]
--   
--   		func import(source_file, save_path, options, platform_variants, gen_files):
--   		    var file = File.new()
--   		    if file.open(source_file, File.READ) != OK:
--   		        return FAILED
--   
--   		    var mesh = Mesh.new()
--   		    # Fill the Mesh with data read in 'file', left as exercise to the reader
--   
--   		    var filename = save_path + "." + get_save_extension()
--   		    ResourceSaver.save(filename, mesh)
--   		    return OK
--   		[/codeblock]
newtype EditorImportPlugin = EditorImportPlugin Object
                               deriving newtype AsVariant

instance HasBaseClass EditorImportPlugin where
        type BaseClass EditorImportPlugin = ResourceImporter
        super = coerce

newtype EditorInspector = EditorInspector Object
                            deriving newtype AsVariant

instance HasBaseClass EditorInspector where
        type BaseClass EditorInspector = ScrollContainer
        super = coerce

newtype EditorInspectorPlugin = EditorInspectorPlugin Object
                                  deriving newtype AsVariant

instance HasBaseClass EditorInspectorPlugin where
        type BaseClass EditorInspectorPlugin = Reference
        super = coerce

-- | Godot editor's interface.
--   EditorInterface gives you control over Godot editor's window. It allows customizing the window, saving and (re-)loading scenes, rendering mesh previews, inspecting and editing resources and objects, and provides access to [EditorSettings], [EditorFileSystem], [EditorResourcePreview], [ScriptEditor], the editor viewport, and information about scenes.
newtype EditorInterface = EditorInterface Object
                            deriving newtype AsVariant

instance HasBaseClass EditorInterface where
        type BaseClass EditorInterface = Node
        super = coerce

newtype EditorNavigationMeshGenerator = EditorNavigationMeshGenerator Object
                                          deriving newtype AsVariant

instance HasBaseClass EditorNavigationMeshGenerator where
        type BaseClass EditorNavigationMeshGenerator = Object
        super = coerce

-- | Used by the editor to extend its functionality.
--   Plugins are used by the editor to extend functionality. The most common types of plugins are those which edit a given node or resource type, import plugins and export plugins. Also see [EditorScript] to add functions to the editor.
newtype EditorPlugin = EditorPlugin Object
                         deriving newtype AsVariant

instance HasBaseClass EditorPlugin where
        type BaseClass EditorPlugin = Node
        super = coerce

newtype EditorProperty = EditorProperty Object
                           deriving newtype AsVariant

instance HasBaseClass EditorProperty where
        type BaseClass EditorProperty = Container
        super = coerce

newtype EditorResourceConversionPlugin = EditorResourceConversionPlugin Object
                                           deriving newtype AsVariant

instance HasBaseClass EditorResourceConversionPlugin where
        type BaseClass EditorResourceConversionPlugin = Reference
        super = coerce

-- | Helper to generate previews of resources or files.
--   This object is used to generate previews for resources of files.
newtype EditorResourcePreview = EditorResourcePreview Object
                                  deriving newtype AsVariant

instance HasBaseClass EditorResourcePreview where
        type BaseClass EditorResourcePreview = Node
        super = coerce

-- | Custom generator of previews.
--   Custom code to generate previews. Please check "file_dialog/thumbnail_size" in EditorSettings to find out the right size to do previews at.
newtype EditorResourcePreviewGenerator = EditorResourcePreviewGenerator Object
                                           deriving newtype AsVariant

instance HasBaseClass EditorResourcePreviewGenerator where
        type BaseClass EditorResourcePreviewGenerator = Reference
        super = coerce

newtype EditorSceneImporter = EditorSceneImporter Object
                                deriving newtype AsVariant

instance HasBaseClass EditorSceneImporter where
        type BaseClass EditorSceneImporter = Reference
        super = coerce

newtype EditorSceneImporterAssimp = EditorSceneImporterAssimp Object
                                      deriving newtype AsVariant

instance HasBaseClass EditorSceneImporterAssimp where
        type BaseClass EditorSceneImporterAssimp = EditorSceneImporter
        super = coerce

-- | Post process scenes after import
--   Imported scenes can be automatically modified right after import by setting their [i]Custom Script[/i] Import property to a [code]tool[/code] script that inherits from this class.
--   		The [method post_import] callback receives the imported scene's root node and returns the modified version of the scene. Usage example:
--   		[codeblock]
--   		tool # needed so it runs in editor
--   		extends EditorScenePostImport
--   
--   		# This sample changes all node names
--   
--   		# Called right after the scene is imported and gets the root node
--   		func post_import(scene):
--   		    # change all node names to "modified_[oldnodename]"
--   		    iterate(scene)
--   		    return scene # remember to return the imported scene
--   
--   		func iterate(node):
--   		    if node != null:
--   		        node.name = "modified_" + node.name
--   		        for child in node.get_children():
--   		            iterate(child)
--   		[/codeblock]
newtype EditorScenePostImport = EditorScenePostImport Object
                                  deriving newtype AsVariant

instance HasBaseClass EditorScenePostImport where
        type BaseClass EditorScenePostImport = Reference
        super = coerce

-- | Base script that can be used to add extension functions to the editor.
--   Scripts extending this class and implementing its [code]_run()[/code] method can be executed from the Script Editor's [code]File -> Run[/code] menu option (or by pressing [code]CTRL+Shift+X[/code]) while the editor is running. This is useful for adding custom in-editor functionality to Godot. For more complex additions, consider using [EditorPlugin]s instead. Note that extending scripts need to have [code]tool mode[/code] enabled.
--   		Example script:
--   		[codeblock]
--   		tool
--   		extends EditorScript
--   
--   		func _run():
--   		    print("Hello from the Godot Editor!")
--   		[/codeblock]
--   		Note that the script is run in the Editor context, which means the output is visible in the console window started with the Editor (STDOUT) instead of the usual Godot [i]Output[/i] dock.
newtype EditorScript = EditorScript Object
                         deriving newtype AsVariant

instance HasBaseClass EditorScript where
        type BaseClass EditorScript = Reference
        super = coerce

-- | Manages the SceneTree selection in the editor.
--   This object manages the SceneTree selection in the editor.
newtype EditorSelection = EditorSelection Object
                            deriving newtype AsVariant

instance HasBaseClass EditorSelection where
        type BaseClass EditorSelection = Object
        super = coerce

-- | Object that holds the project-independent editor settings.
--    These settings are generally visible in the Editor Settings menu.
--   		Accessing the settings is done by using the regular [Object] API, such as:
--   		[codeblock]
--   		settings.set(prop,value)
--   		settings.get(prop)
--   		list_of_settings = settings.get_property_list()
--   		[/codeblock]
newtype EditorSettings = EditorSettings Object
                           deriving newtype AsVariant

instance HasBaseClass EditorSettings where
        type BaseClass EditorSettings = Resource
        super = coerce

-- | Custom gizmo for editing Spatial objects.
--   Custom gizmo that is used for providing custom visualization and editing (handles) for 3D Spatial objects. See [EditorSpatialGizmoPlugin] for more information.
newtype EditorSpatialGizmo = EditorSpatialGizmo Object
                               deriving newtype AsVariant

instance HasBaseClass EditorSpatialGizmo where
        type BaseClass EditorSpatialGizmo = SpatialGizmo
        super = coerce

-- | Used by the editor to define Spatial gizmo types.
--   EditorSpatialGizmoPlugin allows you to define a new type of Gizmo. There are two main ways to do so: extending [EditorSpatialGizmoPlugin] for the simpler gizmos, or creating a new [EditorSpatialGizmo] type. See the tutorial in the documentation for more info.
newtype EditorSpatialGizmoPlugin = EditorSpatialGizmoPlugin Object
                                     deriving newtype AsVariant

instance HasBaseClass EditorSpatialGizmoPlugin where
        type BaseClass EditorSpatialGizmoPlugin = Resource
        super = coerce

newtype EditorSpinSlider = EditorSpinSlider Object
                             deriving newtype AsVariant

instance HasBaseClass EditorSpinSlider where
        type BaseClass EditorSpinSlider = Range
        super = coerce

newtype EditorVCSInterface = EditorVCSInterface Object
                               deriving newtype AsVariant

instance HasBaseClass EditorVCSInterface where
        type BaseClass EditorVCSInterface = Object
        super = coerce

-- | Holds a reference to an [Object]'s instance ID.
--   Utility class which holds a reference to the internal identifier of an [Object] instance, as given by [method Object.get_instance_id]. This ID can then be used to retrieve the object instance with [method @GDScript.instance_from_id].
--   		This class is used internally by the editor inspector and script debugger, but can also be used in plugins to pass and display objects as their IDs.
newtype EncodedObjectAsID = EncodedObjectAsID Object
                              deriving newtype AsVariant

instance HasBaseClass EncodedObjectAsID where
        type BaseClass EncodedObjectAsID = Reference
        super = coerce

-- | Resource for environment nodes (like [WorldEnvironment]) that define multiple rendering options.
--   Resource for environment nodes (like [WorldEnvironment]) that define multiple environment operations (such as background [Sky] or [Color], ambient light, fog, depth-of-field...). These parameters affect the final render of the scene. The order of these operations is:
--   		- DOF Blur
--   		- Motion Blur
--   		- Bloom
--   		- Tonemap (auto exposure)
--   		- Adjustments
newtype Environment = Environment Object
                        deriving newtype AsVariant

instance HasBaseClass Environment where
        type BaseClass Environment = Resource
        super = coerce

-- | A class that stores an expression you can execute.
--   An expression can be made of any arithmetic operation, built-in math function call, method call of a passed instance, or built-in type construction call.
--   		An example expression text using the built-in math functions could be [code]sqrt(pow(3,2) + pow(4,2))[/code].
--   		In the following example we use a [LineEdit] node to write our expression and show the result.
--   		[codeblock]
--   		onready var expression = Expression.new()
--   
--   		func _ready():
--   		    $LineEdit.connect("text_entered", self, "_on_text_entered")
--   
--   		func _on_text_entered(command):
--   		    var error = expression.parse(command, [])
--   		    if error != OK:
--   		        print(expression.get_error_text())
--   		        return
--   		    var result = expression.execute([], null, true)
--   		    if not expression.has_execute_failed():
--   		        $LineEdit.text = str(result)
--   		[/codeblock]
newtype Expression = Expression Object
                       deriving newtype AsVariant

instance HasBaseClass Expression where
        type BaseClass Expression = Reference
        super = coerce

-- | Dialog for selecting files or directories in the filesystem.
--   FileDialog is a preset dialog used to choose files and directories in the filesystem. It supports filter masks.
newtype FileDialog = FileDialog Object
                       deriving newtype AsVariant

instance HasBaseClass FileDialog where
        type BaseClass FileDialog = ConfirmationDialog
        super = coerce

-- | Internationalized font and text drawing support.
--   Font contains a unicode compatible character set, as well as the ability to draw it with variable width, ascent, descent and kerning. For creating fonts from TTF files (or other font formats), see the editor support for fonts.
newtype Font = Font Object
                 deriving newtype AsVariant

instance HasBaseClass Font where
        type BaseClass Font = Resource
        super = coerce

-- | Reference to a function in an object.
--   In GDScript, functions are not [i]first-class objects[/i]. This means it is impossible to store them directly as variables, return them from another function, or pass them as arguments.
--   		However, by creating a [code]FuncRef[/code] using the [method @GDScript.funcref] function, a reference to a function in a given object can be created, passed around and called.
newtype FuncRef = FuncRef Object
                    deriving newtype AsVariant

instance HasBaseClass FuncRef where
        type BaseClass FuncRef = Reference
        super = coerce

newtype GDNative = GDNative Object
                     deriving newtype AsVariant

instance HasBaseClass GDNative where
        type BaseClass GDNative = Reference
        super = coerce

newtype GDNativeLibrary = GDNativeLibrary Object
                            deriving newtype AsVariant

instance HasBaseClass GDNativeLibrary where
        type BaseClass GDNativeLibrary = Resource
        super = coerce

newtype GDScript = GDScript Object
                     deriving newtype AsVariant

instance HasBaseClass GDScript where
        type BaseClass GDScript = Script
        super = coerce

newtype GDScriptFunctionState = GDScriptFunctionState Object
                                  deriving newtype AsVariant

instance HasBaseClass GDScriptFunctionState where
        type BaseClass GDScriptFunctionState = Reference
        super = coerce

newtype GIProbe = GIProbe Object
                    deriving newtype AsVariant

instance HasBaseClass GIProbe where
        type BaseClass GIProbe = VisualInstance
        super = coerce

newtype GIProbeData = GIProbeData Object
                        deriving newtype AsVariant

instance HasBaseClass GIProbeData where
        type BaseClass GIProbeData = Resource
        super = coerce

-- | The generic 6 degrees of freedom joint can implement a variety of joint-types by locking certain axes' rotation or translation.
--   The first 3 DOF axes are linear axes, which represent translation of Bodies, and the latter 3 DOF axes represent the angular motion. Each axis can be either locked, or limited.
newtype Generic6DOFJoint = Generic6DOFJoint Object
                             deriving newtype AsVariant

instance HasBaseClass Generic6DOFJoint where
        type BaseClass Generic6DOFJoint = Joint
        super = coerce

-- | Base node for geometry based visual instances.
--    Shares some common functionality like visibility and custom materials.
newtype GeometryInstance = GeometryInstance Object
                             deriving newtype AsVariant

instance HasBaseClass GeometryInstance where
        type BaseClass GeometryInstance = VisualInstance
        super = coerce

-- | Color interpolator node.
--   Given a set of colors, this node will interpolate them in order, meaning, that if you have color 1, color 2 and color 3, the ramp will interpolate (generate the colors between two colors) from color 1 to color 2 and from color 2 to color 3. Initially the ramp will have 2 colors (black and white), one (black) at ramp lower offset 0 and the other (white) at the ramp higher offset 1.
newtype Gradient = Gradient Object
                     deriving newtype AsVariant

instance HasBaseClass Gradient where
        type BaseClass Gradient = Resource
        super = coerce

-- | Gradient filled texture.
--   Uses a [Gradient] to fill the texture data, the gradient will be filled from left to right using colors obtained from the gradient, this means that the texture does not necessarily represent an exact copy of the gradient, but instead an interpolation of samples obtained from the gradient at fixed steps (see [member width]).
newtype GradientTexture = GradientTexture Object
                            deriving newtype AsVariant

instance HasBaseClass GradientTexture where
        type BaseClass GradientTexture = Texture
        super = coerce

-- | GraphEdit is an area capable of showing various GraphNodes. It manages connection events between them.
--   GraphEdit manages the showing of GraphNodes it contains, as well as connections and disconnections between them. Signals are sent for each of these two events. Disconnection between GraphNodes slots is disabled by default.
--   		It is greatly advised to enable low processor usage mode (see [member OS.low_processor_usage_mode]) when using GraphEdits.
newtype GraphEdit = GraphEdit Object
                      deriving newtype AsVariant

instance HasBaseClass GraphEdit where
        type BaseClass GraphEdit = Control
        super = coerce

-- | A GraphNode is a container with several input and output slots allowing connections between GraphNodes. Slots can have different, incompatible types.
--   A GraphNode is a container defined by a title. It can have 1 or more input and output slots, which can be enabled (shown) or disabled (not shown) and have different (incompatible) types. Colors can also be assigned to slots. A tuple of input and output slots is defined for each GUI element included in the GraphNode. Input and output connections are left and right slots, but only enabled slots are counted as connections.
newtype GraphNode = GraphNode Object
                      deriving newtype AsVariant

instance HasBaseClass GraphNode where
        type BaseClass GraphNode = Container
        super = coerce

-- | Grid container used to arrange elements in a grid like layout.
--   Grid container will arrange its children in a grid like structure, the grid columns are specified using the [member columns] property and the number of rows will be equal to the number of children in the container divided by the number of columns, for example: if the container has 5 children, and 2 columns, there will be 3 rows in the container. Notice that grid layout will preserve the columns and rows for every size of the container.
newtype GridContainer = GridContainer Object
                          deriving newtype AsVariant

instance HasBaseClass GridContainer where
        type BaseClass GridContainer = Container
        super = coerce

newtype GridMap = GridMap Object
                    deriving newtype AsVariant

instance HasBaseClass GridMap where
        type BaseClass GridMap = Spatial
        super = coerce

-- | Groove constraint for 2D physics.
--    This is useful for making a body "slide" through a segment placed in another.
newtype GrooveJoint2D = GrooveJoint2D Object
                          deriving newtype AsVariant

instance HasBaseClass GrooveJoint2D where
        type BaseClass GrooveJoint2D = Joint2D
        super = coerce

-- | Horizontal box container.
--    See [BoxContainer].
newtype HBoxContainer = HBoxContainer Object
                          deriving newtype AsVariant

instance HasBaseClass HBoxContainer where
        type BaseClass HBoxContainer = BoxContainer
        super = coerce

-- | Horizontal scroll bar.
--    See [ScrollBar]. This one goes from left (min) to right (max).
newtype HScrollBar = HScrollBar Object
                       deriving newtype AsVariant

instance HasBaseClass HScrollBar where
        type BaseClass HScrollBar = ScrollBar
        super = coerce

-- | Horizontal separator.
--    See [Separator]. It is used to separate objects vertically, though (but it looks horizontal!).
newtype HSeparator = HSeparator Object
                       deriving newtype AsVariant

instance HasBaseClass HSeparator where
        type BaseClass HSeparator = Separator
        super = coerce

-- | Horizontal slider.
--    See [Slider]. This one goes from left (min) to right (max).
newtype HSlider = HSlider Object
                    deriving newtype AsVariant

instance HasBaseClass HSlider where
        type BaseClass HSlider = Slider
        super = coerce

-- | Horizontal split container.
--    See [SplitContainer]. This goes from left to right.
newtype HSplitContainer = HSplitContainer Object
                            deriving newtype AsVariant

instance HasBaseClass HSplitContainer where
        type BaseClass HSplitContainer = SplitContainer
        super = coerce

-- | Hyper-text transfer protocol client.
--   Hyper-text transfer protocol client (sometimes called "User Agent"). Used to make HTTP requests to download web content, upload files and other data or to communicate with various services, among other use cases.
--   		Note that this client only needs to connect to a host once (see [method connect_to_host]) to send multiple requests. Because of this, methods that take URLs usually take just the part after the host instead of the full URL, as the client is already connected to a host. See [method request] for a full example and to get started.
--   		A [code]HTTPClient[/code] should be reused between multiple requests or to connect to different hosts instead of creating one client per request. Supports SSL and SSL server certificate verification. HTTP status codes in the 2xx range indicate success, 3xx redirection (i.e. "try again, but over here"), 4xx something was wrong with the request, and 5xx something went wrong on the server's side.
--   		For more information on HTTP, see https://developer.mozilla.org/en-US/docs/Web/HTTP (or read RFC 2616 to get it straight from the source: https://tools.ietf.org/html/rfc2616).
newtype HTTPClient = HTTPClient Object
                       deriving newtype AsVariant

instance HasBaseClass HTTPClient where
        type BaseClass HTTPClient = Reference
        super = coerce

-- | A node with the ability to send HTTP requests.
--    Uses [HTTPClient] internally.
--   		Can be used to make HTTP requests, i.e. download or upload files or web content via HTTP.
newtype HTTPRequest = HTTPRequest Object
                        deriving newtype AsVariant

instance HasBaseClass HTTPRequest where
        type BaseClass HTTPRequest = Node
        super = coerce

newtype HashingContext = HashingContext Object
                           deriving newtype AsVariant

instance HasBaseClass HashingContext where
        type BaseClass HashingContext = Reference
        super = coerce

-- | Height map shape for 3D physics (bullet only)
--   Height map shape resource, which can be added to a [PhysicsBody] or [Area].
newtype HeightMapShape = HeightMapShape Object
                           deriving newtype AsVariant

instance HasBaseClass HeightMapShape where
        type BaseClass HeightMapShape = Shape
        super = coerce

-- | A hinge between two 3D bodies.
--   Normally uses the z-axis of body A as the hinge axis, another axis can be specified when adding it manually though.
newtype HingeJoint = HingeJoint Object
                       deriving newtype AsVariant

instance HasBaseClass HingeJoint where
        type BaseClass HingeJoint = Joint
        super = coerce

-- | Internet protocol (IP) support functions like DNS resolution.
--   IP contains support functions for the Internet Protocol (IP). TCP/IP support is in different classes (see [StreamPeerTCP] and [TCP_Server]). IP provides DNS hostname resolution support, both blocking and threaded.
newtype IP = IP Object
               deriving newtype AsVariant

instance HasBaseClass IP where
        type BaseClass IP = Object
        super = coerce

-- | Unix IP support. See [IP].
--   Unix-specific implementation of IP support functions. See [IP].
newtype IP_Unix = IP_Unix Object
                    deriving newtype AsVariant

instance HasBaseClass IP_Unix where
        type BaseClass IP_Unix = IP
        super = coerce

-- | Image datatype.
--   Native image datatype. Contains image data, which can be converted to a [Texture], and several functions to interact with it. The maximum width and height for an [code]Image[/code] are [constant MAX_WIDTH] and [constant MAX_HEIGHT].
newtype Image = Image Object
                  deriving newtype AsVariant

instance HasBaseClass Image where
        type BaseClass Image = Resource
        super = coerce

-- | A [Texture] based on an [Image].
--    Can be created from an [Image] with [method create_from_image].
newtype ImageTexture = ImageTexture Object
                         deriving newtype AsVariant

instance HasBaseClass ImageTexture where
        type BaseClass ImageTexture = Texture
        super = coerce

-- | Draws simple geometry from code.
--    Uses a drawing mode similar to OpenGL 1.x.
newtype ImmediateGeometry = ImmediateGeometry Object
                              deriving newtype AsVariant

instance HasBaseClass ImmediateGeometry where
        type BaseClass ImmediateGeometry = GeometryInstance
        super = coerce

-- | A Singleton that deals with inputs.
--    This includes key presses, mouse buttons and movement, joypads, and input actions. Actions and their events can be set in the Project Settings / Input Map tab. Or be set with [InputMap].
newtype Input = Input Object
                  deriving newtype AsVariant

instance HasBaseClass Input where
        type BaseClass Input = Object
        super = coerce

-- | Default implementation of the [Input] class.
--   Default implementation of the [Input] class, used internally by the editor and games for default input management.
newtype InputDefault = InputDefault Object
                         deriving newtype AsVariant

instance HasBaseClass InputDefault where
        type BaseClass InputDefault = Input
        super = coerce

-- | Generic input event
--   Base class of all sort of input event. See [method Node._input].
newtype InputEvent = InputEvent Object
                       deriving newtype AsVariant

instance HasBaseClass InputEvent where
        type BaseClass InputEvent = Resource
        super = coerce

-- | Input event type for actions.
--   Contains a generic action which can be targeted from several type of inputs. Actions can be created from the project settings menu [code]Project > Project Settings > Input Map[/code]. See [method Node._input].
newtype InputEventAction = InputEventAction Object
                             deriving newtype AsVariant

instance HasBaseClass InputEventAction where
        type BaseClass InputEventAction = InputEvent
        super = coerce

newtype InputEventGesture = InputEventGesture Object
                              deriving newtype AsVariant

instance HasBaseClass InputEventGesture where
        type BaseClass InputEventGesture = InputEventWithModifiers
        super = coerce

-- | Input event for gamepad buttons.
--   Input event type for gamepad buttons. For joysticks see [InputEventJoypadMotion].
newtype InputEventJoypadButton = InputEventJoypadButton Object
                                   deriving newtype AsVariant

instance HasBaseClass InputEventJoypadButton where
        type BaseClass InputEventJoypadButton = InputEvent
        super = coerce

-- | Input event type for gamepad joysticks and other motions. For buttons see [code]InputEventJoypadButton[/code].
--   Stores information about joystick motions. One [code]InputEventJoypadMotion[/code] represents one axis at a time.
newtype InputEventJoypadMotion = InputEventJoypadMotion Object
                                   deriving newtype AsVariant

instance HasBaseClass InputEventJoypadMotion where
        type BaseClass InputEventJoypadMotion = InputEvent
        super = coerce

-- | Input event type for keyboard events.
--   Stores key presses on the keyboard. Supports key presses, key releases and [member echo] events.
newtype InputEventKey = InputEventKey Object
                          deriving newtype AsVariant

instance HasBaseClass InputEventKey where
        type BaseClass InputEventKey = InputEventWithModifiers
        super = coerce

newtype InputEventMIDI = InputEventMIDI Object
                           deriving newtype AsVariant

instance HasBaseClass InputEventMIDI where
        type BaseClass InputEventMIDI = InputEvent
        super = coerce

newtype InputEventMagnifyGesture = InputEventMagnifyGesture Object
                                     deriving newtype AsVariant

instance HasBaseClass InputEventMagnifyGesture where
        type BaseClass InputEventMagnifyGesture = InputEventGesture
        super = coerce

-- | Base input event type for mouse events.
--   Stores general mouse events information.
newtype InputEventMouse = InputEventMouse Object
                            deriving newtype AsVariant

instance HasBaseClass InputEventMouse where
        type BaseClass InputEventMouse = InputEventWithModifiers
        super = coerce

-- | Input event type for mouse button events.
--   Contains mouse click information. See [method Node._input].
newtype InputEventMouseButton = InputEventMouseButton Object
                                  deriving newtype AsVariant

instance HasBaseClass InputEventMouseButton where
        type BaseClass InputEventMouseButton = InputEventMouse
        super = coerce

-- | Input event type for mouse motion events.
--   Contains mouse motion information. Supports relative, absolute positions and speed. See [method Node._input].
newtype InputEventMouseMotion = InputEventMouseMotion Object
                                  deriving newtype AsVariant

instance HasBaseClass InputEventMouseMotion where
        type BaseClass InputEventMouseMotion = InputEventMouse
        super = coerce

newtype InputEventPanGesture = InputEventPanGesture Object
                                 deriving newtype AsVariant

instance HasBaseClass InputEventPanGesture where
        type BaseClass InputEventPanGesture = InputEventGesture
        super = coerce

-- | Input event type for screen drag events.
--   		(only available on mobile devices)
--   Contains screen drag information. See [method Node._input].
newtype InputEventScreenDrag = InputEventScreenDrag Object
                                 deriving newtype AsVariant

instance HasBaseClass InputEventScreenDrag where
        type BaseClass InputEventScreenDrag = InputEvent
        super = coerce

-- | Input event type for screen touch events.
--   		(only available on mobile devices)
--   Stores multi-touch press/release information. Supports touch press, touch release and [member index] for multi-touch count and order.
newtype InputEventScreenTouch = InputEventScreenTouch Object
                                  deriving newtype AsVariant

instance HasBaseClass InputEventScreenTouch where
        type BaseClass InputEventScreenTouch = InputEvent
        super = coerce

-- | Base class for keys events with modifiers.
--   Contains keys events information with modifiers support like [code]Shift[/code] or [code]Alt[/code]. See [method Node._input].
newtype InputEventWithModifiers = InputEventWithModifiers Object
                                    deriving newtype AsVariant

instance HasBaseClass InputEventWithModifiers where
        type BaseClass InputEventWithModifiers = InputEvent
        super = coerce

-- | Singleton that manages [InputEventAction].
--   Manages all [InputEventAction] which can be created/modified from the project settings menu [code]Project > Project Settings > Input Map[/code] or in code with [method add_action] and [method action_add_event]. See [method Node._input].
newtype InputMap = InputMap Object
                     deriving newtype AsVariant

instance HasBaseClass InputMap where
        type BaseClass InputMap = Object
        super = coerce

-- | Placeholder for the root [Node] of a [PackedScene].
--   Turning on the option [b]Load As Placeholder[/b] for an instanced scene in the editor causes it to be replaced by an InstancePlaceholder when running the game. This makes it possible to delay actually loading the scene until calling [method replace_by_instance]. This is useful to avoid loading large scenes all at once by loading parts of it selectively.
--   		The InstancePlaceholder does not have a transform. This causes any child nodes to be positioned relatively to the Viewport from point (0,0), rather than their parent as displayed in the editor. Replacing the placeholder with a scene with a transform will transform children relatively to their parent again.
newtype InstancePlaceholder = InstancePlaceholder Object
                                deriving newtype AsVariant

instance HasBaseClass InstancePlaceholder where
        type BaseClass InstancePlaceholder = Node
        super = coerce

-- | Camera which moves toward another node.
--   InterpolatedCamera is a [Camera] which smoothly moves to match a target node's position and rotation.
--   		If it is not [member enabled] or does not have a valid target set, InterpolatedCamera acts like a normal Camera.
newtype InterpolatedCamera = InterpolatedCamera Object
                               deriving newtype AsVariant

instance HasBaseClass InterpolatedCamera where
        type BaseClass InterpolatedCamera = Camera
        super = coerce

-- | Control that provides a list of selectable items (and/or icons) in a single column, or optionally in multiple columns.
--   This control provides a selectable list of items that may be in a single (or multiple columns) with option of text, icons, or both text and icon. Tooltips are supported and may be different for every item in the list.
--   		Selectable items in the list may be selected or deselected and multiple selection may be enabled. Selection with right mouse button may also be enabled to allow use of popup context menus. Items may also be 'activated' with a double click (or Enter key).
newtype ItemList = ItemList Object
                     deriving newtype AsVariant

instance HasBaseClass ItemList where
        type BaseClass ItemList = Control
        super = coerce

-- | Data class wrapper for decoded JSON.
--   Returned by [method JSON.parse], [code]JSONParseResult[/code] contains decoded JSON or error information if JSON source not successfully parsed. You can check if JSON source was successfully parsed with [code]if json_result.error == OK[/code].
newtype JSONParseResult = JSONParseResult Object
                            deriving newtype AsVariant

instance HasBaseClass JSONParseResult where
        type BaseClass JSONParseResult = Reference
        super = coerce

newtype JSONRPC = JSONRPC Object
                    deriving newtype AsVariant

instance HasBaseClass JSONRPC where
        type BaseClass JSONRPC = Object
        super = coerce

newtype JavaClass = JavaClass Object
                      deriving newtype AsVariant

instance HasBaseClass JavaClass where
        type BaseClass JavaClass = Reference
        super = coerce

newtype JavaClassWrapper = JavaClassWrapper Object
                             deriving newtype AsVariant

instance HasBaseClass JavaClassWrapper where
        type BaseClass JavaClassWrapper = Object
        super = coerce

-- | Singleton that connects the engine with the browser's JavaScript context in HTML5 export.
--   The JavaScript singleton is implemented only in HTML5 export. It's used to access the browser's JavaScript context. This allows interaction with embedding pages or calling third-party JavaScript APIs.
newtype JavaScript = JavaScript Object
                       deriving newtype AsVariant

instance HasBaseClass JavaScript where
        type BaseClass JavaScript = Object
        super = coerce

-- | Base class for all 3D joints
--   Joints are used to bind together two physics bodies. They have a solver priority and can define if the bodies of the two attached nodes should be able to collide with each other.
newtype Joint = Joint Object
                  deriving newtype AsVariant

instance HasBaseClass Joint where
        type BaseClass Joint = Spatial
        super = coerce

-- | Base node for all joint constraints in 2D physics.
--    Joints take 2 bodies and apply a custom constraint.
newtype Joint2D = Joint2D Object
                    deriving newtype AsVariant

instance HasBaseClass Joint2D where
        type BaseClass Joint2D = Node2D
        super = coerce

-- | Kinematic body 3D node.
--   Kinematic bodies are special types of bodies that are meant to be user-controlled. They are not affected by physics at all; to other types of bodies, such as a character or a rigid body, these are the same as a static body. However, they have two main uses:
--   		[b]Simulated motion:[/b] When these bodies are moved manually, either from code or from an [AnimationPlayer] (with [member AnimationPlayer.playback_process_mode] set to "physics"), the physics will automatically compute an estimate of their linear and angular velocity. This makes them very useful for moving platforms or other AnimationPlayer-controlled objects (like a door, a bridge that opens, etc).
--   		[b]Kinematic characters:[/b] KinematicBody also has an API for moving objects (the [method move_and_collide] and [method move_and_slide] methods) while performing collision tests. This makes them really useful to implement characters that collide against a world, but that don't require advanced physics.
newtype KinematicBody = KinematicBody Object
                          deriving newtype AsVariant

instance HasBaseClass KinematicBody where
        type BaseClass KinematicBody = PhysicsBody
        super = coerce

-- | Kinematic body 2D node.
--   Kinematic bodies are special types of bodies that are meant to be user-controlled. They are not affected by physics at all; to other types of bodies, such as a character or a rigid body, these are the same as a static body. However, they have two main uses:
--   		[b]Simulated motion:[/b] When these bodies are moved manually, either from code or from an [AnimationPlayer] (with [member AnimationPlayer.playback_process_mode] set to "physics"), the physics will automatically compute an estimate of their linear and angular velocity. This makes them very useful for moving platforms or other AnimationPlayer-controlled objects (like a door, a bridge that opens, etc).
--   		[b]Kinematic characters:[/b] KinematicBody2D also has an API for moving objects (the [method move_and_collide] and [method move_and_slide] methods) while performing collision tests. This makes them really useful to implement characters that collide against a world, but that don't require advanced physics.
newtype KinematicBody2D = KinematicBody2D Object
                            deriving newtype AsVariant

instance HasBaseClass KinematicBody2D where
        type BaseClass KinematicBody2D = PhysicsBody2D
        super = coerce

-- | Collision data for KinematicBody collisions.
--   Contains collision data for KinematicBody collisions. When a [KinematicBody] is moved using [method KinematicBody.move_and_collide], it stops if it detects a collision with another body. If a collision is detected, a KinematicCollision object is returned.
--   		This object contains information about the collision, including the colliding object, the remaining motion, and the collision position. This information can be used to calculate a collision response.
newtype KinematicCollision = KinematicCollision Object
                               deriving newtype AsVariant

instance HasBaseClass KinematicCollision where
        type BaseClass KinematicCollision = Reference
        super = coerce

-- | Collision data for KinematicBody2D collisions.
--   Contains collision data for KinematicBody2D collisions. When a [KinematicBody2D] is moved using [method KinematicBody2D.move_and_collide], it stops if it detects a collision with another body. If a collision is detected, a KinematicCollision2D object is returned.
--   		This object contains information about the collision, including the colliding object, the remaining motion, and the collision position. This information can be used to calculate a collision response.
newtype KinematicCollision2D = KinematicCollision2D Object
                                 deriving newtype AsVariant

instance HasBaseClass KinematicCollision2D where
        type BaseClass KinematicCollision2D = Reference
        super = coerce

-- | Displays plain text in a line or wrapped inside a rectangle. For formatted text, use [RichTextLabel].
--   Label displays plain text on the screen. It gives you control over the horizontal and vertical alignment, and can wrap the text inside the node's bounding rectangle. It doesn't support bold, italics or other formatting. For that, use [RichTextLabel] instead.
--   		Note that contrarily to most other [Control]s, Label's [member Control.mouse_filter] defaults to MOUSE_FILTER_IGNORE (i.e. it doesn't react to mouse input events). This implies that a label won't display any configured [member Control.hint_tooltip], unless you change its mouse filter.
newtype Label = Label Object
                  deriving newtype AsVariant

instance HasBaseClass Label where
        type BaseClass Label = Control
        super = coerce

-- | A Texture capable of storing many smaller Textures with offsets.
--   
--   		You can dynamically add pieces([Texture]) to this [code]LargeTexture[/code] using different offsets.
newtype LargeTexture = LargeTexture Object
                         deriving newtype AsVariant

instance HasBaseClass LargeTexture where
        type BaseClass LargeTexture = Texture
        super = coerce

-- | Provides a base class for different kinds of light nodes.
--   Light is the abstract base class for light nodes, so it shouldn't be used directly (It can't be instanced). Other types of light nodes inherit from it. Light contains the common variables and parameters used for lighting.
newtype Light = Light Object
                  deriving newtype AsVariant

instance HasBaseClass Light where
        type BaseClass Light = VisualInstance
        super = coerce

-- | Casts light in a 2D environment.
--    Light is defined by a (usually grayscale) texture, a color, an energy value, a mode (see constants), and various other parameters (range and shadows-related). Note that Light2D can be used as a mask.
newtype Light2D = Light2D Object
                    deriving newtype AsVariant

instance HasBaseClass Light2D where
        type BaseClass Light2D = Node2D
        super = coerce

-- | Occludes light cast by a Light2D, casting shadows.
--    The LightOccluder2D must be provided with an [OccluderPolygon2D] in order for the shadow to be computed.
newtype LightOccluder2D = LightOccluder2D Object
                            deriving newtype AsVariant

instance HasBaseClass LightOccluder2D where
        type BaseClass LightOccluder2D = Node2D
        super = coerce

-- | A 2D line.
--   A line through several points in 2D space.
newtype Line2D = Line2D Object
                   deriving newtype AsVariant

instance HasBaseClass Line2D where
        type BaseClass Line2D = Node2D
        super = coerce

-- | Control that provides single-line string editing.
--   LineEdit provides a single-line string editor, used for text fields. It features many built-in shortcuts which will always be available:
--   		- Ctrl + C: Copy
--   		- Ctrl + X: Cut
--   		- Ctrl + V or Ctrl + Y: Paste/"yank"
--   		- Ctrl + Z: Undo
--   		- Ctrl + Shift + Z: Redo
--   		- Ctrl + U: Delete text from the cursor position to the beginning of the line
--   		- Ctrl + K: Delete text from the cursor position to the end of the line
--   		- Ctrl + A: Select all text
--   		- Up/Down arrow: Move the cursor to the beginning/end of the line
newtype LineEdit = LineEdit Object
                     deriving newtype AsVariant

instance HasBaseClass LineEdit where
        type BaseClass LineEdit = Control
        super = coerce

-- | Line shape for 2D collisions.
--    It works like a 2D plane and will not allow any body to go to the negative side. Not recommended for rigid bodies, and usually not recommended for static bodies either because it forces checks against it on every frame.
newtype LineShape2D = LineShape2D Object
                        deriving newtype AsVariant

instance HasBaseClass LineShape2D where
        type BaseClass LineShape2D = Shape2D
        super = coerce

-- | Simple button used to represent a link to some resource.
--   This kind of buttons are primarily used when the interaction with the button causes a context change (like linking to a web page).
newtype LinkButton = LinkButton Object
                       deriving newtype AsVariant

instance HasBaseClass LinkButton where
        type BaseClass LinkButton = BaseButton
        super = coerce

newtype Listener = Listener Object
                     deriving newtype AsVariant

instance HasBaseClass Listener where
        type BaseClass Listener = Spatial
        super = coerce

-- | Abstract base class for the game's main loop.
--   [code]MainLoop[/code] is the abstract base class for a Godot project's game loop. It in inherited by [SceneTree], which is the default game loop implementation used in Godot projects, though it is also possible to write and use one's own [code]MainLoop[/code] subclass instead of the scene tree.
--   		Upon application start, a [code]MainLoop[/code] implementation has to be provided to the OS, or the application will exit. This happens automatically (and a [SceneTree] is created) unless a main [Script] is provided from the command line (with e.g. [code]godot -s my_loop.gd[/code], which should then be a [code]MainLoop[/code] implementation.
--   		Here is an example script implementing a simple [code]MainLoop[/code]:
--   		[codeblock]
--   		extends MainLoop
--   
--   		var time_elapsed = 0
--   		var keys_typed = []
--   		var quit = false
--   
--   		func _initialize():
--   			print("Initialized:")
--   			print("  Starting time: %s" % str(time_elapsed))
--   
--   		func _idle(delta):
--   			time_elapsed += delta
--   			# Return true to end the main loop
--   			return quit
--   
--   		func _input_event(event):
--   			# Record keys
--   			if event is InputEventKey and event.pressed and !event.echo:
--   				keys_typed.append(OS.get_scancode_string(event.scancode))
--   				# Quit on Escape press
--   				if event.scancode == KEY_ESCAPE:
--   					quit = true
--   			# Quit on any mouse click
--   			if event is InputEventMouseButton:
--   				quit = true
--   
--   		func _finalize():
--   			print("Finalized:")
--   			print("  End time: %s" % str(time_elapsed))
--   			print("  Keys typed: %s" % var2str(keys_typed))
--   		[/codeblock]
newtype MainLoop = MainLoop Object
                     deriving newtype AsVariant

instance HasBaseClass MainLoop where
        type BaseClass MainLoop = Object
        super = coerce

-- | Simple margin container.
--   Adds a top, left, bottom, and right margin to all [Control] nodes that are direct children of the container. To control the [MarginContainer]'s margin, use the [code]margin_*[/code] theme properties listed below.
--   		[b]Note:[/b] Be careful, [Control] margin values are different than the constant margin values. If you want to change the custom margin values of the [MarginContainer] by code you should use the following examples:
--   		[codeblock]
--   		var margin_value = 100
--   		set("custom_constants/margin_top", margin_value)
--   		set("custom_constants/margin_left", margin_value)
--   		set("custom_constants/margin_bottom", margin_value)
--   		set("custom_constants/margin_right", margin_value)
--   		[/codeblock]
newtype MarginContainer = MarginContainer Object
                            deriving newtype AsVariant

instance HasBaseClass MarginContainer where
        type BaseClass MarginContainer = Container
        super = coerce

-- | Abstract base [Resource] for coloring and shading geometry.
--   Material is a base [Resource] used for coloring and shading geometry. All materials inherit from it and almost all [VisualInstance] derived nodes carry a Material. A few flags and parameters are shared between all material types and are configured here.
newtype Material = Material Object
                     deriving newtype AsVariant

instance HasBaseClass Material where
        type BaseClass Material = Resource
        super = coerce

-- | Special button that brings up a [PopupMenu] when clicked.
--    That's pretty much all it does, as it's just a helper class when building GUIs.
newtype MenuButton = MenuButton Object
                       deriving newtype AsVariant

instance HasBaseClass MenuButton where
        type BaseClass MenuButton = Button
        super = coerce

-- | A [Resource] that contains vertex-array based geometry.
--   Mesh is a type of [Resource] that contains vertex-array based geometry, divided in [i]surfaces[/i]. Each surface contains a completely separate array and a material used to draw it. Design wise, a mesh with multiple surfaces is preferred to a single surface, because objects created in 3D editing software commonly contain multiple materials.
newtype Mesh = Mesh Object
                 deriving newtype AsVariant

instance HasBaseClass Mesh where
        type BaseClass Mesh = Resource
        super = coerce

-- | Helper tool to access and edit [Mesh] data.
--   The MeshDataTool provides access to individual vertices in a [Mesh]. It allows users to read and edit vertex data of meshes. It also creates an array of faces and edges.
--   		To use the MeshDataTool, load a mesh with [method create_from_surface]. When you are finished editing the data commit the data to a mesh with [method commit_to_surface].
--   		Below is an example of how the MeshDataTool may be used.
--   		[codeblock]
--   		var mdt = MeshDataTool.new()
--   		mdt.create_from_surface(mesh, 0)
--   		for i in range(mdt.get_vertex_count()):
--   		    var vertex = mdt.get_vertex(i)
--   		    ...
--   		    mdt.set_vertex(i, vertex)
--   		mesh.surface_remove(0)
--   		mdt.commit_to_surface(mesh)
--   		[/codeblock]
newtype MeshDataTool = MeshDataTool Object
                         deriving newtype AsVariant

instance HasBaseClass MeshDataTool where
        type BaseClass MeshDataTool = Reference
        super = coerce

-- | Node that instances meshes into a scenario.
--   MeshInstance is a node that takes a [Mesh] resource and adds it to the current scenario by creating an instance of it. This is the class most often used to get 3D geometry rendered and can be used to instance a single [Mesh] in many places. This allows to reuse geometry and save on resources. When a [Mesh] has to be instanced more than thousands of times at close proximity, consider using a [MultiMesh] in a [MultiMeshInstance] instead.
newtype MeshInstance = MeshInstance Object
                         deriving newtype AsVariant

instance HasBaseClass MeshInstance where
        type BaseClass MeshInstance = GeometryInstance
        super = coerce

-- | Node used for displaying a [Mesh] in 2D.
--    Can be constructed from an existing [Sprite] use tool in Toolbar. Select "Sprite" then "Convert to Mesh2D", select settings in popup and press "Create Mesh2D".
newtype MeshInstance2D = MeshInstance2D Object
                           deriving newtype AsVariant

instance HasBaseClass MeshInstance2D where
        type BaseClass MeshInstance2D = Node2D
        super = coerce

-- | Library of meshes.
--    Contains a list of [Mesh] resources, each with name and ID. Useful for GridMap or painting Terrain.
newtype MeshLibrary = MeshLibrary Object
                        deriving newtype AsVariant

instance HasBaseClass MeshLibrary where
        type BaseClass MeshLibrary = Resource
        super = coerce

newtype MeshTexture = MeshTexture Object
                        deriving newtype AsVariant

instance HasBaseClass MeshTexture where
        type BaseClass MeshTexture = Texture
        super = coerce

newtype MobileVRInterface = MobileVRInterface Object
                              deriving newtype AsVariant

instance HasBaseClass MobileVRInterface where
        type BaseClass MobileVRInterface = ARVRInterface
        super = coerce

-- | Provides high performance mesh instancing.
--   MultiMesh provides low level mesh instancing. Drawing thousands of [MeshInstance] nodes can be slow because each object is submitted to the GPU to be drawn individually.
--   		MultiMesh is much faster because it can draw thousands of instances with a single draw call, resulting in less API overhead.
--   		As a drawback, if the instances are too far away of each other, performance may be reduced as every single instance will always rendered (they are spatially indexed as one, for the whole object).
--   		Since instances may have any behavior, the AABB used for visibility must be provided by the user.
newtype MultiMesh = MultiMesh Object
                      deriving newtype AsVariant

instance HasBaseClass MultiMesh where
        type BaseClass MultiMesh = Resource
        super = coerce

-- | Node that instances a [MultiMesh].
--   [code]MultiMeshInstance[/code] is a specialized node to instance [GeometryInstance]s based on a [MultiMesh] resource.
--   		This is useful to optimize the rendering of a high amount of instances of a given mesh (for example tree in a forest or grass strands).
newtype MultiMeshInstance = MultiMeshInstance Object
                              deriving newtype AsVariant

instance HasBaseClass MultiMeshInstance where
        type BaseClass MultiMeshInstance = GeometryInstance
        super = coerce

newtype MultiMeshInstance2D = MultiMeshInstance2D Object
                                deriving newtype AsVariant

instance HasBaseClass MultiMeshInstance2D where
        type BaseClass MultiMeshInstance2D = Node2D
        super = coerce

-- | High Level Multiplayer API.
--   This class implements most of the logic behind the high level multiplayer API.
--   		By default, [SceneTree] has a reference to this class that is used to provide multiplayer capabilities (i.e. RPC/RSET) across the whole scene.
--   		It is possible to override the MultiplayerAPI instance used by specific Nodes by setting the [member Node.custom_multiplayer] property, effectively allowing to run both client and server in the same scene.
newtype MultiplayerAPI = MultiplayerAPI Object
                           deriving newtype AsVariant

instance HasBaseClass MultiplayerAPI where
        type BaseClass MultiplayerAPI = Reference
        super = coerce

newtype MultiplayerPeerGDNative = MultiplayerPeerGDNative Object
                                    deriving newtype AsVariant

instance HasBaseClass MultiplayerPeerGDNative where
        type BaseClass MultiplayerPeerGDNative = NetworkedMultiplayerPeer
        super = coerce

newtype NativeScript = NativeScript Object
                         deriving newtype AsVariant

instance HasBaseClass NativeScript where
        type BaseClass NativeScript = Script
        super = coerce

-- | Mesh-based navigation and pathfinding node.
--   Provides navigation and pathfinding within a collection of [NavigationMesh]es. By default these will be automatically collected from child [NavigationMeshInstance] nodes, but they can also be added on the fly with [method navmesh_add]. In addition to basic pathfinding, this class also assists with aligning navigation agents with the meshes they are navigating on.
newtype Navigation = Navigation Object
                       deriving newtype AsVariant

instance HasBaseClass Navigation where
        type BaseClass Navigation = Spatial
        super = coerce

-- | 2D navigation and pathfinding node.
--   Navigation2D provides navigation and pathfinding within a 2D area, specified as a collection of [NavigationPolygon] resources. By default these are automatically collected from child [NavigationPolygonInstance] nodes, but they can also be added on the fly with [method navpoly_add].
newtype Navigation2D = Navigation2D Object
                         deriving newtype AsVariant

instance HasBaseClass Navigation2D where
        type BaseClass Navigation2D = Node2D
        super = coerce

newtype NavigationMesh = NavigationMesh Object
                           deriving newtype AsVariant

instance HasBaseClass NavigationMesh where
        type BaseClass NavigationMesh = Resource
        super = coerce

newtype NavigationMeshInstance = NavigationMeshInstance Object
                                   deriving newtype AsVariant

instance HasBaseClass NavigationMeshInstance where
        type BaseClass NavigationMeshInstance = Spatial
        super = coerce

-- | A node that has methods to draw outlines or use indices of vertices to create navigation polygons.
--   There are two ways to create polygons. Either by using the [method add_outline] method or using the [method add_polygon] method.
--   		Using [method add_outline]:
--   		[codeblock]
--   		var polygon = NavigationPolygon.new()
--   		var outline = PoolVector2Array([Vector2(0, 0), Vector2(0, 50), Vector2(50, 50), Vector2(50, 0)])
--   		polygon.add_outline(outline)
--   		polygon.make_polygons_from_outlines()
--   		$NavigationPolygonInstance.navpoly = polygon
--   		[/codeblock]
--   		Using [method add_polygon] and indices of the vertices array.
--   		[codeblock]
--   		var polygon = NavigationPolygon.new()
--   		var vertices = PoolVector2Array([Vector2(0, 0), Vector2(0, 50), Vector2(50, 50), Vector2(50, 0)])
--   		polygon.set_vertices(vertices)
--   		var indices = PoolIntArray(0, 3, 1)
--   		polygon.add_polygon(indices)
--   		$NavigationPolygonInstance.navpoly = polygon
--   		[/codeblock]
newtype NavigationPolygon = NavigationPolygon Object
                              deriving newtype AsVariant

instance HasBaseClass NavigationPolygon where
        type BaseClass NavigationPolygon = Resource
        super = coerce

newtype NavigationPolygonInstance = NavigationPolygonInstance Object
                                      deriving newtype AsVariant

instance HasBaseClass NavigationPolygonInstance where
        type BaseClass NavigationPolygonInstance = Node2D
        super = coerce

newtype NetworkedMultiplayerENet = NetworkedMultiplayerENet Object
                                     deriving newtype AsVariant

instance HasBaseClass NetworkedMultiplayerENet where
        type BaseClass NetworkedMultiplayerENet = NetworkedMultiplayerPeer
        super = coerce

-- | A high-level network interface to simplify multiplayer interactions.
--   Manages the connection to network peers. Assigns unique IDs to each client connected to the server.
newtype NetworkedMultiplayerPeer = NetworkedMultiplayerPeer Object
                                     deriving newtype AsVariant

instance HasBaseClass NetworkedMultiplayerPeer where
        type BaseClass NetworkedMultiplayerPeer = PacketPeer
        super = coerce

-- | Scalable texture-based frame that tiles the texture's centers and sides, but keeps the corners' original size. Perfect for panels and dialog boxes.
--   Better known as 9-slice panels, NinePatchRect produces clean panels of any size, based on a small texture. To do so, it splits the texture in a 3 by 3 grid. When you scale the node, it tiles the texture's sides horizontally or vertically, the center on both axes but it doesn't scale or tile the corners.
newtype NinePatchRect = NinePatchRect Object
                          deriving newtype AsVariant

instance HasBaseClass NinePatchRect where
        type BaseClass NinePatchRect = Control
        super = coerce

-- | Base class for all [i]scene[/i] objects.
--   Nodes are Godot's building blocks. They can be assigned as the child of another node, resulting in a tree arrangement. A given node can contain any number of nodes as children with the requirement that all siblings (direct children of a node) should have unique names.
--   		A tree of nodes is called a [i]scene[/i]. Scenes can be saved to the disk and then instanced into other scenes. This allows for very high flexibility in the architecture and data model of Godot projects.
--   		[b]Scene tree:[/b] The [SceneTree] contains the active tree of nodes. When a node is added to the scene tree, it receives the [constant NOTIFICATION_ENTER_TREE] notification and its [method _enter_tree] callback is triggered. Child nodes are always added [i]after[/i] their parent node, i.e. the [method _enter_tree] callback of a parent node will be triggered before its child's.
--   		Once all nodes have been added in the scene tree, they receive the [constant NOTIFICATION_READY] notification and their respective [method _ready] callbacks are triggered. For groups of nodes, the [method _ready] callback is called in reverse order, starting with the children and moving up to the parent nodes.
--   		This means that when adding a node to the scene tree, the following order will be used for the callbacks: [method _enter_tree] of the parent, [method _enter_tree] of the children, [method _ready] of the children and finally [method _ready] of the parent (recursively for the entire scene tree).
--   		[b]Processing:[/b] Nodes can override the "process" state, so that they receive a callback on each frame requesting them to process (do something). Normal processing (callback [method _process], toggled with [method set_process]) happens as fast as possible and is dependent on the frame rate, so the processing time [i]delta[/i] is passed as an argument. Physics processing (callback [method _physics_process], toggled with [method set_physics_process]) happens a fixed number of times per second (60 by default) and is useful for code related to the physics engine.
--   		Nodes can also process input events. When present, the [method _input] function will be called for each input that the program receives. In many cases, this can be overkill (unless used for simple projects), and the [method _unhandled_input] function might be preferred; it is called when the input event was not handled by anyone else (typically, GUI [Control] nodes), ensuring that the node only receives the events that were meant for it.
--   		To keep track of the scene hierarchy (especially when instancing scenes into other scenes), an "owner" can be set for the node with the [member owner] property. This keeps track of who instanced what. This is mostly useful when writing editors and tools, though.
--   		Finally, when a node is freed with [method Object.free] or [method queue_free], it will also free all its children.
--   		[b]Groups:[/b] Nodes can be added to as many groups as you want to be easy to manage, you could create groups like "enemies" or "collectables" for example, depending on your game. See [method add_to_group], [method is_in_group] and [method remove_from_group]. You can then retrieve all nodes in these groups, iterate them and even call methods on groups via the methods on [SceneTree].
--   		[b]Networking with nodes:[/b] After connecting to a server (or making one, see [NetworkedMultiplayerENet]) it is possible to use the built-in RPC (remote procedure call) system to communicate over the network. By calling [method rpc] with a method name, it will be called locally and in all connected peers (peers = clients and the server that accepts connections). To identify which node receives the RPC call Godot will use its [NodePath] (make sure node names are the same on all peers). Also take a look at the high-level networking tutorial and corresponding demos.
newtype Node = Node Object
                 deriving newtype AsVariant

instance HasBaseClass Node where
        type BaseClass Node = Object
        super = coerce

-- | A 2D game object, parent of all 2D related nodes. Has a position, rotation, scale and Z-index.
--   A 2D game object, with a position, rotation and scale. All 2D physics nodes and sprites inherit from Node2D. Use Node2D as a parent node to move, scale and rotate children in a 2D project. Also gives control on the node's render order.
newtype Node2D = Node2D Object
                   deriving newtype AsVariant

instance HasBaseClass Node2D where
        type BaseClass Node2D = CanvasItem
        super = coerce

newtype NoiseTexture = NoiseTexture Object
                         deriving newtype AsVariant

instance HasBaseClass NoiseTexture where
        type BaseClass NoiseTexture = Texture
        super = coerce

-- | Defines a 2D polygon for LightOccluder2D.
--   Editor facility that helps you draw a 2D polygon used as resource for [LightOccluder2D].
newtype OccluderPolygon2D = OccluderPolygon2D Object
                              deriving newtype AsVariant

instance HasBaseClass OccluderPolygon2D where
        type BaseClass OccluderPolygon2D = Resource
        super = coerce

-- | Omnidirectional light, such as a light bulb or a candle.
--   An Omnidirectional light is a type of [Light] that emits light in all directions. The light is attenuated by distance and this attenuation can be configured by changing its energy, radius, and attenuation parameters.
newtype OmniLight = OmniLight Object
                      deriving newtype AsVariant

instance HasBaseClass OmniLight where
        type BaseClass OmniLight = Light
        super = coerce

newtype OpenSimplexNoise = OpenSimplexNoise Object
                             deriving newtype AsVariant

instance HasBaseClass OpenSimplexNoise where
        type BaseClass OpenSimplexNoise = Resource
        super = coerce

-- | Button control that provides selectable options when pressed.
--   OptionButton is a type button that provides a selectable list of items when pressed. The item selected becomes the "current" item and is displayed as the button text.
newtype OptionButton = OptionButton Object
                         deriving newtype AsVariant

instance HasBaseClass OptionButton where
        type BaseClass OptionButton = Button
        super = coerce

newtype PCKPacker = PCKPacker Object
                      deriving newtype AsVariant

instance HasBaseClass PCKPacker where
        type BaseClass PCKPacker = Reference
        super = coerce

-- | Optimized translation.
--    Uses real-time compressed translations, which results in very small dictionaries.
newtype PHashTranslation = PHashTranslation Object
                             deriving newtype AsVariant

instance HasBaseClass PHashTranslation where
        type BaseClass PHashTranslation = Translation
        super = coerce

newtype PackedDataContainer = PackedDataContainer Object
                                deriving newtype AsVariant

instance HasBaseClass PackedDataContainer where
        type BaseClass PackedDataContainer = Resource
        super = coerce

newtype PackedDataContainerRef = PackedDataContainerRef Object
                                   deriving newtype AsVariant

instance HasBaseClass PackedDataContainerRef where
        type BaseClass PackedDataContainerRef = Reference
        super = coerce

-- | An abstraction of a serialized scene.
--   A simplified interface to a scene file. Provides access to operations and checks that can be performed on the scene resource itself.
--   		Can be used to save a node to a file. When saving, the node as well as all the node it owns get saved (see [code]owner[/code] property on [Node]). Note that the node doesn't need to own itself.
--   		Example of saving a node with different owners: The following example creates 3 objects: [code]Node2D[/code] ([code]node[/code]), [code]RigidBody2D[/code] ([code]rigid[/code]) and [code]CollisionObject2D[/code] ([code]collision[/code]). [code]collision[/code] is a child of [code]rigid[/code] which is a child of [code]node[/code]. Only [code]rigid[/code] is owned by [code]node[/code] and [code]pack[/code] will therefore only save those two nodes, but not [code]collision[/code].
--   		[codeblock]
--   		# create the objects
--   		var node = Node2D.new()
--   		var rigid = RigidBody2D.new()
--   		var collision = CollisionShape2D.new()
--   
--   		# create the object hierarchy
--   		rigid.add_child(collision)
--   		node.add_child(rigid)
--   
--   		# change owner of rigid, but not of collision
--   		rigid.owner = node
--   
--   		var scene = PackedScene.new()
--   		# only node and rigid are now packed
--   		var result = scene.pack(node)
--   		if result == OK:
--   		    ResourceSaver.save("res://path/name.scn", scene) # or user://...
--   		[/codeblock]
newtype PackedScene = PackedScene Object
                        deriving newtype AsVariant

instance HasBaseClass PackedScene where
        type BaseClass PackedScene = Resource
        super = coerce

-- | Abstraction and base class for packet-based protocols.
--   PacketPeer is an abstraction and base class for packet-based protocols (such as UDP). It provides an API for sending and receiving packets both as raw data or variables. This makes it easy to transfer data over a protocol, without having to encode data as low level bytes or having to worry about network ordering.
newtype PacketPeer = PacketPeer Object
                       deriving newtype AsVariant

instance HasBaseClass PacketPeer where
        type BaseClass PacketPeer = Reference
        super = coerce

newtype PacketPeerGDNative = PacketPeerGDNative Object
                               deriving newtype AsVariant

instance HasBaseClass PacketPeerGDNative where
        type BaseClass PacketPeerGDNative = PacketPeer
        super = coerce

-- | Wrapper to use a PacketPeer over a StreamPeer.
--   PacketStreamPeer provides a wrapper for working using packets over a stream. This allows for using packet based code with StreamPeers. PacketPeerStream implements a custom protocol over the StreamPeer, so the user should not read or write to the wrapped StreamPeer directly.
newtype PacketPeerStream = PacketPeerStream Object
                             deriving newtype AsVariant

instance HasBaseClass PacketPeerStream where
        type BaseClass PacketPeerStream = PacketPeer
        super = coerce

-- | UDP packet peer.
--    Can be used to send raw UDP packets as well as [Variant]s.
newtype PacketPeerUDP = PacketPeerUDP Object
                          deriving newtype AsVariant

instance HasBaseClass PacketPeerUDP where
        type BaseClass PacketPeerUDP = PacketPeer
        super = coerce

-- | Provides an opaque background for [Control] children.
--   Panel is a [Control] that displays an opaque background. It's commonly used as a parent and container for other types of [Control] nodes.
newtype Panel = Panel Object
                  deriving newtype AsVariant

instance HasBaseClass Panel where
        type BaseClass Panel = Control
        super = coerce

-- | Panel container type.
--    This container fits controls inside of the delimited area of a stylebox. It's useful for giving controls an outline.
newtype PanelContainer = PanelContainer Object
                           deriving newtype AsVariant

instance HasBaseClass PanelContainer where
        type BaseClass PanelContainer = Container
        super = coerce

-- | A type of [Sky] used to draw a background texture.
--   A resource referenced in an [Environment] that is used to draw a background. The Panorama sky functions similar to skyboxes in other engines except it uses a equirectangular sky map instead of a cube map.
newtype PanoramaSky = PanoramaSky Object
                        deriving newtype AsVariant

instance HasBaseClass PanoramaSky where
        type BaseClass PanoramaSky = Sky
        super = coerce

-- | A node used to create a parallax scrolling background.
--   A ParallaxBackground uses one or more [ParallaxLayer] child nodes to create a parallax effect. Each [ParallaxLayer] can move at a different speed using [member ParallaxLayer.motion_offset]. This creates an illusion of depth in a 2D game. If not used with a [Camera2D], you must manually calculate the [member scroll_offset].
newtype ParallaxBackground = ParallaxBackground Object
                               deriving newtype AsVariant

instance HasBaseClass ParallaxBackground where
        type BaseClass ParallaxBackground = CanvasLayer
        super = coerce

-- | A parallax scrolling layer to be used with [ParallaxBackground].
--   A ParallaxLayer must be the child of a [ParallaxBackground] node. Each ParallaxLayer can be set to move at different speeds relative to the camera movement or the [member ParallaxBackground.scroll_offset] value.
--   		This node's children will be affected by its scroll offset.
--   		Note that any changes to this node's position and scale made after it enters the scene will be ignored.
newtype ParallaxLayer = ParallaxLayer Object
                          deriving newtype AsVariant

instance HasBaseClass ParallaxLayer where
        type BaseClass ParallaxLayer = Node2D
        super = coerce

-- | 3D particle emitter.
--   3D particle node used to create a variety of particle systems and effects. [code]Particles[/code] features an emitter that generates some number of particles at a given rate.
--   		Use the [code]process_material[/code] property to add a [ParticlesMaterial] to configure particle appearance and behavior. Alternatively, you can add a [ShaderMaterial] which will be applied to all particles.
newtype Particles = Particles Object
                      deriving newtype AsVariant

instance HasBaseClass Particles where
        type BaseClass Particles = GeometryInstance
        super = coerce

-- | 2D particle emitter.
--   2D particle node used to create a variety of particle systems and effects. [code]Particles2D[/code] features an emitter that generates some number of particles at a given rate.
--   		Use the [code]process_material[/code] property to add a [ParticlesMaterial] to configure particle appearance and behavior. Alternatively, you can add a [ShaderMaterial] which will be applied to all particles.
newtype Particles2D = Particles2D Object
                        deriving newtype AsVariant

instance HasBaseClass Particles2D where
        type BaseClass Particles2D = Node2D
        super = coerce

-- | Particle properties for [Particles] and [Particles2D] nodes.
--   ParticlesMaterial defines particle properties and behavior. It is used in the [code]process_material[/code] of [Particles] and [Particles2D] emitter nodes.
--   		Some of this material's properties are applied to each particle when emitted, while others can have a [CurveTexture] applied to vary values over the lifetime of the particle.
--   		When a randomness ratio is applied to a property it is used to scale that property by a random amount. The random ratio is used to interpolate between [code]1.0[/code] and a random number less than one, the result is multiplied by the property to obtain the randomized property. For example a random ratio of [code]0.4[/code] would scale the original property between [code]0.4-1.0[/code] of its original value.
newtype ParticlesMaterial = ParticlesMaterial Object
                              deriving newtype AsVariant

instance HasBaseClass ParticlesMaterial where
        type BaseClass ParticlesMaterial = Material
        super = coerce

-- | Contains a [Curve3D] path for [PathFollow] nodes to follow.
--   Can have [PathFollow] child nodes moving along the [Curve3D]. See [PathFollow] for more information on the usage.
--   		Note that the path is considered as relative to the moved nodes (children of [PathFollow]). As such, the curve should usually start with a zero vector [code](0, 0, 0)[/code].
newtype Path = Path Object
                 deriving newtype AsVariant

instance HasBaseClass Path where
        type BaseClass Path = Spatial
        super = coerce

-- | Contains a [Curve2D] path for [PathFollow2D] nodes to follow.
--   Can have [PathFollow2D] child nodes moving along the [Curve2D]. See [PathFollow2D] for more information on the usage.
--   		Note that the path is considered as relative to the moved nodes (children of [PathFollow2D]). As such, the curve should usually start with a zero vector [code](0, 0)[/code].
newtype Path2D = Path2D Object
                   deriving newtype AsVariant

instance HasBaseClass Path2D where
        type BaseClass Path2D = Node2D
        super = coerce

-- | Point sampler for a [Path].
--   This node takes its parent [Path], and returns the coordinates of a point within it, given a distance from the first vertex.
--   		It is useful for making other nodes follow a path, without coding the movement pattern. For that, the nodes must be descendants of this node. Then, when setting an offset in this node, the descendant nodes will move accordingly.
newtype PathFollow = PathFollow Object
                       deriving newtype AsVariant

instance HasBaseClass PathFollow where
        type BaseClass PathFollow = Spatial
        super = coerce

-- | Point sampler for a [Path2D].
--   This node takes its parent [Path2D], and returns the coordinates of a point within it, given a distance from the first vertex.
--   		It is useful for making other nodes follow a path, without coding the movement pattern. For that, the nodes must be descendants of this node. Then, when setting an offset in this node, the descendant nodes will move accordingly.
newtype PathFollow2D = PathFollow2D Object
                         deriving newtype AsVariant

instance HasBaseClass PathFollow2D where
        type BaseClass PathFollow2D = Node2D
        super = coerce

-- | Exposes performance-related data.
--   This class provides access to a number of different monitors related to performance, such as memory usage, draw calls, and FPS. These are the same as the values displayed in the [i]Monitor[/i] tab in the editor's [i]Debugger[/i] panel. By using the [method get_monitor] method of this class, you can access this data from your code. Note that a few of these monitors are only available in debug mode and will always return 0 when used in a release build.
--   		Many of these monitors are not updated in real-time, so there may be a short delay between changes.
newtype Performance = Performance Object
                        deriving newtype AsVariant

instance HasBaseClass Performance where
        type BaseClass Performance = Object
        super = coerce

newtype PhysicalBone = PhysicalBone Object
                         deriving newtype AsVariant

instance HasBaseClass PhysicalBone where
        type BaseClass PhysicalBone = PhysicsBody
        super = coerce

-- | Direct access object to a physics body in the [Physics2DServer].
--   Provides direct access to a physics body in the [Physics2DServer], allowing safe changes to physics properties. This object is passed via the direct state callback of rigid/character bodies, and is intended for changing the direct state of that body. See [method RigidBody2D._integrate_forces].
newtype Physics2DDirectBodyState = Physics2DDirectBodyState Object
                                     deriving newtype AsVariant

instance HasBaseClass Physics2DDirectBodyState where
        type BaseClass Physics2DDirectBodyState = Object
        super = coerce

-- | Software implementation of [Physics2DDirectBodyState].
--    This object exposes no new methods or properties and should not be used, as [Physics2DDirectBodyState] selects the best implementation available.
newtype Physics2DDirectBodyStateSW = Physics2DDirectBodyStateSW Object
                                       deriving newtype AsVariant

instance HasBaseClass Physics2DDirectBodyStateSW where
        type BaseClass Physics2DDirectBodyStateSW =
             Physics2DDirectBodyState
        super = coerce

-- | Direct access object to a space in the [Physics2DServer].
--    It's used mainly to do queries against objects and areas residing in a given space.
newtype Physics2DDirectSpaceState = Physics2DDirectSpaceState Object
                                      deriving newtype AsVariant

instance HasBaseClass Physics2DDirectSpaceState where
        type BaseClass Physics2DDirectSpaceState = Object
        super = coerce

-- | Physics 2D Server.
--   Physics 2D Server is the server responsible for all 2D physics. It can create many kinds of physics objects, but does not insert them on the node tree.
newtype Physics2DServer = Physics2DServer Object
                            deriving newtype AsVariant

instance HasBaseClass Physics2DServer where
        type BaseClass Physics2DServer = Object
        super = coerce

-- | Software implementation of [Physics2DServer].
--   This class exposes no new methods or properties and should not be used, as [Physics2DServer] automatically selects the best implementation available.
newtype Physics2DServerSW = Physics2DServerSW Object
                              deriving newtype AsVariant

instance HasBaseClass Physics2DServerSW where
        type BaseClass Physics2DServerSW = Physics2DServer
        super = coerce

-- | Parameters to be sent to a 2D shape physics query.
--   This class contains the shape and other parameters for intersection/collision queries.
newtype Physics2DShapeQueryParameters = Physics2DShapeQueryParameters Object
                                          deriving newtype AsVariant

instance HasBaseClass Physics2DShapeQueryParameters where
        type BaseClass Physics2DShapeQueryParameters = Reference
        super = coerce

newtype Physics2DShapeQueryResult = Physics2DShapeQueryResult Object
                                      deriving newtype AsVariant

instance HasBaseClass Physics2DShapeQueryResult where
        type BaseClass Physics2DShapeQueryResult = Reference
        super = coerce

newtype Physics2DTestMotionResult = Physics2DTestMotionResult Object
                                      deriving newtype AsVariant

instance HasBaseClass Physics2DTestMotionResult where
        type BaseClass Physics2DTestMotionResult = Reference
        super = coerce

-- | Base class for all objects affected by physics in 3D space.
--   PhysicsBody is an abstract base class for implementing a physics body. All *Body types inherit from it.
newtype PhysicsBody = PhysicsBody Object
                        deriving newtype AsVariant

instance HasBaseClass PhysicsBody where
        type BaseClass PhysicsBody = CollisionObject
        super = coerce

-- | Base class for all objects affected by physics in 2D space.
--   PhysicsBody2D is an abstract base class for implementing a physics body. All *Body2D types inherit from it.
newtype PhysicsBody2D = PhysicsBody2D Object
                          deriving newtype AsVariant

instance HasBaseClass PhysicsBody2D where
        type BaseClass PhysicsBody2D = CollisionObject2D
        super = coerce

-- | Direct access object to a physics body in the [PhysicsServer].
--   Provides direct access to a physics body in the [PhysicsServer], allowing safe changes to physics properties. This object is passed via the direct state callback of rigid/character bodies, and is intended for changing the direct state of that body. See [method RigidBody._integrate_forces].
newtype PhysicsDirectBodyState = PhysicsDirectBodyState Object
                                   deriving newtype AsVariant

instance HasBaseClass PhysicsDirectBodyState where
        type BaseClass PhysicsDirectBodyState = Object
        super = coerce

-- | Direct access object to a space in the [PhysicsServer].
--    It's used mainly to do queries against objects and areas residing in a given space.
newtype PhysicsDirectSpaceState = PhysicsDirectSpaceState Object
                                    deriving newtype AsVariant

instance HasBaseClass PhysicsDirectSpaceState where
        type BaseClass PhysicsDirectSpaceState = Object
        super = coerce

-- | A material for physics properties.
--   Provides a means of modifying the collision properties of a [PhysicsBody].
newtype PhysicsMaterial = PhysicsMaterial Object
                            deriving newtype AsVariant

instance HasBaseClass PhysicsMaterial where
        type BaseClass PhysicsMaterial = Resource
        super = coerce

-- | Server interface for low level physics access.
--   Everything related to physics in 3D.
newtype PhysicsServer = PhysicsServer Object
                          deriving newtype AsVariant

instance HasBaseClass PhysicsServer where
        type BaseClass PhysicsServer = Object
        super = coerce

newtype PhysicsShapeQueryParameters = PhysicsShapeQueryParameters Object
                                        deriving newtype AsVariant

instance HasBaseClass PhysicsShapeQueryParameters where
        type BaseClass PhysicsShapeQueryParameters = Reference
        super = coerce

-- | Result of a shape query in Physics2DServer.
newtype PhysicsShapeQueryResult = PhysicsShapeQueryResult Object
                                    deriving newtype AsVariant

instance HasBaseClass PhysicsShapeQueryResult where
        type BaseClass PhysicsShapeQueryResult = Reference
        super = coerce

-- | Pin Joint for 3D Shapes.
--   Pin Joint for 3D Rigid Bodies. It pins 2 bodies (rigid or static) together.
newtype PinJoint = PinJoint Object
                     deriving newtype AsVariant

instance HasBaseClass PinJoint where
        type BaseClass PinJoint = Joint
        super = coerce

-- | Pin Joint for 2D Shapes.
--   Pin Joint for 2D Rigid Bodies. It pins two bodies (rigid or static) together.
newtype PinJoint2D = PinJoint2D Object
                       deriving newtype AsVariant

instance HasBaseClass PinJoint2D where
        type BaseClass PinJoint2D = Joint2D
        super = coerce

-- | Class representing a planar [PrimitiveMesh].
--    This flat mesh does not have a thickness. By default, this mesh is aligned on the X and Z axes; this default rotation isn't suited for use with billboarded materials. For billboarded materials, use [QuadMesh] instead.
newtype PlaneMesh = PlaneMesh Object
                      deriving newtype AsVariant

instance HasBaseClass PlaneMesh where
        type BaseClass PlaneMesh = PrimitiveMesh
        super = coerce

newtype PlaneShape = PlaneShape Object
                       deriving newtype AsVariant

instance HasBaseClass PlaneShape where
        type BaseClass PlaneShape = Shape
        super = coerce

newtype PluginScript = PluginScript Object
                         deriving newtype AsVariant

instance HasBaseClass PluginScript where
        type BaseClass PluginScript = Script
        super = coerce

newtype PointMesh = PointMesh Object
                      deriving newtype AsVariant

instance HasBaseClass PointMesh where
        type BaseClass PointMesh = PrimitiveMesh
        super = coerce

-- | A 2D polygon.
--   A Polygon2D is defined by a set of points. Each point is connected to the next, with the final point being connected to the first, resulting in a closed polygon. Polygon2Ds can be filled with color (solid or gradient) or filled with a given texture.
newtype Polygon2D = Polygon2D Object
                      deriving newtype AsVariant

instance HasBaseClass Polygon2D where
        type BaseClass Polygon2D = Node2D
        super = coerce

newtype PolygonPathFinder = PolygonPathFinder Object
                              deriving newtype AsVariant

instance HasBaseClass PolygonPathFinder where
        type BaseClass PolygonPathFinder = Resource
        super = coerce

-- | Base container control for popups and dialogs.
--   Popup is a base [Control] used to show dialogs and popups. It's a subwindow and modal by default (see [Control]) and has helpers for custom popup behavior.
newtype Popup = Popup Object
                  deriving newtype AsVariant

instance HasBaseClass Popup where
        type BaseClass Popup = Control
        super = coerce

-- | Base class for Popup Dialogs.
--   PopupDialog is a base class for popup dialogs, along with [WindowDialog].
newtype PopupDialog = PopupDialog Object
                        deriving newtype AsVariant

instance HasBaseClass PopupDialog where
        type BaseClass PopupDialog = Popup
        super = coerce

-- | PopupMenu displays a list of options.
--   [PopupMenu] is a [Control] that displays a list of options. They are popular in toolbars or context menus.
newtype PopupMenu = PopupMenu Object
                      deriving newtype AsVariant

instance HasBaseClass PopupMenu where
        type BaseClass PopupMenu = Popup
        super = coerce

-- | Class for displaying popups with a panel background.
--    In some cases it might be simpler to use than [Popup], since it provides a configurable background. If you are making windows, better check [WindowDialog].
newtype PopupPanel = PopupPanel Object
                       deriving newtype AsVariant

instance HasBaseClass PopupPanel where
        type BaseClass PopupPanel = Popup
        super = coerce

-- | Generic 2D Position hint for editing.
--    It's just like a plain [Node2D] but displays as a cross in the 2D-Editor at all times.
newtype Position2D = Position2D Object
                       deriving newtype AsVariant

instance HasBaseClass Position2D where
        type BaseClass Position2D = Node2D
        super = coerce

-- | Generic 3D Position hint for editing.
--    It's just like a plain [Spatial] but displays as a cross in the 3D-Editor at all times.
newtype Position3D = Position3D Object
                       deriving newtype AsVariant

instance HasBaseClass Position3D where
        type BaseClass Position3D = Spatial
        super = coerce

-- | Base class for all primitive meshes. Handles applying a [Material] to a primitive mesh.
--    Examples include [CapsuleMesh], [CubeMesh], [CylinderMesh], [PlaneMesh], [PrismMesh], [QuadMesh], and [SphereMesh].
newtype PrimitiveMesh = PrimitiveMesh Object
                          deriving newtype AsVariant

instance HasBaseClass PrimitiveMesh where
        type BaseClass PrimitiveMesh = Mesh
        super = coerce

-- | Class representing a prism-shaped [PrimitiveMesh].
newtype PrismMesh = PrismMesh Object
                      deriving newtype AsVariant

instance HasBaseClass PrismMesh where
        type BaseClass PrismMesh = PrimitiveMesh
        super = coerce

-- | Type of [Sky] that is generated procedurally based on user input parameters.
--   ProceduralSky provides a way to create an effective background quickly by defining procedural parameters for the sun, the sky and the ground. The sky and ground are very similar, they are defined by a color at the horizon, another color, and finally an easing curve to interpolate between these two colors. Similarly the sun is described by a position in the sky, a color, and an easing curve. However, the sun also defines a minimum and maximum angle, these two values define at what distance the easing curve begins and ends from the sun, and thus end up defining the size of the sun in the sky.
--   		The ProceduralSky is updated on the CPU after the parameters change and stored in a texture and then displayed as a background in the scene. This makes it relatively unsuitable for realtime updates during gameplay. But with a small texture size it is still feasible to update relatively frequently because it is updated on a background thread when multi-threading is available.
newtype ProceduralSky = ProceduralSky Object
                          deriving newtype AsVariant

instance HasBaseClass ProceduralSky where
        type BaseClass ProceduralSky = Sky
        super = coerce

-- | General purpose progress bar.
--    Shows fill percentage from right to left.
newtype ProgressBar = ProgressBar Object
                        deriving newtype AsVariant

instance HasBaseClass ProgressBar where
        type BaseClass ProgressBar = Range
        super = coerce

-- | Contains global variables accessible from everywhere.
--    Use [method get_setting], [method set_setting] or [method has_setting] to access them. Variables stored in [code]project.godot[/code] are also loaded into ProjectSettings, making this object very useful for reading custom game configuration options.
newtype ProjectSettings = ProjectSettings Object
                            deriving newtype AsVariant

instance HasBaseClass ProjectSettings where
        type BaseClass ProjectSettings = Object
        super = coerce

-- | General purpose proximity-detection node.
newtype ProximityGroup = ProximityGroup Object
                           deriving newtype AsVariant

instance HasBaseClass ProximityGroup where
        type BaseClass ProximityGroup = Spatial
        super = coerce

newtype ProxyTexture = ProxyTexture Object
                         deriving newtype AsVariant

instance HasBaseClass ProxyTexture where
        type BaseClass ProxyTexture = Texture
        super = coerce

-- | Class representing a square mesh.
--   Class representing a square [PrimitiveMesh]. This flat mesh does not have a thickness. By default, this mesh is aligned on the X and Y axes; this default rotation is more suited for use with billboarded materials. Unlike [PlaneMesh], this mesh doesn't provide subdivision options.
newtype QuadMesh = QuadMesh Object
                     deriving newtype AsVariant

instance HasBaseClass QuadMesh where
        type BaseClass QuadMesh = PrimitiveMesh
        super = coerce

-- | A class for generating pseudo-random numbers.
--   RandomNumberGenerator is a class for generating pseudo-random numbers. It currently uses [url=http://www.pcg-random.org/]PCG32[/url].
--   		[b]Note:[/b] The underlying algorithm is an implementation detail. As a result, it should not be depended upon for reproducible random streams across Godot versions.
--   		To generate a random float number (within a given range) based on a time-dependant seed:
--   		[codeblock]
--   		var rng = RandomNumberGenerator.new()
--   		func _ready():
--   		    rng.randomize()
--   		    var my_random_number = rng.randf_range(-10.0, 10.0)
--   		[/codeblock]
newtype RandomNumberGenerator = RandomNumberGenerator Object
                                  deriving newtype AsVariant

instance HasBaseClass RandomNumberGenerator where
        type BaseClass RandomNumberGenerator = Reference
        super = coerce

-- | Abstract base class for range-based controls.
--   Range is a base class for [Control] nodes that change a floating point [i]value[/i] between a [i]minimum[/i] and a [i]maximum[/i], using [i]step[/i] and [i]page[/i], for example a [ScrollBar].
newtype Range = Range Object
                  deriving newtype AsVariant

instance HasBaseClass Range where
        type BaseClass Range = Control
        super = coerce

-- | Query the closest object intersecting a ray.
--   A RayCast represents a line from its origin to its destination position, [code]cast_to[/code]. It is used to query the 3D space in order to find the closest object along the path of the ray.
--   		RayCast can ignore some objects by adding them to the exception list via [code]add_exception[/code] or by setting proper filtering with collision layers and masks.
--   		RayCast can be configured to report collisions with [Area]s ([member collide_with_areas]) and/or [PhysicsBody]s ([member collide_with_bodies]).
--   		Only enabled raycasts will be able to query the space and report collisions.
--   		RayCast calculates intersection every physics frame (see [Node]), and the result is cached so it can be used later until the next frame. If multiple queries are required between physics frames (or during the same frame), use [method force_raycast_update] after adjusting the raycast.
newtype RayCast = RayCast Object
                    deriving newtype AsVariant

instance HasBaseClass RayCast where
        type BaseClass RayCast = Spatial
        super = coerce

-- | Query the closest object intersecting a ray.
--   A RayCast represents a line from its origin to its destination position, [code]cast_to[/code]. It is used to query the 2D space in order to find the closest object along the path of the ray.
--   		RayCast2D can ignore some objects by adding them to the exception list via [code]add_exception[/code], by setting proper filtering with collision layers, or by filtering object types with type masks.
--   		RayCast2D can be configured to report collisions with [Area2D]s ([member collide_with_areas]) and/or [PhysicsBody2D]s ([member collide_with_bodies]).
--   		Only enabled raycasts will be able to query the space and report collisions.
--   		RayCast2D calculates intersection every physics frame (see [Node]), and the result is cached so it can be used later until the next frame. If multiple queries are required between physics frames (or during the same frame) use [method force_raycast_update] after adjusting the raycast.
newtype RayCast2D = RayCast2D Object
                      deriving newtype AsVariant

instance HasBaseClass RayCast2D where
        type BaseClass RayCast2D = Node2D
        super = coerce

-- | Ray shape for 3D collisions.
--   Ray shape for 3D collisions, which can be set into a [PhysicsBody] or [Area]. A ray is not really a collision body, instead it tries to separate itself from whatever is touching its far endpoint. It's often useful for characters.
newtype RayShape = RayShape Object
                     deriving newtype AsVariant

instance HasBaseClass RayShape where
        type BaseClass RayShape = Shape
        super = coerce

-- | Ray shape for 2D collisions.
--    A ray is not really a collision body, instead it tries to separate itself from whatever is touching its far endpoint. It's often useful for characters.
newtype RayShape2D = RayShape2D Object
                       deriving newtype AsVariant

instance HasBaseClass RayShape2D where
        type BaseClass RayShape2D = Shape2D
        super = coerce

-- | Rectangle shape for 2D collisions.
--    This shape is useful for modeling box-like 2D objects.
newtype RectangleShape2D = RectangleShape2D Object
                             deriving newtype AsVariant

instance HasBaseClass RectangleShape2D where
        type BaseClass RectangleShape2D = Shape2D
        super = coerce

-- | Base class for reference-counted objects.
--   Base class for any object that keeps a reference count. [Resource] and many other helper objects inherit this class.
--   		References keep an internal reference counter so that they are automatically released when no longer in use, and only then. References therefore do not need to be freed manually with [method Object.free].
--   		In the vast majority of use cases, instantiating and using [Reference]-derived types is all you need to do. The methods provided in this class are only for advanced users, and can cause issues if misused.
newtype Reference = Reference Object
                      deriving newtype AsVariant

instance HasBaseClass Reference where
        type BaseClass Reference = Object
        super = coerce

-- | Reference frame for GUI.
--    It's just like an empty control, except an outline border [member border_color] is displayed while editing around its size at all times.
newtype ReferenceRect = ReferenceRect Object
                          deriving newtype AsVariant

instance HasBaseClass ReferenceRect where
        type BaseClass ReferenceRect = Control
        super = coerce

newtype ReflectionProbe = ReflectionProbe Object
                            deriving newtype AsVariant

instance HasBaseClass ReflectionProbe where
        type BaseClass ReflectionProbe = VisualInstance
        super = coerce

newtype RegEx = RegEx Object
                  deriving newtype AsVariant

instance HasBaseClass RegEx where
        type BaseClass RegEx = Reference
        super = coerce

newtype RegExMatch = RegExMatch Object
                       deriving newtype AsVariant

instance HasBaseClass RegExMatch where
        type BaseClass RegExMatch = Reference
        super = coerce

-- | RemoteTransform pushes its own [Transform] to another [Spatial] derived Node in the scene.
--   RemoteTransform pushes its own [Transform] to another [Spatial] derived Node (called the remote node) in the scene.
--   		It can be set to update another Node's position, rotation and/or scale. It can use either global or local coordinates.
newtype RemoteTransform = RemoteTransform Object
                            deriving newtype AsVariant

instance HasBaseClass RemoteTransform where
        type BaseClass RemoteTransform = Spatial
        super = coerce

-- | RemoteTransform2D pushes its own [Transform2D] to another [CanvasItem] derived Node in the scene.
--   RemoteTransform2D pushes its own [Transform2D] to another [CanvasItem] derived Node (called the remote node) in the scene.
--   		It can be set to update another Node's position, rotation and/or scale. It can use either global or local coordinates.
newtype RemoteTransform2D = RemoteTransform2D Object
                              deriving newtype AsVariant

instance HasBaseClass RemoteTransform2D where
        type BaseClass RemoteTransform2D = Node2D
        super = coerce

-- | Base class for all resources.
--   Resource is the base class for all Godot-specific resource types, serving primarily as data containers. They are reference counted and freed when no longer in use. They are also cached once loaded from disk, so that any further attempts to load a resource from a given path will return the same reference (all this in contrast to a [Node], which is not reference counted and can be instanced from disk as many times as desired). Resources can be saved externally on disk or bundled into another object, such as a [Node] or another resource.
newtype Resource = Resource Object
                     deriving newtype AsVariant

instance HasBaseClass Resource where
        type BaseClass Resource = Reference
        super = coerce

-- | Loads a specific resource type from a file.
--   Godot loads resources in the editor or in exported games using ResourceFormatLoaders. They are queried automatically via the [ResourceLoader] singleton, or when a resource with internal dependencies is loaded. Each file type may load as a different resource type, so multiple ResourceFormatLoaders are registered in the engine.
--   		Extending this class allows you to define your own loader. Be sure to respect the documented return types and values. You should give it a global class name with [code]class_name[/code] for it to be registered. Like built-in ResourceFormatLoaders, it will be called automatically when loading resources of its handled type(s). You may also implement a [ResourceFormatSaver].
--   		Note: You can also extend [EditorImportPlugin] if the resource type you need exists but Godot is unable to load its format. Choosing one way over another depends if the format is suitable or not for the final exported game. For example, it's better to import [code].png[/code] textures as [code].stex[/code] ([StreamTexture]) first, so they can be loaded with better efficiency on the graphics card.
newtype ResourceFormatLoader = ResourceFormatLoader Object
                                 deriving newtype AsVariant

instance HasBaseClass ResourceFormatLoader where
        type BaseClass ResourceFormatLoader = Reference
        super = coerce

newtype ResourceFormatLoaderCrypto = ResourceFormatLoaderCrypto Object
                                       deriving newtype AsVariant

instance HasBaseClass ResourceFormatLoaderCrypto where
        type BaseClass ResourceFormatLoaderCrypto = ResourceFormatLoader
        super = coerce

-- | Saves a specific resource type to a file.
--   The engine can save resources when you do it from the editor, or when you use the [ResourceSaver] singleton. This is accomplished thanks to multiple [ResourceFormatSaver]s, each handling its own format and called automatically by the engine.
--   		By default, Godot saves resources as [code].tres[/code] (text-based), [code].res[/code] (binary) or another built-in format, but you can choose to create your own format by extending this class. Be sure to respect the documented return types and values. You should give it a global class name with [code]class_name[/code] for it to be registered. Like built-in ResourceFormatSavers, it will be called automatically when saving resources of its recognized type(s). You may also implement a [ResourceFormatLoader].
newtype ResourceFormatSaver = ResourceFormatSaver Object
                                deriving newtype AsVariant

instance HasBaseClass ResourceFormatSaver where
        type BaseClass ResourceFormatSaver = Reference
        super = coerce

newtype ResourceFormatSaverCrypto = ResourceFormatSaverCrypto Object
                                      deriving newtype AsVariant

instance HasBaseClass ResourceFormatSaverCrypto where
        type BaseClass ResourceFormatSaverCrypto = ResourceFormatSaver
        super = coerce

newtype ResourceImporter = ResourceImporter Object
                             deriving newtype AsVariant

instance HasBaseClass ResourceImporter where
        type BaseClass ResourceImporter = Reference
        super = coerce

-- | Interactive [Resource] loader.
--    This object is returned by [ResourceLoader] when performing an interactive load. It allows to load with high granularity, so this is mainly useful for displaying loading bars/percentages.
newtype ResourceInteractiveLoader = ResourceInteractiveLoader Object
                                      deriving newtype AsVariant

instance HasBaseClass ResourceInteractiveLoader where
        type BaseClass ResourceInteractiveLoader = Reference
        super = coerce

-- | Resource Preloader Node.
--   This node is used to preload sub-resources inside a scene, so when the scene is loaded, all the resources are ready to use and can be retrieved from the preloader.
--   		GDScript has a simplified [method @GDScript.preload] built-in method which can be used in most situations, leaving the use of [ResourcePreloader] for more advanced scenarios.
newtype ResourcePreloader = ResourcePreloader Object
                              deriving newtype AsVariant

instance HasBaseClass ResourcePreloader where
        type BaseClass ResourcePreloader = Node
        super = coerce

newtype RichTextEffect = RichTextEffect Object
                           deriving newtype AsVariant

instance HasBaseClass RichTextEffect where
        type BaseClass RichTextEffect = Resource
        super = coerce

-- | Label that displays rich text.
--   Rich text can contain custom text, fonts, images and some basic formatting. The label manages these as an internal tag stack. It also adapts itself to given width/heights.
--   		Note that assignments to [member bbcode_text] clear the tag stack and reconstruct it from the property's contents. Any edits made to [member bbcode_text] will erase previous edits made from other manual sources such as [method append_bbcode] and the [code]push_*[/code] / [method pop] methods.
newtype RichTextLabel = RichTextLabel Object
                          deriving newtype AsVariant

instance HasBaseClass RichTextLabel where
        type BaseClass RichTextLabel = Control
        super = coerce

-- | Physics Body whose position is determined through physics simulation in 3D space.
--   This is the node that implements full 3D physics. This means that you do not control a RigidBody directly. Instead you can apply forces to it (gravity, impulses, etc.), and the physics simulation will calculate the resulting movement, collision, bouncing, rotating, etc.
--   		A RigidBody has 4 behavior [member mode]s: Rigid, Static, Character, and Kinematic.
--   		[b]Note:[/b] Don't change a RigidBody's position every frame or very often. Sporadic changes work fine, but physics runs at a different granularity (fixed hz) than usual rendering (process callback) and maybe even in a separate thread, so changing this from a process loop will yield strange behavior. If you need to directly affect the body's state, use [method _integrate_forces], which allows you to directly access the physics state.
--   		If you need to override the default physics behavior, you can write a custom force integration. See [member custom_integrator].
newtype RigidBody = RigidBody Object
                      deriving newtype AsVariant

instance HasBaseClass RigidBody where
        type BaseClass RigidBody = PhysicsBody
        super = coerce

-- | A body that is controlled by the 2D physics engine.
--   This node implements simulated 2D physics. You do not control a RigidBody2D directly. Instead you apply forces to it (gravity, impulses, etc.) and the physics simulation calculates the resulting movement based on its mass, friction, and other physical properties.
--   		A RigidBody2D has 4 behavior [member mode]s: Rigid, Static, Character, and Kinematic.
--   		[b]Note:[/b] You should not change a RigidBody2D's [code]position[/code] or [code]linear_velocity[/code] every frame or even very often. If you need to directly affect the body's state, use [method _integrate_forces], which allows you to directly access the physics state.
--   		Please also keep in mind that physics bodies manage their own transform which overwrites the ones you set. So any direct or indirect transformation (including scaling of the node or its parent) will be visible in the editor only, and immediately reset at runtime.
--   		If you need to override the default physics behavior or add a transformation at runtime, you can write a custom force integration. See [member custom_integrator].
newtype RigidBody2D = RigidBody2D Object
                        deriving newtype AsVariant

instance HasBaseClass RigidBody2D where
        type BaseClass RigidBody2D = PhysicsBody2D
        super = coerce

newtype RootMotionView = RootMotionView Object
                           deriving newtype AsVariant

instance HasBaseClass RootMotionView where
        type BaseClass RootMotionView = VisualInstance
        super = coerce

-- | A script interface to a scene file's data.
--   Maintains a list of resources, nodes, exported, and overridden properties, and built-in scripts associated with a scene.
--   		This class cannot be instantiated directly, it is retrieved for a given scene as the result of [method PackedScene.get_state].
newtype SceneState = SceneState Object
                       deriving newtype AsVariant

instance HasBaseClass SceneState where
        type BaseClass SceneState = Reference
        super = coerce

-- | Manages the game loop via a hierarchy of nodes.
--   As one of the most important classes, the [code]SceneTree[/code] manages the hierarchy of nodes in a scene as well as scenes themselves. Nodes can be added, retrieved and removed. The whole scene tree (and thus the current scene) can be paused. Scenes can be loaded, switched and reloaded.
--   		You can also use the [code]SceneTree[/code] to organize your nodes into groups: every node can be assigned as many groups as you want to create, e.g. a "enemy" group. You can then iterate these groups or even call methods and set properties on all the group's members at once.
--   		[code]SceneTree[/code] is the default [MainLoop] implementation used by scenes, and is thus in charge of the game loop.
newtype SceneTree = SceneTree Object
                      deriving newtype AsVariant

instance HasBaseClass SceneTree where
        type BaseClass SceneTree = MainLoop
        super = coerce

-- | One-shot timer.
--   A one-shot timer managed by the scene tree, which emits [signal timeout] on completion. See also [method SceneTree.create_timer].
--   		As opposed to [Timer], it does not require the instantiation of a node. Commonly used to create a one-shot delay timer as in the following example:
--   		[codeblock]
--   		func some_function():
--   			print("start")
--   			yield(get_tree().create_timer(1.0), "timeout")
--   			print("end")
--   		[/codeblock]
newtype SceneTreeTimer = SceneTreeTimer Object
                           deriving newtype AsVariant

instance HasBaseClass SceneTreeTimer where
        type BaseClass SceneTreeTimer = Reference
        super = coerce

-- | A class stored as a resource.
--    A script exends the functionality of all objects that instance it.
--   		The [code]new[/code] method of a script subclass creates a new instance. [method Object.set_script] extends an existing object, if that object's class matches one of the script's base classes.
newtype Script = Script Object
                   deriving newtype AsVariant

instance HasBaseClass Script where
        type BaseClass Script = Resource
        super = coerce

-- | The Editor's popup dialog for creating new [Script] files.
--   The [code]ScriptCreateDialog[/code] creates script files according to a given template for a given scripting language. The standard use is to configure its fields prior to calling one of the [method Popup.popup] methods.
--   		[codeblock]
--   		func _ready():
--   		    dialog.config("Node", "res://new_node.gd") # for in-engine types
--   		    dialog.config("\"res://base_node.gd\"", "res://derived_node.gd") # for script types
--   		    dialog.popup_centered()
--   		[/codeblock]
newtype ScriptCreateDialog = ScriptCreateDialog Object
                               deriving newtype AsVariant

instance HasBaseClass ScriptCreateDialog where
        type BaseClass ScriptCreateDialog = ConfirmationDialog
        super = coerce

newtype ScriptEditor = ScriptEditor Object
                         deriving newtype AsVariant

instance HasBaseClass ScriptEditor where
        type BaseClass ScriptEditor = PanelContainer
        super = coerce

-- | Base class for scroll bars.
--   Scrollbars are a [Range] based [Control], that display a draggable area (the size of the page). Horizontal ([HScrollBar]) and Vertical ([VScrollBar]) versions are available.
newtype ScrollBar = ScrollBar Object
                      deriving newtype AsVariant

instance HasBaseClass ScrollBar where
        type BaseClass ScrollBar = Range
        super = coerce

-- | A helper node for displaying scrollable elements (e.g. lists).
--   A ScrollContainer node meant to contain a [Control] child. ScrollContainers will automatically create a scrollbar child ([HScrollBar], [VScrollBar], or both) when needed and will only draw the Control within the ScrollContainer area. Scrollbars will automatically be drawn at the right (for vertical) or bottom (for horizontal) and will enable dragging to move the viewable Control (and its children) within the ScrollContainer. Scrollbars will also automatically resize the grabber based on the minimum_size of the Control relative to the ScrollContainer. Works great with a [Panel] control. You can set EXPAND on children size flags, so they will upscale to ScrollContainer size if ScrollContainer size is bigger (scroll is invisible for chosen dimension).
newtype ScrollContainer = ScrollContainer Object
                            deriving newtype AsVariant

instance HasBaseClass ScrollContainer where
        type BaseClass ScrollContainer = Container
        super = coerce

-- | Segment shape for 2D collisions.
--    Consists of two points, [code]a[/code] and [code]b[/code].
newtype SegmentShape2D = SegmentShape2D Object
                           deriving newtype AsVariant

instance HasBaseClass SegmentShape2D where
        type BaseClass SegmentShape2D = Shape2D
        super = coerce

-- | Base class for separators.
--   Separator is a [Control] used for separating other controls. It's purely a visual decoration. Horizontal ([HSeparator]) and Vertical ([VSeparator]) versions are available.
newtype Separator = Separator Object
                      deriving newtype AsVariant

instance HasBaseClass Separator where
        type BaseClass Separator = Control
        super = coerce

-- | A custom shader program.
--   This class allows you to define a custom shader program that can be used for various materials to render objects.
newtype Shader = Shader Object
                   deriving newtype AsVariant

instance HasBaseClass Shader where
        type BaseClass Shader = Resource
        super = coerce

-- | A material that uses a custom [Shader] program.
--   A material that uses a custom [Shader] program to render either items to screen or process particles. You can create multiple materials for the same shader but configure different values for the uniforms defined in the shader.
newtype ShaderMaterial = ShaderMaterial Object
                           deriving newtype AsVariant

instance HasBaseClass ShaderMaterial where
        type BaseClass ShaderMaterial = Material
        super = coerce

-- | Base class for all 3D shape resources.
--    Nodes that inherit from this can be used as shapes for a [PhysicsBody] or [Area] objects.
newtype Shape = Shape Object
                  deriving newtype AsVariant

instance HasBaseClass Shape where
        type BaseClass Shape = Resource
        super = coerce

-- | Base class for all 2D Shapes.
--    All 2D shape types inherit from this.
newtype Shape2D = Shape2D Object
                    deriving newtype AsVariant

instance HasBaseClass Shape2D where
        type BaseClass Shape2D = Resource
        super = coerce

-- | A shortcut for binding input.
--   
--   		Shortcuts are commonly used for interacting with a [Control] element from a [InputEvent].
newtype ShortCut = ShortCut Object
                     deriving newtype AsVariant

instance HasBaseClass ShortCut where
        type BaseClass ShortCut = Resource
        super = coerce

-- | Skeleton for characters and animated objects.
--   Skeleton provides a hierarchical interface for managing bones, including pose, rest and animation (see [Animation]). Skeleton will support rag doll dynamics in the future.
--   		The overall transform of a bone with respect to the skeleton is determined by the following hierarchical order: rest pose, custom pose and pose.
--   		Note that "global pose" below refers to the overall transform of the bone with respect to skeleton, so it not the actual global/world transform of the bone.
newtype Skeleton = Skeleton Object
                     deriving newtype AsVariant

instance HasBaseClass Skeleton where
        type BaseClass Skeleton = Spatial
        super = coerce

newtype Skeleton2D = Skeleton2D Object
                       deriving newtype AsVariant

instance HasBaseClass Skeleton2D where
        type BaseClass Skeleton2D = Node2D
        super = coerce

newtype SkeletonIK = SkeletonIK Object
                       deriving newtype AsVariant

instance HasBaseClass SkeletonIK where
        type BaseClass SkeletonIK = Node
        super = coerce

newtype Skin = Skin Object
                 deriving newtype AsVariant

instance HasBaseClass Skin where
        type BaseClass Skin = Resource
        super = coerce

newtype SkinReference = SkinReference Object
                          deriving newtype AsVariant

instance HasBaseClass SkinReference where
        type BaseClass SkinReference = Reference
        super = coerce

-- | The base class for [PanoramaSky] and [ProceduralSky].
newtype Sky = Sky Object
                deriving newtype AsVariant

instance HasBaseClass Sky where
        type BaseClass Sky = Resource
        super = coerce

-- | Base class for GUI Sliders.
newtype Slider = Slider Object
                   deriving newtype AsVariant

instance HasBaseClass Slider where
        type BaseClass Slider = Range
        super = coerce

-- | Piston kind of slider between two bodies in 3D.
--   Slides across the x-axis of the pivot object.
newtype SliderJoint = SliderJoint Object
                        deriving newtype AsVariant

instance HasBaseClass SliderJoint where
        type BaseClass SliderJoint = Joint
        super = coerce

-- | A soft mesh physics body.
--   A deformable physics body. Used to create elastic or deformable objects such as cloth, rubber, or other flexible materials.
newtype SoftBody = SoftBody Object
                     deriving newtype AsVariant

instance HasBaseClass SoftBody where
        type BaseClass SoftBody = MeshInstance
        super = coerce

-- | Most basic 3D game object, parent of all 3D related nodes.
--   Most basic 3D game object, with a 3D [Transform] and visibility settings. All other 3D game objects inherit from Spatial. Use [code]Spatial[/code] as a parent node to move, scale, rotate and show/hide children in a 3D project.
--   		Affine operations (rotate, scale, translate) happen in parent's local coordinate system, unless the [code]Spatial[/code] object is set as top level. Affine operations in this coordinate system correspond to direct affine operations on the [code]Spatial[/code]'s transform. The word local below refers to this coordinate system. The coordinate system that is attached to the [code]Spatial[/code] object itself is referred to as object-local coordinate system.
newtype Spatial = Spatial Object
                    deriving newtype AsVariant

instance HasBaseClass Spatial where
        type BaseClass Spatial = Node
        super = coerce

newtype SpatialGizmo = SpatialGizmo Object
                         deriving newtype AsVariant

instance HasBaseClass SpatialGizmo where
        type BaseClass SpatialGizmo = Reference
        super = coerce

-- | Default 3D rendering material.
--   This provides a default material with a wide variety of rendering features and properties without the need to write shader code. See the tutorial below for details.
newtype SpatialMaterial = SpatialMaterial Object
                            deriving newtype AsVariant

instance HasBaseClass SpatialMaterial where
        type BaseClass SpatialMaterial = Material
        super = coerce

newtype SpatialVelocityTracker = SpatialVelocityTracker Object
                                   deriving newtype AsVariant

instance HasBaseClass SpatialVelocityTracker where
        type BaseClass SpatialVelocityTracker = Reference
        super = coerce

-- | Class representing a spherical [PrimitiveMesh].
newtype SphereMesh = SphereMesh Object
                       deriving newtype AsVariant

instance HasBaseClass SphereMesh where
        type BaseClass SphereMesh = PrimitiveMesh
        super = coerce

-- | Sphere shape for 3D collisions.
--   Sphere shape for 3D collisions, which can be set into a [PhysicsBody] or [Area]. This shape is useful for modeling sphere-like 3D objects.
newtype SphereShape = SphereShape Object
                        deriving newtype AsVariant

instance HasBaseClass SphereShape where
        type BaseClass SphereShape = Shape
        super = coerce

-- | Numerical input text field.
--   SpinBox is a numerical input text field. It allows entering integers and floats.
--   		[b]Example:[/b]
--   		[codeblock]
--   		var spin_box = SpinBox.new()
--   		add_child(spin_box)
--   		var line_edit = spin_box.get_line_edit()
--   		line_edit.context_menu_enabled = false
--   		spin_box.align = LineEdit.ALIGN_RIGHT
--   		[/codeblock]
--   		The above code will create a [SpinBox], disable context menu on it and set the text alignment to right.
--   		See [Range] class for more options over the [SpinBox].
newtype SpinBox = SpinBox Object
                    deriving newtype AsVariant

instance HasBaseClass SpinBox where
        type BaseClass SpinBox = Range
        super = coerce

-- | Container for splitting and adjusting.
--   Container for splitting two controls vertically or horizontally, with a grabber that allows adjusting the split offset or ratio.
newtype SplitContainer = SplitContainer Object
                           deriving newtype AsVariant

instance HasBaseClass SplitContainer where
        type BaseClass SplitContainer = Container
        super = coerce

-- | Spotlight [Light], such as a reflector spotlight or a lantern.
--   A SpotLight light is a type of [Light] node that emits lights in a specific direction, in the shape of a cone. The light is attenuated through the distance and this attenuation can be configured by changing the energy, radius and attenuation parameters of [Light].
newtype SpotLight = SpotLight Object
                      deriving newtype AsVariant

instance HasBaseClass SpotLight where
        type BaseClass SpotLight = Light
        super = coerce

newtype SpringArm = SpringArm Object
                      deriving newtype AsVariant

instance HasBaseClass SpringArm where
        type BaseClass SpringArm = Spatial
        super = coerce

-- | General purpose Sprite node.
--   A node that displays a 2D texture. The texture displayed can be a region from a larger atlas texture, or a frame from a sprite sheet animation.
newtype Sprite = Sprite Object
                   deriving newtype AsVariant

instance HasBaseClass Sprite where
        type BaseClass Sprite = Node2D
        super = coerce

-- | 2D Sprite node in 3D world.
--   A node that displays a 2D texture in a 3D environment. The texture displayed can be a region from a larger atlas texture, or a frame from a sprite sheet animation.
newtype Sprite3D = Sprite3D Object
                     deriving newtype AsVariant

instance HasBaseClass Sprite3D where
        type BaseClass Sprite3D = SpriteBase3D
        super = coerce

-- | 2D Sprite node in 3D environment.
--   A node that displays 2D texture information in a 3D environment.
newtype SpriteBase3D = SpriteBase3D Object
                         deriving newtype AsVariant

instance HasBaseClass SpriteBase3D where
        type BaseClass SpriteBase3D = GeometryInstance
        super = coerce

-- | Sprite frame library for AnimatedSprite.
--   Sprite frame library for [AnimatedSprite]. Contains frames and animation data for playback.
newtype SpriteFrames = SpriteFrames Object
                         deriving newtype AsVariant

instance HasBaseClass SpriteFrames where
        type BaseClass SpriteFrames = Resource
        super = coerce

-- | Static body for 3D physics.
--    A static body is a simple body that is not intended to move. They don't consume any CPU resources in contrast to a [RigidBody] so they are great for scenario collision.
--   		A static body can also be animated by using simulated motion mode. This is useful for implementing functionalities such as moving platforms. When this mode is active the body can be animated and automatically computes linear and angular velocity to apply in that frame and to influence other bodies.
--   		Alternatively, a constant linear or angular velocity can be set for the static body, so even if it doesn't move, it affects other bodies as if it was moving (this is useful for simulating conveyor belts or conveyor wheels).
newtype StaticBody = StaticBody Object
                       deriving newtype AsVariant

instance HasBaseClass StaticBody where
        type BaseClass StaticBody = PhysicsBody
        super = coerce

-- | Static body for 2D Physics.
--    A StaticBody2D is a body that is not intended to move. It is ideal for implementing objects in the environment, such as walls or platforms.
--   		Additionally, a constant linear or angular velocity can be set for the static body, which will affect colliding bodies as if it were moving (for example, a conveyor belt).
newtype StaticBody2D = StaticBody2D Object
                         deriving newtype AsVariant

instance HasBaseClass StaticBody2D where
        type BaseClass StaticBody2D = PhysicsBody2D
        super = coerce

-- | Abstraction and base class for stream-based protocols.
--   StreamPeer is an abstraction and base class for stream-based protocols (such as TCP or Unix Sockets). It provides an API for sending and receiving data through streams as raw data or strings.
newtype StreamPeer = StreamPeer Object
                       deriving newtype AsVariant

instance HasBaseClass StreamPeer where
        type BaseClass StreamPeer = Reference
        super = coerce

newtype StreamPeerBuffer = StreamPeerBuffer Object
                             deriving newtype AsVariant

instance HasBaseClass StreamPeerBuffer where
        type BaseClass StreamPeerBuffer = StreamPeer
        super = coerce

newtype StreamPeerGDNative = StreamPeerGDNative Object
                               deriving newtype AsVariant

instance HasBaseClass StreamPeerGDNative where
        type BaseClass StreamPeerGDNative = StreamPeer
        super = coerce

-- | SSL Stream peer.
--    This object can be used to connect to SSL servers.
newtype StreamPeerSSL = StreamPeerSSL Object
                          deriving newtype AsVariant

instance HasBaseClass StreamPeerSSL where
        type BaseClass StreamPeerSSL = StreamPeer
        super = coerce

-- | TCP Stream peer.
--    This object can be used to connect to TCP servers, or also is returned by a TCP server.
newtype StreamPeerTCP = StreamPeerTCP Object
                          deriving newtype AsVariant

instance HasBaseClass StreamPeerTCP where
        type BaseClass StreamPeerTCP = StreamPeer
        super = coerce

-- | A .stex texture.
--   A texture that is loaded from a .stex file.
newtype StreamTexture = StreamTexture Object
                          deriving newtype AsVariant

instance HasBaseClass StreamTexture where
        type BaseClass StreamTexture = Texture
        super = coerce

-- | Base class for drawing stylized boxes for the UI.
--   StyleBox is [Resource] that provides an abstract base class for drawing stylized boxes for the UI. StyleBoxes are used for drawing the styles of buttons, line edit backgrounds, tree backgrounds, etc. and also for testing a transparency mask for pointer signals. If mask test fails on a StyleBox assigned as mask to a control, clicks and motion signals will go through it to the one below.
newtype StyleBox = StyleBox Object
                     deriving newtype AsVariant

instance HasBaseClass StyleBox where
        type BaseClass StyleBox = Resource
        super = coerce

-- | Empty stylebox (does not display anything).
--   Empty stylebox (really does not display anything).
newtype StyleBoxEmpty = StyleBoxEmpty Object
                          deriving newtype AsVariant

instance HasBaseClass StyleBoxEmpty where
        type BaseClass StyleBoxEmpty = StyleBox
        super = coerce

-- | Customizable Stylebox with a given set of parameters. (no texture required)
--   This stylebox can be used to achieve all kinds of looks without the need of a texture. Those properties are customizable:
--   		- Color
--   		- Border width (individual width for each border)
--   		- Rounded corners (individual radius for each corner)
--   		- Shadow
--   		Setting corner radius to high values is allowed. As soon as corners would overlap the stylebox will switch to a relative system. Example:
--   		[codeblock]
--   		height = 30
--   		corner_radius_top_left = 50
--   		corner_radius_bottom_left = 100
--   		[/codeblock]
--   		The relative system now would take the 1:2 ratio of the two left corners to calculate the actual corner width. Both corners added will [b]never[/b] be more than the height. Result:
--   		[codeblock]
--   		corner_radius_top_left: 10
--   		corner_radius_bottom_left: 20
--   		[/codeblock]
newtype StyleBoxFlat = StyleBoxFlat Object
                         deriving newtype AsVariant

instance HasBaseClass StyleBoxFlat where
        type BaseClass StyleBoxFlat = StyleBox
        super = coerce

newtype StyleBoxLine = StyleBoxLine Object
                         deriving newtype AsVariant

instance HasBaseClass StyleBoxLine where
        type BaseClass StyleBoxLine = StyleBox
        super = coerce

-- | Texture Based 3x3 scale style.
--    This stylebox performs a 3x3 scaling of a texture, where only the center cell is fully stretched. This allows for the easy creation of bordered styles.
newtype StyleBoxTexture = StyleBoxTexture Object
                            deriving newtype AsVariant

instance HasBaseClass StyleBoxTexture where
        type BaseClass StyleBoxTexture = StyleBox
        super = coerce

-- | Helper tool to create geometry.
--   The [code]SurfaceTool[/code] is used to construct a [Mesh] by specifying vertex attributes individually. It can be used to construct a [Mesh] from script. All properties except index need to be added before a call to [method add_vertex]. For example adding vertex colors and UVs looks like
--   		[codeblock]
--   		var st = SurfaceTool.new()
--   		st.begin(Mesh.PRIMITIVE_TRIANGLES)
--   		st.add_color(Color(1, 0, 0))
--   		st.add_uv(Vector2(0, 0))
--   		st.add_vertex(Vector3(0, 0, 0))
--   		[/codeblock]
--   		The [code]SurfaceTool[/code] now contains one vertex of a triangle which has a UV coordinate and a specified [Color]. If another vertex were added without calls to [method add_uv] or [method add_color] then the last values would be used.
--   		It is very important that vertex attributes are passed [b]before[/b] the call to [method add_vertex], failure to do this will result in an error when committing the vertex information to a mesh.
--   		Additionally, the attributes used before the first vertex is added determine the format of the mesh. For example if you only add UVs to the first vertex, you cannot add color to any of the subsequent vertices.
newtype SurfaceTool = SurfaceTool Object
                        deriving newtype AsVariant

instance HasBaseClass SurfaceTool where
        type BaseClass SurfaceTool = Reference
        super = coerce

-- | TCP Server.
--   TCP Server class. Listens to connections on a port and returns a [StreamPeerTCP] when got a connection.
newtype TCP_Server = TCP_Server Object
                       deriving newtype AsVariant

instance HasBaseClass TCP_Server where
        type BaseClass TCP_Server = Reference
        super = coerce

-- | Tabbed Container.
--   Sets the active tab's [code]visible[/code] property to the value [code]true[/code]. Sets all other children's to [code]false[/code].
--   		Ignores non-[Control] children.
--   		Individual tabs are always visible unless you use [method set_tab_disabled] and [method set_tab_title] to hide it.
--   		To hide only a tab's content, nest the content inside a child [Control], so it receives the [code]TabContainer[/code]'s visibility setting instead.
newtype TabContainer = TabContainer Object
                         deriving newtype AsVariant

instance HasBaseClass TabContainer where
        type BaseClass TabContainer = Container
        super = coerce

-- | Tabs Control.
--   Simple tabs control, similar to [TabContainer] but is only in charge of drawing tabs, not interact with children.
newtype Tabs = Tabs Object
                 deriving newtype AsVariant

instance HasBaseClass Tabs where
        type BaseClass Tabs = Control
        super = coerce

-- | Multiline text editing control.
--   TextEdit is meant for editing large, multiline text. It also has facilities for editing code, such as syntax highlighting support and multiple levels of undo/redo.
newtype TextEdit = TextEdit Object
                     deriving newtype AsVariant

instance HasBaseClass TextEdit where
        type BaseClass TextEdit = Control
        super = coerce

newtype TextFile = TextFile Object
                     deriving newtype AsVariant

instance HasBaseClass TextFile where
        type BaseClass TextFile = Resource
        super = coerce

-- | Texture for 2D and 3D.
--   A texture works by registering an image in the video hardware, which then can be used in 3D models or 2D [Sprite] or GUI [Control].
--   		Textures are often created by loading them from a file. See [method @GDScript.load].
newtype Texture = Texture Object
                    deriving newtype AsVariant

instance HasBaseClass Texture where
        type BaseClass Texture = Resource
        super = coerce

newtype Texture3D = Texture3D Object
                      deriving newtype AsVariant

instance HasBaseClass Texture3D where
        type BaseClass Texture3D = TextureLayered
        super = coerce

newtype TextureArray = TextureArray Object
                         deriving newtype AsVariant

instance HasBaseClass TextureArray where
        type BaseClass TextureArray = TextureLayered
        super = coerce

-- | Texture-based button. Supports Pressed, Hover, Disabled and Focused states.
--   [code]TextureButton[/code] has the same functionality as [Button], except it uses sprites instead of Godot's [Theme] resource. It is faster to create, but it doesn't support localization like more complex Controls.
--   		The Normal state's texture is required. Others are optional.
newtype TextureButton = TextureButton Object
                          deriving newtype AsVariant

instance HasBaseClass TextureButton where
        type BaseClass TextureButton = BaseButton
        super = coerce

newtype TextureLayered = TextureLayered Object
                           deriving newtype AsVariant

instance HasBaseClass TextureLayered where
        type BaseClass TextureLayered = Resource
        super = coerce

-- | Texture-based progress bar. Useful for loading screens and life or stamina bars.
--   TextureProgress works like [ProgressBar] but it uses up to 3 textures instead of Godot's [Theme] resource. Works horizontally, vertically, and radially.
newtype TextureProgress = TextureProgress Object
                            deriving newtype AsVariant

instance HasBaseClass TextureProgress where
        type BaseClass TextureProgress = Range
        super = coerce

-- | Control for drawing textures.
--   Used to draw icons and sprites in a user interface. The texture's placement can be controlled with the [member stretch_mode] property. It can scale, tile, or stay centered inside its bounding rectangle.
newtype TextureRect = TextureRect Object
                        deriving newtype AsVariant

instance HasBaseClass TextureRect where
        type BaseClass TextureRect = Control
        super = coerce

-- | Theme for controls.
--   Theme for skinning controls. Controls can be skinned individually, but for complex applications it's more efficient to just create a global theme that defines everything. This theme can be applied to any [Control], and it and its children will automatically use it.
--   		Theme resources can be alternatively loaded by writing them in a .theme file, see docs for more info.
newtype Theme = Theme Object
                  deriving newtype AsVariant

instance HasBaseClass Theme where
        type BaseClass Theme = Resource
        super = coerce

-- | Node for 2D tile-based maps.
--    Tilemaps use a [TileSet] which contain a list of tiles (textures plus optional collision, navigation, and/or occluder shapes) which are used to create grid-based maps.
newtype TileMap = TileMap Object
                    deriving newtype AsVariant

instance HasBaseClass TileMap where
        type BaseClass TileMap = Node2D
        super = coerce

-- | Tile library for tilemaps.
--   A TileSet is a library of tiles for a [TileMap]. It contains a list of tiles, each consisting of a sprite and optional collision shapes.
--   		Tiles are referenced by a unique integer ID.
newtype TileSet = TileSet Object
                    deriving newtype AsVariant

instance HasBaseClass TileSet where
        type BaseClass TileSet = Resource
        super = coerce

-- | A countdown timer.
--   Counts down a specified interval and emits a signal on reaching 0. Can be set to repeat or "one shot" mode.
newtype Timer = Timer Object
                  deriving newtype AsVariant

instance HasBaseClass Timer where
        type BaseClass Timer = Node
        super = coerce

-- | Flat button helper class.
--   This is a helper class to generate a flat [Button] (see [member Button.flat]), creating a [code]ToolButton[/code] is equivalent to:
--   		[codeblock]
--   		var btn = Button.new()
--   		btn.flat = true
--   		[/codeblock]
newtype ToolButton = ToolButton Object
                       deriving newtype AsVariant

instance HasBaseClass ToolButton where
        type BaseClass ToolButton = Button
        super = coerce

-- | Button for touch screen devices.
--    You can set it to be visible on all screens, or only on touch devices.
newtype TouchScreenButton = TouchScreenButton Object
                              deriving newtype AsVariant

instance HasBaseClass TouchScreenButton where
        type BaseClass TouchScreenButton = Node2D
        super = coerce

-- | Language Translation.
--   Translations are resources that can be loaded/unloaded on demand. They map a string to another string.
newtype Translation = Translation Object
                        deriving newtype AsVariant

instance HasBaseClass Translation where
        type BaseClass Translation = Resource
        super = coerce

-- | Server that manages all translations.
--    Translations can be set to it and removed from it.
newtype TranslationServer = TranslationServer Object
                              deriving newtype AsVariant

instance HasBaseClass TranslationServer where
        type BaseClass TranslationServer = Object
        super = coerce

-- | Control to show a tree of items.
--   This shows a tree of items that can be selected, expanded and collapsed. The tree can have multiple columns with custom controls like text editing, buttons and popups. It can be useful for structured displays and interactions.
--   		Trees are built via code, using [TreeItem] objects to create the structure. They have a single root but multiple roots can be simulated if a dummy hidden root is added.
--   		[codeblock]
--   		func _ready():
--   		    var tree = Tree.new()
--   		    var root = tree.create_item()
--   		    tree.set_hide_root(true)
--   		    var child1 = tree.create_item(root)
--   		    var child2 = tree.create_item(root)
--   		    var subchild1 = tree.create_item(child1)
--   		    subchild1.set_text(0, "Subchild1")
--   		[/codeblock]
newtype Tree = Tree Object
                 deriving newtype AsVariant

instance HasBaseClass Tree where
        type BaseClass Tree = Control
        super = coerce

-- | Control for a single item inside a [Tree].
--    May have child [code]TreeItem[/code]s and be styled as well as contain buttons.
newtype TreeItem = TreeItem Object
                     deriving newtype AsVariant

instance HasBaseClass TreeItem where
        type BaseClass TreeItem = Object
        super = coerce

-- | Internal mesh type.
--   Mesh type used internally for collision calculations.
newtype TriangleMesh = TriangleMesh Object
                         deriving newtype AsVariant

instance HasBaseClass TriangleMesh where
        type BaseClass TriangleMesh = Reference
        super = coerce

-- | Smoothly animates a node's properties over time.
--   Tweens are useful for animations requiring a numerical property to be interpolated over a range of values. The name *tween* comes from *in-betweening*, an animation technique where you specify *keyframes* and the computer interpolates the frames that appear between them.
--   		Here is a brief usage example that causes a 2D node to move smoothly between two positions:
--   		[codeblock]
--   		var tween = get_node("Tween")
--   		tween.interpolate_property($Node2D, "position",
--   		        Vector2(0, 0), Vector2(100, 100), 1,
--   		        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
--   		tween.start()
--   		[/codeblock]
--   		Many methods require a property name, such as "position" above. You can find the correct property name by hovering over the property in the Inspector. You can also provide the components of a property directly by using "property:component" (eg. [code]position:x[/code]), where it would only apply to that particular component.
--   		Many of the methods accept [code]trans_type[/code] and [code]ease_type[/code]. The first accepts an [enum TransitionType] constant, and refers to the way the timing of the animation is handled (see [code]http://easings.net/[/code] for some examples). The second accepts an [enum EaseType] constant, and controls the where [code]trans_type[/code] is applied to the interpolation (in the beginning, the end, or both). If you don't know which transition and easing to pick, you can try different [enum TransitionType] constants with [constant EASE_IN_OUT], and use the one that looks best.
newtype Tween = Tween Object
                  deriving newtype AsVariant

instance HasBaseClass Tween where
        type BaseClass Tween = Node
        super = coerce

newtype UPNP = UPNP Object
                 deriving newtype AsVariant

instance HasBaseClass UPNP where
        type BaseClass UPNP = Reference
        super = coerce

newtype UPNPDevice = UPNPDevice Object
                       deriving newtype AsVariant

instance HasBaseClass UPNPDevice where
        type BaseClass UPNPDevice = Reference
        super = coerce

-- | Helper to manage undo/redo operations in the editor or custom tools.
--    It works by registering methods and property changes inside 'actions'.
--   		Common behavior is to create an action, then add do/undo calls to functions or property changes, then committing the action.
--   		Here's an example on how to add an action to the Godot editor's own [UndoRedo], from a plugin:
--   		[codeblock]
--   		var undo_redo = get_undo_redo() # Method of EditorPlugin.
--   
--   		func do_something():
--   		    pass # Put your code here.
--   
--   		func undo_something():
--   		    pass # Put here the code that reverts what's done by "do_something()".
--   
--   		func _on_MyButton_pressed():
--   		    var node = get_node("MyNode2D")
--   		    undo_redo.create_action("Move the node")
--   		    undo_redo.add_do_method(self, "do_something")
--   		    undo_redo.add_undo_method(self, "undo_something")
--   		    undo_redo.add_do_property(node, "position", Vector2(100,100))
--   		    undo_redo.add_undo_property(node, "position", node.position)
--   		    undo_redo.commit_action()
--   		[/codeblock]
--   		[method create_action], [method add_do_method], [method add_undo_method], [method add_do_property], [method add_undo_property], and [method commit_action] should be called one after the other, like in the example. Not doing so could lead to crashes.
--   		If you don't need to register a method you can leave [method add_do_method] and [method add_undo_method] out, and so it goes for properties. You can register more than one method/property.
newtype UndoRedo = UndoRedo Object
                     deriving newtype AsVariant

instance HasBaseClass UndoRedo where
        type BaseClass UndoRedo = Object
        super = coerce

-- | Vertical box container.
--    See [BoxContainer].
newtype VBoxContainer = VBoxContainer Object
                          deriving newtype AsVariant

instance HasBaseClass VBoxContainer where
        type BaseClass VBoxContainer = BoxContainer
        super = coerce

-- | Vertical version of [ScrollBar], which goes from left (min) to right (max).
newtype VScrollBar = VScrollBar Object
                       deriving newtype AsVariant

instance HasBaseClass VScrollBar where
        type BaseClass VScrollBar = ScrollBar
        super = coerce

-- | Vertical version of [Separator].
--    It is used to separate objects horizontally, though (but it looks vertical!).
newtype VSeparator = VSeparator Object
                       deriving newtype AsVariant

instance HasBaseClass VSeparator where
        type BaseClass VSeparator = Separator
        super = coerce

-- | Vertical slider.
--    See [Slider]. This one goes from bottom (min) to top (max).
newtype VSlider = VSlider Object
                    deriving newtype AsVariant

instance HasBaseClass VSlider where
        type BaseClass VSlider = Slider
        super = coerce

-- | Vertical split container.
--    See [SplitContainer]. This goes from top to bottom.
newtype VSplitContainer = VSplitContainer Object
                            deriving newtype AsVariant

instance HasBaseClass VSplitContainer where
        type BaseClass VSplitContainer = SplitContainer
        super = coerce

-- | Physics body that simulates the behavior of a car.
--   This nodes implements all the physics logic needed to simulate a car. It is based on the raycast vehicle system commonly found in physics engines. You will need to add a [CollisionShape] for the main body of your vehicle and add [VehicleWheel] nodes for the wheels. You should also add a [MeshInstance] to this node for the 3D model of your car but this model should not include meshes for the wheels. You should control the vehicle by using the [member brake], [member engine_force], and [member steering] properties and not change the position or orientation of this node directly.
--   		Note that the origin point of your VehicleBody will determine the center of gravity of your vehicle so it is better to keep this low and move the [CollisionShape] and [MeshInstance] upwards.
newtype VehicleBody = VehicleBody Object
                        deriving newtype AsVariant

instance HasBaseClass VehicleBody where
        type BaseClass VehicleBody = RigidBody
        super = coerce

-- | Physics object that simulates the behavior of a wheel.
--   This node needs to be used as a child node of [VehicleBody] and simulates the behavior of one of its wheels. This node also acts as a collider to detect if the wheel is touching a surface.
newtype VehicleWheel = VehicleWheel Object
                         deriving newtype AsVariant

instance HasBaseClass VehicleWheel where
        type BaseClass VehicleWheel = Spatial
        super = coerce

-- | Control for playing video streams.
--   Control node for playing video streams. Supported formats are WebM and OGV Theora.
newtype VideoPlayer = VideoPlayer Object
                        deriving newtype AsVariant

instance HasBaseClass VideoPlayer where
        type BaseClass VideoPlayer = Control
        super = coerce

-- | Base resource for video streams.
newtype VideoStream = VideoStream Object
                        deriving newtype AsVariant

instance HasBaseClass VideoStream where
        type BaseClass VideoStream = Resource
        super = coerce

newtype VideoStreamGDNative = VideoStreamGDNative Object
                                deriving newtype AsVariant

instance HasBaseClass VideoStreamGDNative where
        type BaseClass VideoStreamGDNative = VideoStream
        super = coerce

newtype VideoStreamTheora = VideoStreamTheora Object
                              deriving newtype AsVariant

instance HasBaseClass VideoStreamTheora where
        type BaseClass VideoStreamTheora = VideoStream
        super = coerce

newtype VideoStreamWebm = VideoStreamWebm Object
                            deriving newtype AsVariant

instance HasBaseClass VideoStreamWebm where
        type BaseClass VideoStreamWebm = VideoStream
        super = coerce

-- | Creates a sub-view into the screen.
--   A Viewport creates a different view into the screen, or a sub-view inside another viewport. Children 2D Nodes will display on it, and children Camera 3D nodes will render on it too.
--   		Optionally, a viewport can have its own 2D or 3D world, so they don't share what they draw with other viewports.
--   		If a viewport is a child of a [ViewportContainer], it will automatically take up its size, otherwise it must be set manually.
--   		Viewports can also choose to be audio listeners, so they generate positional audio depending on a 2D or 3D camera child of it.
--   		Also, viewports can be assigned to different screens in case the devices have multiple screens.
--   		Finally, viewports can also behave as render targets, in which case they will not be visible unless the associated texture is used to draw.
newtype Viewport = Viewport Object
                     deriving newtype AsVariant

instance HasBaseClass Viewport where
        type BaseClass Viewport = Node
        super = coerce

-- | Control for holding [Viewport]s.
--   A [Container] node that holds a [Viewport], automatically setting its size.
newtype ViewportContainer = ViewportContainer Object
                              deriving newtype AsVariant

instance HasBaseClass ViewportContainer where
        type BaseClass ViewportContainer = Container
        super = coerce

-- | Texture which displays the content of a [Viewport].
--   Displays the content of a [Viewport] node as a dynamic [Texture]. This can be used to mix controls, 2D, and 3D elements in the same scene.
--   		To create a ViewportTexture in code, use the [method Viewport.get_texture] method on the target viewport.
newtype ViewportTexture = ViewportTexture Object
                            deriving newtype AsVariant

instance HasBaseClass ViewportTexture where
        type BaseClass ViewportTexture = Texture
        super = coerce

-- | Enable certain nodes only when visible.
--   The VisibilityEnabler will disable [RigidBody] and [AnimationPlayer] nodes when they are not visible. It will only affect other nodes within the same scene as the VisibilityEnabler itself.
newtype VisibilityEnabler = VisibilityEnabler Object
                              deriving newtype AsVariant

instance HasBaseClass VisibilityEnabler where
        type BaseClass VisibilityEnabler = VisibilityNotifier
        super = coerce

-- | Enable certain nodes only when visible.
--   The VisibilityEnabler2D will disable [RigidBody2D], [AnimationPlayer], and other nodes when they are not visible. It will only affect other nodes within the same scene as the VisibilityEnabler2D itself.
newtype VisibilityEnabler2D = VisibilityEnabler2D Object
                                deriving newtype AsVariant

instance HasBaseClass VisibilityEnabler2D where
        type BaseClass VisibilityEnabler2D = VisibilityNotifier2D
        super = coerce

-- | Detects when the node is visible on screen.
--   The VisibilityNotifier detects when it is visible on the screen. It also notifies when its bounding rectangle enters or exits the screen or a [Camera]'s view.
newtype VisibilityNotifier = VisibilityNotifier Object
                               deriving newtype AsVariant

instance HasBaseClass VisibilityNotifier where
        type BaseClass VisibilityNotifier = Spatial
        super = coerce

-- | Detects when the node is visible on screen.
--   The VisibilityNotifier2D detects when it is visible on the screen. It also notifies when its bounding rectangle enters or exits the screen or a viewport.
newtype VisibilityNotifier2D = VisibilityNotifier2D Object
                                 deriving newtype AsVariant

instance HasBaseClass VisibilityNotifier2D where
        type BaseClass VisibilityNotifier2D = Node2D
        super = coerce

newtype VisualInstance = VisualInstance Object
                           deriving newtype AsVariant

instance HasBaseClass VisualInstance where
        type BaseClass VisualInstance = Spatial
        super = coerce

newtype VisualScript = VisualScript Object
                         deriving newtype AsVariant

instance HasBaseClass VisualScript where
        type BaseClass VisualScript = Script
        super = coerce

newtype VisualScriptBasicTypeConstant = VisualScriptBasicTypeConstant Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualScriptBasicTypeConstant where
        type BaseClass VisualScriptBasicTypeConstant = VisualScriptNode
        super = coerce

newtype VisualScriptBuiltinFunc = VisualScriptBuiltinFunc Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualScriptBuiltinFunc where
        type BaseClass VisualScriptBuiltinFunc = VisualScriptNode
        super = coerce

newtype VisualScriptClassConstant = VisualScriptClassConstant Object
                                      deriving newtype AsVariant

instance HasBaseClass VisualScriptClassConstant where
        type BaseClass VisualScriptClassConstant = VisualScriptNode
        super = coerce

newtype VisualScriptComment = VisualScriptComment Object
                                deriving newtype AsVariant

instance HasBaseClass VisualScriptComment where
        type BaseClass VisualScriptComment = VisualScriptNode
        super = coerce

newtype VisualScriptComposeArray = VisualScriptComposeArray Object
                                     deriving newtype AsVariant

instance HasBaseClass VisualScriptComposeArray where
        type BaseClass VisualScriptComposeArray = VisualScriptLists
        super = coerce

newtype VisualScriptCondition = VisualScriptCondition Object
                                  deriving newtype AsVariant

instance HasBaseClass VisualScriptCondition where
        type BaseClass VisualScriptCondition = VisualScriptNode
        super = coerce

newtype VisualScriptConstant = VisualScriptConstant Object
                                 deriving newtype AsVariant

instance HasBaseClass VisualScriptConstant where
        type BaseClass VisualScriptConstant = VisualScriptNode
        super = coerce

newtype VisualScriptConstructor = VisualScriptConstructor Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualScriptConstructor where
        type BaseClass VisualScriptConstructor = VisualScriptNode
        super = coerce

newtype VisualScriptCustomNode = VisualScriptCustomNode Object
                                   deriving newtype AsVariant

instance HasBaseClass VisualScriptCustomNode where
        type BaseClass VisualScriptCustomNode = VisualScriptNode
        super = coerce

newtype VisualScriptDeconstruct = VisualScriptDeconstruct Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualScriptDeconstruct where
        type BaseClass VisualScriptDeconstruct = VisualScriptNode
        super = coerce

newtype VisualScriptEmitSignal = VisualScriptEmitSignal Object
                                   deriving newtype AsVariant

instance HasBaseClass VisualScriptEmitSignal where
        type BaseClass VisualScriptEmitSignal = VisualScriptNode
        super = coerce

newtype VisualScriptEngineSingleton = VisualScriptEngineSingleton Object
                                        deriving newtype AsVariant

instance HasBaseClass VisualScriptEngineSingleton where
        type BaseClass VisualScriptEngineSingleton = VisualScriptNode
        super = coerce

newtype VisualScriptExpression = VisualScriptExpression Object
                                   deriving newtype AsVariant

instance HasBaseClass VisualScriptExpression where
        type BaseClass VisualScriptExpression = VisualScriptNode
        super = coerce

newtype VisualScriptFunction = VisualScriptFunction Object
                                 deriving newtype AsVariant

instance HasBaseClass VisualScriptFunction where
        type BaseClass VisualScriptFunction = VisualScriptNode
        super = coerce

newtype VisualScriptFunctionCall = VisualScriptFunctionCall Object
                                     deriving newtype AsVariant

instance HasBaseClass VisualScriptFunctionCall where
        type BaseClass VisualScriptFunctionCall = VisualScriptNode
        super = coerce

newtype VisualScriptFunctionState = VisualScriptFunctionState Object
                                      deriving newtype AsVariant

instance HasBaseClass VisualScriptFunctionState where
        type BaseClass VisualScriptFunctionState = Reference
        super = coerce

newtype VisualScriptGlobalConstant = VisualScriptGlobalConstant Object
                                       deriving newtype AsVariant

instance HasBaseClass VisualScriptGlobalConstant where
        type BaseClass VisualScriptGlobalConstant = VisualScriptNode
        super = coerce

newtype VisualScriptIndexGet = VisualScriptIndexGet Object
                                 deriving newtype AsVariant

instance HasBaseClass VisualScriptIndexGet where
        type BaseClass VisualScriptIndexGet = VisualScriptNode
        super = coerce

newtype VisualScriptIndexSet = VisualScriptIndexSet Object
                                 deriving newtype AsVariant

instance HasBaseClass VisualScriptIndexSet where
        type BaseClass VisualScriptIndexSet = VisualScriptNode
        super = coerce

newtype VisualScriptInputAction = VisualScriptInputAction Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualScriptInputAction where
        type BaseClass VisualScriptInputAction = VisualScriptNode
        super = coerce

newtype VisualScriptIterator = VisualScriptIterator Object
                                 deriving newtype AsVariant

instance HasBaseClass VisualScriptIterator where
        type BaseClass VisualScriptIterator = VisualScriptNode
        super = coerce

newtype VisualScriptLists = VisualScriptLists Object
                              deriving newtype AsVariant

instance HasBaseClass VisualScriptLists where
        type BaseClass VisualScriptLists = VisualScriptNode
        super = coerce

newtype VisualScriptLocalVar = VisualScriptLocalVar Object
                                 deriving newtype AsVariant

instance HasBaseClass VisualScriptLocalVar where
        type BaseClass VisualScriptLocalVar = VisualScriptNode
        super = coerce

newtype VisualScriptLocalVarSet = VisualScriptLocalVarSet Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualScriptLocalVarSet where
        type BaseClass VisualScriptLocalVarSet = VisualScriptNode
        super = coerce

newtype VisualScriptMathConstant = VisualScriptMathConstant Object
                                     deriving newtype AsVariant

instance HasBaseClass VisualScriptMathConstant where
        type BaseClass VisualScriptMathConstant = VisualScriptNode
        super = coerce

newtype VisualScriptNode = VisualScriptNode Object
                             deriving newtype AsVariant

instance HasBaseClass VisualScriptNode where
        type BaseClass VisualScriptNode = Resource
        super = coerce

newtype VisualScriptOperator = VisualScriptOperator Object
                                 deriving newtype AsVariant

instance HasBaseClass VisualScriptOperator where
        type BaseClass VisualScriptOperator = VisualScriptNode
        super = coerce

newtype VisualScriptPreload = VisualScriptPreload Object
                                deriving newtype AsVariant

instance HasBaseClass VisualScriptPreload where
        type BaseClass VisualScriptPreload = VisualScriptNode
        super = coerce

newtype VisualScriptPropertyGet = VisualScriptPropertyGet Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualScriptPropertyGet where
        type BaseClass VisualScriptPropertyGet = VisualScriptNode
        super = coerce

newtype VisualScriptPropertySet = VisualScriptPropertySet Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualScriptPropertySet where
        type BaseClass VisualScriptPropertySet = VisualScriptNode
        super = coerce

newtype VisualScriptResourcePath = VisualScriptResourcePath Object
                                     deriving newtype AsVariant

instance HasBaseClass VisualScriptResourcePath where
        type BaseClass VisualScriptResourcePath = VisualScriptNode
        super = coerce

newtype VisualScriptReturn = VisualScriptReturn Object
                               deriving newtype AsVariant

instance HasBaseClass VisualScriptReturn where
        type BaseClass VisualScriptReturn = VisualScriptNode
        super = coerce

newtype VisualScriptSceneNode = VisualScriptSceneNode Object
                                  deriving newtype AsVariant

instance HasBaseClass VisualScriptSceneNode where
        type BaseClass VisualScriptSceneNode = VisualScriptNode
        super = coerce

newtype VisualScriptSceneTree = VisualScriptSceneTree Object
                                  deriving newtype AsVariant

instance HasBaseClass VisualScriptSceneTree where
        type BaseClass VisualScriptSceneTree = VisualScriptNode
        super = coerce

newtype VisualScriptSelect = VisualScriptSelect Object
                               deriving newtype AsVariant

instance HasBaseClass VisualScriptSelect where
        type BaseClass VisualScriptSelect = VisualScriptNode
        super = coerce

newtype VisualScriptSelf = VisualScriptSelf Object
                             deriving newtype AsVariant

instance HasBaseClass VisualScriptSelf where
        type BaseClass VisualScriptSelf = VisualScriptNode
        super = coerce

newtype VisualScriptSequence = VisualScriptSequence Object
                                 deriving newtype AsVariant

instance HasBaseClass VisualScriptSequence where
        type BaseClass VisualScriptSequence = VisualScriptNode
        super = coerce

newtype VisualScriptSubCall = VisualScriptSubCall Object
                                deriving newtype AsVariant

instance HasBaseClass VisualScriptSubCall where
        type BaseClass VisualScriptSubCall = VisualScriptNode
        super = coerce

newtype VisualScriptSwitch = VisualScriptSwitch Object
                               deriving newtype AsVariant

instance HasBaseClass VisualScriptSwitch where
        type BaseClass VisualScriptSwitch = VisualScriptNode
        super = coerce

newtype VisualScriptTypeCast = VisualScriptTypeCast Object
                                 deriving newtype AsVariant

instance HasBaseClass VisualScriptTypeCast where
        type BaseClass VisualScriptTypeCast = VisualScriptNode
        super = coerce

newtype VisualScriptVariableGet = VisualScriptVariableGet Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualScriptVariableGet where
        type BaseClass VisualScriptVariableGet = VisualScriptNode
        super = coerce

newtype VisualScriptVariableSet = VisualScriptVariableSet Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualScriptVariableSet where
        type BaseClass VisualScriptVariableSet = VisualScriptNode
        super = coerce

newtype VisualScriptWhile = VisualScriptWhile Object
                              deriving newtype AsVariant

instance HasBaseClass VisualScriptWhile where
        type BaseClass VisualScriptWhile = VisualScriptNode
        super = coerce

newtype VisualScriptYield = VisualScriptYield Object
                              deriving newtype AsVariant

instance HasBaseClass VisualScriptYield where
        type BaseClass VisualScriptYield = VisualScriptNode
        super = coerce

newtype VisualScriptYieldSignal = VisualScriptYieldSignal Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualScriptYieldSignal where
        type BaseClass VisualScriptYieldSignal = VisualScriptNode
        super = coerce

-- | Server for anything visible.
--    The visual server is the API backend for everything visible. The whole scene system mounts on it to display.
--   		The visual server is completely opaque, the internals are entirely implementation specific and cannot be accessed.
newtype VisualServer = VisualServer Object
                         deriving newtype AsVariant

instance HasBaseClass VisualServer where
        type BaseClass VisualServer = Object
        super = coerce

newtype VisualShader = VisualShader Object
                         deriving newtype AsVariant

instance HasBaseClass VisualShader where
        type BaseClass VisualShader = Shader
        super = coerce

newtype VisualShaderNode = VisualShaderNode Object
                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNode where
        type BaseClass VisualShaderNode = Resource
        super = coerce

newtype VisualShaderNodeBooleanConstant = VisualShaderNodeBooleanConstant Object
                                            deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeBooleanConstant where
        type BaseClass VisualShaderNodeBooleanConstant = VisualShaderNode
        super = coerce

newtype VisualShaderNodeBooleanUniform = VisualShaderNodeBooleanUniform Object
                                           deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeBooleanUniform where
        type BaseClass VisualShaderNodeBooleanUniform =
             VisualShaderNodeUniform
        super = coerce

newtype VisualShaderNodeColorConstant = VisualShaderNodeColorConstant Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeColorConstant where
        type BaseClass VisualShaderNodeColorConstant = VisualShaderNode
        super = coerce

newtype VisualShaderNodeColorFunc = VisualShaderNodeColorFunc Object
                                      deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeColorFunc where
        type BaseClass VisualShaderNodeColorFunc = VisualShaderNode
        super = coerce

newtype VisualShaderNodeColorOp = VisualShaderNodeColorOp Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeColorOp where
        type BaseClass VisualShaderNodeColorOp = VisualShaderNode
        super = coerce

newtype VisualShaderNodeColorUniform = VisualShaderNodeColorUniform Object
                                         deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeColorUniform where
        type BaseClass VisualShaderNodeColorUniform =
             VisualShaderNodeUniform
        super = coerce

newtype VisualShaderNodeCompare = VisualShaderNodeCompare Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeCompare where
        type BaseClass VisualShaderNodeCompare = VisualShaderNode
        super = coerce

newtype VisualShaderNodeCubeMap = VisualShaderNodeCubeMap Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeCubeMap where
        type BaseClass VisualShaderNodeCubeMap = VisualShaderNode
        super = coerce

newtype VisualShaderNodeCubeMapUniform = VisualShaderNodeCubeMapUniform Object
                                           deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeCubeMapUniform where
        type BaseClass VisualShaderNodeCubeMapUniform =
             VisualShaderNodeTextureUniform
        super = coerce

newtype VisualShaderNodeCustom = VisualShaderNodeCustom Object
                                   deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeCustom where
        type BaseClass VisualShaderNodeCustom = VisualShaderNode
        super = coerce

newtype VisualShaderNodeDeterminant = VisualShaderNodeDeterminant Object
                                        deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeDeterminant where
        type BaseClass VisualShaderNodeDeterminant = VisualShaderNode
        super = coerce

newtype VisualShaderNodeDotProduct = VisualShaderNodeDotProduct Object
                                       deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeDotProduct where
        type BaseClass VisualShaderNodeDotProduct = VisualShaderNode
        super = coerce

newtype VisualShaderNodeExpression = VisualShaderNodeExpression Object
                                       deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeExpression where
        type BaseClass VisualShaderNodeExpression =
             VisualShaderNodeGroupBase
        super = coerce

newtype VisualShaderNodeFaceForward = VisualShaderNodeFaceForward Object
                                        deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeFaceForward where
        type BaseClass VisualShaderNodeFaceForward = VisualShaderNode
        super = coerce

newtype VisualShaderNodeFresnel = VisualShaderNodeFresnel Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeFresnel where
        type BaseClass VisualShaderNodeFresnel = VisualShaderNode
        super = coerce

newtype VisualShaderNodeGlobalExpression = VisualShaderNodeGlobalExpression Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeGlobalExpression where
        type BaseClass VisualShaderNodeGlobalExpression =
             VisualShaderNodeExpression
        super = coerce

newtype VisualShaderNodeGroupBase = VisualShaderNodeGroupBase Object
                                      deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeGroupBase where
        type BaseClass VisualShaderNodeGroupBase = VisualShaderNode
        super = coerce

newtype VisualShaderNodeIf = VisualShaderNodeIf Object
                               deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeIf where
        type BaseClass VisualShaderNodeIf = VisualShaderNode
        super = coerce

newtype VisualShaderNodeInput = VisualShaderNodeInput Object
                                  deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeInput where
        type BaseClass VisualShaderNodeInput = VisualShaderNode
        super = coerce

newtype VisualShaderNodeIs = VisualShaderNodeIs Object
                               deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeIs where
        type BaseClass VisualShaderNodeIs = VisualShaderNode
        super = coerce

newtype VisualShaderNodeOuterProduct = VisualShaderNodeOuterProduct Object
                                         deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeOuterProduct where
        type BaseClass VisualShaderNodeOuterProduct = VisualShaderNode
        super = coerce

newtype VisualShaderNodeOutput = VisualShaderNodeOutput Object
                                   deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeOutput where
        type BaseClass VisualShaderNodeOutput = VisualShaderNode
        super = coerce

newtype VisualShaderNodeScalarClamp = VisualShaderNodeScalarClamp Object
                                        deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeScalarClamp where
        type BaseClass VisualShaderNodeScalarClamp = VisualShaderNode
        super = coerce

newtype VisualShaderNodeScalarConstant = VisualShaderNodeScalarConstant Object
                                           deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeScalarConstant where
        type BaseClass VisualShaderNodeScalarConstant = VisualShaderNode
        super = coerce

newtype VisualShaderNodeScalarDerivativeFunc = VisualShaderNodeScalarDerivativeFunc Object
                                                 deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeScalarDerivativeFunc where
        type BaseClass VisualShaderNodeScalarDerivativeFunc =
             VisualShaderNode
        super = coerce

newtype VisualShaderNodeScalarFunc = VisualShaderNodeScalarFunc Object
                                       deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeScalarFunc where
        type BaseClass VisualShaderNodeScalarFunc = VisualShaderNode
        super = coerce

newtype VisualShaderNodeScalarInterp = VisualShaderNodeScalarInterp Object
                                         deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeScalarInterp where
        type BaseClass VisualShaderNodeScalarInterp = VisualShaderNode
        super = coerce

newtype VisualShaderNodeScalarOp = VisualShaderNodeScalarOp Object
                                     deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeScalarOp where
        type BaseClass VisualShaderNodeScalarOp = VisualShaderNode
        super = coerce

newtype VisualShaderNodeScalarSmoothStep = VisualShaderNodeScalarSmoothStep Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeScalarSmoothStep where
        type BaseClass VisualShaderNodeScalarSmoothStep = VisualShaderNode
        super = coerce

newtype VisualShaderNodeScalarSwitch = VisualShaderNodeScalarSwitch Object
                                         deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeScalarSwitch where
        type BaseClass VisualShaderNodeScalarSwitch =
             VisualShaderNodeSwitch
        super = coerce

newtype VisualShaderNodeScalarUniform = VisualShaderNodeScalarUniform Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeScalarUniform where
        type BaseClass VisualShaderNodeScalarUniform =
             VisualShaderNodeUniform
        super = coerce

newtype VisualShaderNodeSwitch = VisualShaderNodeSwitch Object
                                   deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeSwitch where
        type BaseClass VisualShaderNodeSwitch = VisualShaderNode
        super = coerce

newtype VisualShaderNodeTexture = VisualShaderNodeTexture Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTexture where
        type BaseClass VisualShaderNodeTexture = VisualShaderNode
        super = coerce

newtype VisualShaderNodeTextureUniform = VisualShaderNodeTextureUniform Object
                                           deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTextureUniform where
        type BaseClass VisualShaderNodeTextureUniform =
             VisualShaderNodeUniform
        super = coerce

newtype VisualShaderNodeTextureUniformTriplanar = VisualShaderNodeTextureUniformTriplanar Object
                                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTextureUniformTriplanar where
        type BaseClass VisualShaderNodeTextureUniformTriplanar =
             VisualShaderNodeTextureUniform
        super = coerce

newtype VisualShaderNodeTransformCompose = VisualShaderNodeTransformCompose Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformCompose where
        type BaseClass VisualShaderNodeTransformCompose = VisualShaderNode
        super = coerce

newtype VisualShaderNodeTransformConstant = VisualShaderNodeTransformConstant Object
                                              deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformConstant where
        type BaseClass VisualShaderNodeTransformConstant = VisualShaderNode
        super = coerce

newtype VisualShaderNodeTransformDecompose = VisualShaderNodeTransformDecompose Object
                                               deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformDecompose where
        type BaseClass VisualShaderNodeTransformDecompose =
             VisualShaderNode
        super = coerce

newtype VisualShaderNodeTransformFunc = VisualShaderNodeTransformFunc Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformFunc where
        type BaseClass VisualShaderNodeTransformFunc = VisualShaderNode
        super = coerce

newtype VisualShaderNodeTransformMult = VisualShaderNodeTransformMult Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformMult where
        type BaseClass VisualShaderNodeTransformMult = VisualShaderNode
        super = coerce

newtype VisualShaderNodeTransformUniform = VisualShaderNodeTransformUniform Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformUniform where
        type BaseClass VisualShaderNodeTransformUniform =
             VisualShaderNodeUniform
        super = coerce

newtype VisualShaderNodeTransformVecMult = VisualShaderNodeTransformVecMult Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformVecMult where
        type BaseClass VisualShaderNodeTransformVecMult = VisualShaderNode
        super = coerce

newtype VisualShaderNodeUniform = VisualShaderNodeUniform Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeUniform where
        type BaseClass VisualShaderNodeUniform = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVec3Constant = VisualShaderNodeVec3Constant Object
                                         deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVec3Constant where
        type BaseClass VisualShaderNodeVec3Constant = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVec3Uniform = VisualShaderNodeVec3Uniform Object
                                        deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVec3Uniform where
        type BaseClass VisualShaderNodeVec3Uniform =
             VisualShaderNodeUniform
        super = coerce

newtype VisualShaderNodeVectorClamp = VisualShaderNodeVectorClamp Object
                                        deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorClamp where
        type BaseClass VisualShaderNodeVectorClamp = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorCompose = VisualShaderNodeVectorCompose Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorCompose where
        type BaseClass VisualShaderNodeVectorCompose = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorDecompose = VisualShaderNodeVectorDecompose Object
                                            deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorDecompose where
        type BaseClass VisualShaderNodeVectorDecompose = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorDerivativeFunc = VisualShaderNodeVectorDerivativeFunc Object
                                                 deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorDerivativeFunc where
        type BaseClass VisualShaderNodeVectorDerivativeFunc =
             VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorDistance = VisualShaderNodeVectorDistance Object
                                           deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorDistance where
        type BaseClass VisualShaderNodeVectorDistance = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorFunc = VisualShaderNodeVectorFunc Object
                                       deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorFunc where
        type BaseClass VisualShaderNodeVectorFunc = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorInterp = VisualShaderNodeVectorInterp Object
                                         deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorInterp where
        type BaseClass VisualShaderNodeVectorInterp = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorLen = VisualShaderNodeVectorLen Object
                                      deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorLen where
        type BaseClass VisualShaderNodeVectorLen = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorOp = VisualShaderNodeVectorOp Object
                                     deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorOp where
        type BaseClass VisualShaderNodeVectorOp = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorRefract = VisualShaderNodeVectorRefract Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorRefract where
        type BaseClass VisualShaderNodeVectorRefract = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorScalarMix = VisualShaderNodeVectorScalarMix Object
                                            deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorScalarMix where
        type BaseClass VisualShaderNodeVectorScalarMix = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorScalarSmoothStep = VisualShaderNodeVectorScalarSmoothStep Object
                                                   deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorScalarSmoothStep where
        type BaseClass VisualShaderNodeVectorScalarSmoothStep =
             VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorScalarStep = VisualShaderNodeVectorScalarStep Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorScalarStep where
        type BaseClass VisualShaderNodeVectorScalarStep = VisualShaderNode
        super = coerce

newtype VisualShaderNodeVectorSmoothStep = VisualShaderNodeVectorSmoothStep Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorSmoothStep where
        type BaseClass VisualShaderNodeVectorSmoothStep = VisualShaderNode
        super = coerce

-- | Holds an [Object], but does not contribute to the reference count if the object is a reference.
--   A weakref can hold a [Reference], without contributing to the reference counter. A weakref can be created from an [Object] using [method @GDScript.weakref]. If this object is not a reference, weakref still works, however, it does not have any effect on the object. Weakrefs are useful in cases where multiple classes have variables that refer to each other. Without weakrefs, using these classes could lead to memory leaks, since both references keep each other from being released. Making part of the variables a weakref can prevent this cyclic dependency, and allows the references to be released.
newtype WeakRef = WeakRef Object
                    deriving newtype AsVariant

instance HasBaseClass WeakRef where
        type BaseClass WeakRef = Reference
        super = coerce

newtype WebRTCDataChannel = WebRTCDataChannel Object
                              deriving newtype AsVariant

instance HasBaseClass WebRTCDataChannel where
        type BaseClass WebRTCDataChannel = PacketPeer
        super = coerce

newtype WebRTCDataChannelGDNative = WebRTCDataChannelGDNative Object
                                      deriving newtype AsVariant

instance HasBaseClass WebRTCDataChannelGDNative where
        type BaseClass WebRTCDataChannelGDNative = WebRTCDataChannel
        super = coerce

newtype WebRTCMultiplayer = WebRTCMultiplayer Object
                              deriving newtype AsVariant

instance HasBaseClass WebRTCMultiplayer where
        type BaseClass WebRTCMultiplayer = NetworkedMultiplayerPeer
        super = coerce

newtype WebRTCPeerConnection = WebRTCPeerConnection Object
                                 deriving newtype AsVariant

instance HasBaseClass WebRTCPeerConnection where
        type BaseClass WebRTCPeerConnection = Reference
        super = coerce

newtype WebRTCPeerConnectionGDNative = WebRTCPeerConnectionGDNative Object
                                         deriving newtype AsVariant

instance HasBaseClass WebRTCPeerConnectionGDNative where
        type BaseClass WebRTCPeerConnectionGDNative = WebRTCPeerConnection
        super = coerce

newtype WebSocketClient = WebSocketClient Object
                            deriving newtype AsVariant

instance HasBaseClass WebSocketClient where
        type BaseClass WebSocketClient = WebSocketMultiplayerPeer
        super = coerce

newtype WebSocketMultiplayerPeer = WebSocketMultiplayerPeer Object
                                     deriving newtype AsVariant

instance HasBaseClass WebSocketMultiplayerPeer where
        type BaseClass WebSocketMultiplayerPeer = NetworkedMultiplayerPeer
        super = coerce

newtype WebSocketPeer = WebSocketPeer Object
                          deriving newtype AsVariant

instance HasBaseClass WebSocketPeer where
        type BaseClass WebSocketPeer = PacketPeer
        super = coerce

newtype WebSocketServer = WebSocketServer Object
                            deriving newtype AsVariant

instance HasBaseClass WebSocketServer where
        type BaseClass WebSocketServer = WebSocketMultiplayerPeer
        super = coerce

-- | Base class for window dialogs.
--   Windowdialog is the base class for all window-based dialogs. It's a by-default toplevel [Control] that draws a window decoration and allows motion and resizing.
newtype WindowDialog = WindowDialog Object
                         deriving newtype AsVariant

instance HasBaseClass WindowDialog where
        type BaseClass WindowDialog = Popup
        super = coerce

-- | Class that has everything pertaining to a world.
--    A physics space, a visual scenario and a sound space. Spatial nodes register their resources into the current world.
newtype World = World Object
                  deriving newtype AsVariant

instance HasBaseClass World where
        type BaseClass World = Resource
        super = coerce

-- | Class that has everything pertaining to a 2D world.
--    A physics space, a visual scenario and a sound space. 2D nodes register their resources into the current 2D world.
newtype World2D = World2D Object
                    deriving newtype AsVariant

instance HasBaseClass World2D where
        type BaseClass World2D = Resource
        super = coerce

-- | Default environment properties for the entire scene (post-processing effects, lighting and background settings).
--   The [code]WorldEnvironment[/code] node is used to configure the default [Environment] for the scene.
--   		The parameters defined in the [code]WorldEnvironment[/code] can be overridden by an [Environment] node set on the current [Camera]. Additionally, only one [code]WorldEnvironment[/code] may be instanced in a given scene at a time.
--   		The [code]WorldEnvironment[/code] allows the user to specify default lighting parameters (e.g. ambient lighting), various post-processing effects (e.g. SSAO, DOF, Tonemapping), and how to draw the background (e.g. solid color, skybox). Usually, these are added in order to improve the realism/color balance of the scene.
newtype WorldEnvironment = WorldEnvironment Object
                             deriving newtype AsVariant

instance HasBaseClass WorldEnvironment where
        type BaseClass WorldEnvironment = Node
        super = coerce

newtype X509Certificate = X509Certificate Object
                            deriving newtype AsVariant

instance HasBaseClass X509Certificate where
        type BaseClass X509Certificate = Resource
        super = coerce

-- | Low-level class for creating parsers for XML files.
--   This class can serve as base to make custom XML parsers. Since XML is a very flexible standard, this interface is low level so it can be applied to any possible schema.
newtype XMLParser = XMLParser Object
                      deriving newtype AsVariant

instance HasBaseClass XMLParser where
        type BaseClass XMLParser = Reference
        super = coerce

-- | Sort all child nodes based on their Y positions.
--    The child node must inherit from [CanvasItem] for it to be sorted. Nodes that have a higher Y position will be drawn later, so they will appear on top of nodes that have a lower Y position.
--   		Nesting of YSort nodes is possible. Children YSort nodes will be sorted in the same space as the parent YSort, allowing to better organize a scene or divide it in multiple ones, yet keep the unique sorting.
newtype YSort = YSort Object
                  deriving newtype AsVariant

instance HasBaseClass YSort where
        type BaseClass YSort = Node2D
        super = coerce

-- | Class information repository.
--   Provides access to metadata stored for every available class.
newtype ClassDB = ClassDB Object
                    deriving newtype AsVariant

instance HasBaseClass ClassDB where
        type BaseClass ClassDB = Object
        super = coerce

-- | Type used to handle the filesystem.
--   Directory type. It is used to manage directories and their content (not restricted to the project folder).
--   		Here is an example on how to iterate through the files of a directory:
--   		[codeblock]
--   		func dir_contents(path):
--   		    var dir = Directory.new()
--   		    if dir.open(path) == OK:
--   		        dir.list_dir_begin()
--   		        var file_name = dir.get_next()
--   		        while (file_name != ""):
--   		            if dir.current_is_dir():
--   		                print("Found directory: " + file_name)
--   		            else:
--   		                print("Found file: " + file_name)
--   		            file_name = dir.get_next()
--   		    else:
--   		        print("An error occurred when trying to access the path.")
--   		[/codeblock]
newtype Directory = Directory Object
                      deriving newtype AsVariant

instance HasBaseClass Directory where
        type BaseClass Directory = Reference
        super = coerce

-- | Access to basic engine properties.
--   The [code]Engine[/code] class allows you to query and modify the game's run-time parameters, such as frames per second, time scale, and others.
newtype Engine = Engine Object
                   deriving newtype AsVariant

instance HasBaseClass Engine where
        type BaseClass Engine = Object
        super = coerce

-- | Type to handle file reading and writing operations.
--   File type. This is used to permanently store data into the user device's file system and to read from it. This can be used to store game save data or player configuration files, for example.
--   		Here's a sample on how to write and read from a file:
--   		[codeblock]
--   		func save(content):
--   		    var file = File.new()
--   		    file.open("user://save_game.dat", File.WRITE)
--   		    file.store_string(content)
--   		    file.close()
--   
--   		func load():
--   		    var file = File.new()
--   		    file.open("user://save_game.dat", File.READ)
--   		    var content = file.get_as_text()
--   		    file.close()
--   		    return content
--   		[/codeblock]
newtype File = File Object
                 deriving newtype AsVariant

instance HasBaseClass File where
        type BaseClass File = Reference
        super = coerce

newtype Geometry = Geometry Object
                     deriving newtype AsVariant

instance HasBaseClass Geometry where
        type BaseClass Geometry = Object
        super = coerce

-- | Helper class for parsing JSON data.
--    For usage example and other important hints, see [JSONParseResult].
newtype JSON = JSON Object
                 deriving newtype AsVariant

instance HasBaseClass JSON where
        type BaseClass JSON = Object
        super = coerce

-- | Data transformation (marshalling) and encoding helpers.
--   Provides data transformation and encoding utility functions.
newtype Marshalls = Marshalls Object
                      deriving newtype AsVariant

instance HasBaseClass Marshalls where
        type BaseClass Marshalls = Reference
        super = coerce

-- | A synchronization Mutex.
--    Element used to synchronize multiple [Thread]s. Basically a binary [Semaphore]. Guarantees that only one thread can ever acquire this lock at a time. Can be used to protect a critical section. Be careful to avoid deadlocks.
newtype Mutex = Mutex Object
                  deriving newtype AsVariant

instance HasBaseClass Mutex where
        type BaseClass Mutex = Reference
        super = coerce

-- | Operating System functions.
--    OS Wraps the most common functionality to communicate with the host Operating System, such as: clipboard, video mode, date and time, timers, environment variables, execution of binaries, command line, etc.
newtype OS = OS Object
               deriving newtype AsVariant

instance HasBaseClass OS where
        type BaseClass OS = Object
        super = coerce

-- | Singleton used to load resource files.
--   Singleton used to load resource files from the filesystem.
--   		It uses the many [ResourceFormatLoader] classes registered in the engine (either built-in or from a plugin) to load files into memory and convert them to a format that can be used by the engine.
--   		GDScript has a simplified [method @GDScript.load] built-in method which can be used in most situations, leaving the use of [ResourceLoader] for more advanced scenarios.
newtype ResourceLoader = ResourceLoader Object
                           deriving newtype AsVariant

instance HasBaseClass ResourceLoader where
        type BaseClass ResourceLoader = Object
        super = coerce

-- | Singleton for saving Godot-specific resource types.
--   Singleton for saving Godot-specific resource types to the filesystem.
--   		It uses the many [ResourceFormatSaver] classes registered in the engine (either built-in or from a plugin) to save engine-specific resource data to text-based (e.g. [code].tres[/code] or [code].tscn[/code]) or binary files (e.g. [code].res[/code] or [code].scn[/code]).
newtype ResourceSaver = ResourceSaver Object
                          deriving newtype AsVariant

instance HasBaseClass ResourceSaver where
        type BaseClass ResourceSaver = Object
        super = coerce

-- | A synchronization Semaphore.
--    Element used to synchronize multiple [Thread]s. Initialized to zero on creation. Be careful to avoid deadlocks. For a binary version, see [Mutex].
newtype Semaphore = Semaphore Object
                      deriving newtype AsVariant

instance HasBaseClass Semaphore where
        type BaseClass Semaphore = Reference
        super = coerce

-- | A unit of execution in a process.
--    Can run methods on [Object]s simultaneously. The use of synchronization via [Mutex], [Semaphore] is advised if working with shared objects.
newtype Thread = Thread Object
                   deriving newtype AsVariant

instance HasBaseClass Thread where
        type BaseClass Thread = Reference
        super = coerce

newtype VisualScriptEditor = VisualScriptEditor Object
                               deriving newtype AsVariant

instance HasBaseClass VisualScriptEditor where
        type BaseClass VisualScriptEditor = Object
        super = coerce