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

-- | An anchor point in AR space.
--   The @ARVRAnchor@ point is a spatial node that maps a real world location identified by the AR platform to a position within the game world. For example, as long as plane detection in ARKit is on, ARKit will identify and update the position of planes (tables, floors, etc) and create anchors for them.
--   		This node is mapped to one of the anchors through its unique ID. When you receive a signal that a new anchor is available, you should add this node to your scene for that anchor. You can predefine nodes and set the ID; the nodes will simply remain on 0,0,0 until a plane is recognized.
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

-- | A spatial node representing a spatially-tracked controller.
--   This is a helper spatial node that is linked to the tracking of controllers. It also offers several handy passthroughs to the state of buttons and such on the controllers.
--   		Controllers are linked by their ID. You can create controller nodes before the controllers are available. If your game always uses two controllers (one for each hand), you can predefine the controllers with ID 1 and 2; they will become active as soon as the controllers are identified. If you expect additional controllers to be used, you should react to the signals and add ARVRController nodes to your scene.
--   		The position of the controller node is automatically updated by the @ARVRServer@. This makes this node ideal to add child nodes to visualize the controller.
newtype ARVRController = ARVRController Object
                           deriving newtype AsVariant

instance HasBaseClass ARVRController where
        type BaseClass ARVRController = Spatial
        super = coerce

-- | Base class for an AR/VR interface implementation.
--   This class needs to be implemented to make an AR or VR platform available to Godot and these should be implemented as C++ modules or GDNative modules (note that for GDNative the subclass ARVRScriptInterface should be used). Part of the interface is exposed to GDScript so you can detect, enable and configure an AR or VR platform.
--   		Interfaces should be written in such a way that simply enabling them will give us a working setup. You can query the available interfaces through @ARVRServer@.
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

-- | The origin point in AR/VR.
--   This is a special node within the AR/VR system that maps the physical location of the center of our tracking space to the virtual location within our game world.
--   		There should be only one of these nodes in your scene and you must have one. All the ARVRCamera, ARVRController and ARVRAnchor nodes should be direct children of this node for spatial tracking to work correctly.
--   		It is the position of this node that you update when your character needs to move through your game world while we're not moving in the real world. Movement in the real world is always in relation to this origin point.
--   		For example, if your character is driving a car, the ARVROrigin node should be a child node of this car. Or, if you're implementing a teleport system to move your character, you should change the position of this node.
newtype ARVROrigin = ARVROrigin Object
                       deriving newtype AsVariant

instance HasBaseClass ARVROrigin where
        type BaseClass ARVROrigin = Spatial
        super = coerce

-- | A tracked object.
--   An instance of this object represents a device that is tracked, such as a controller or anchor point. HMDs aren't represented here as they are handled internally.
--   		As controllers are turned on and the AR/VR interface detects them, instances of this object are automatically added to this list of active tracking objects accessible through the @ARVRServer@.
--   		The @ARVRController@ and @ARVRAnchor@ both consume objects of this type and should be used in your project. The positional trackers are just under-the-hood objects that make this all work. These are mostly exposed so that GDNative-based interfaces can interact with them.
newtype ARVRPositionalTracker = ARVRPositionalTracker Object
                                  deriving newtype AsVariant

instance HasBaseClass ARVRPositionalTracker where
        type BaseClass ARVRPositionalTracker = Object
        super = coerce

-- | Server for AR and VR features.
--   The AR/VR server is the heart of our Advanced and Virtual Reality solution and handles all the processing.
newtype ARVRServer = ARVRServer Object
                       deriving newtype AsVariant

instance HasBaseClass ARVRServer where
        type BaseClass ARVRServer = Object
        super = coerce

-- | An implementation of A* to find shortest paths among connected points in space.
--   A* (A star) is a computer algorithm that is widely used in pathfinding and graph traversal, the process of plotting short paths among vertices (points), passing through a given set of edges (segments). It enjoys widespread use due to its performance and accuracy. Godot's A* implementation uses points in three-dimensional space and Euclidean distances by default.
--   		You must add points manually with @method add_point@ and create segments manually with @method connect_points@. Then you can test if there is a path between two points with the @method are_points_connected@ function, get a path containing indices by @method get_id_path@, or one containing actual coordinates with @method get_point_path@.
--   		It is also possible to use non-Euclidean distances. To do so, create a class that extends @AStar@ and override methods @method _compute_cost@ and @method _estimate_cost@. Both take two indices and return a length, as is shown in the following example.
--   		
--   @
--   
--   		class MyAStar:
--   		    extends AStar
--   
--   		    func _compute_cost(u, v):
--   		        return abs(u - v)
--   
--   		    func _estimate_cost(u, v):
--   		        return min(0, abs(u - v) - 1)
--   		
--   @
--   
--   		@method _estimate_cost@ should return a lower bound of the distance, i.e. @_estimate_cost(u, v) <= _compute_cost(u, v)@. This serves as a hint to the algorithm because the custom @_compute_cost@ might be computation-heavy. If this is not the case, make @method _estimate_cost@ return the same value as @method _compute_cost@ to provide the algorithm with the most accurate information.
newtype AStar = AStar Object
                  deriving newtype AsVariant

instance HasBaseClass AStar where
        type BaseClass AStar = Reference
        super = coerce

-- | AStar class representation that uses 2D vectors as edges.
--   This is a wrapper for the @AStar@ class which uses 2D vectors instead of 3D vectors.
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
--   Animations are created using a @SpriteFrames@ resource, which can be configured in the editor via the SpriteFrames panel.
--   		__Note:__ You can associate a set of normal maps by creating additional @SpriteFrames@ resources with a @_normal@ suffix. For example, having 2 @SpriteFrames@ resources @run@ and @run_normal@ will make it so the @run@ animation uses the normal map.
newtype AnimatedSprite = AnimatedSprite Object
                           deriving newtype AsVariant

instance HasBaseClass AnimatedSprite where
        type BaseClass AnimatedSprite = Node2D
        super = coerce

-- | 2D sprite node in 3D world, that can use multiple 2D textures for animation.
--   Animations are created using a @SpriteFrames@ resource, which can be configured in the editor via the SpriteFrames panel.
newtype AnimatedSprite3D = AnimatedSprite3D Object
                             deriving newtype AsVariant

instance HasBaseClass AnimatedSprite3D where
        type BaseClass AnimatedSprite3D = SpriteBase3D
        super = coerce

-- | Proxy texture for simple frame-based animations.
--   @AnimatedTexture@ is a resource format for frame-based animations, where multiple textures can be chained automatically with a predefined delay for each frame. Unlike @AnimationPlayer@ or @AnimatedSprite@, it isn't a @Node@, but has the advantage of being usable anywhere a @Texture@ resource can be used, e.g. in a @TileSet@.
--   		The playback of the animation is controlled by the @fps@ property as well as each frame's optional delay (see @method set_frame_delay@). The animation loops, i.e. it will restart at frame 0 automatically after playing the last frame.
--   		@AnimatedTexture@ currently requires all frame textures to have the same size, otherwise the bigger ones will be cropped to match the smallest one.
--   		__Note:__ AnimatedTexture doesn't support using @AtlasTexture@s. Each frame needs to be a separate @Texture@.
newtype AnimatedTexture = AnimatedTexture Object
                            deriving newtype AsVariant

instance HasBaseClass AnimatedTexture where
        type BaseClass AnimatedTexture = Texture
        super = coerce

-- | Contains data used to animate everything in the engine.
--   An Animation resource contains data used to animate everything in the engine. Animations are divided into tracks, and each track must be linked to a node. The state of that node can be changed through time, by adding timed keys (events) to the track.
--   		
--   @
--   
--   		# This creates an animation that makes the node "Enemy" move to the right by
--   		# 100 pixels in 0.5 seconds.
--   		var animation = Animation.new()
--   		var track_index = animation.add_track(Animation.TYPE_VALUE)
--   		animation.track_set_path(track_index, "Enemy:position:x")
--   		animation.track_insert_key(track_index, 0.0, 0)
--   		animation.track_insert_key(track_index, 0.5, 100)
--   		
--   @
--   
--   		Animations are just data containers, and must be added to nodes such as an @AnimationPlayer@ or @AnimationTreePlayer@ to be played back. Animation tracks have different types, each with its own set of dedicated methods. Check @enum TrackType@ to see available types.
newtype Animation = Animation Object
                      deriving newtype AsVariant

instance HasBaseClass Animation where
        type BaseClass Animation = Resource
        super = coerce

-- | Base resource for @AnimationTree@ nodes.
--    In general, it's not used directly, but you can create custom ones with custom blending formulas.
--   	Inherit this when creating nodes mainly for use in @AnimationNodeBlendTree@, otherwise @AnimationRootNode@ should be used instead.
newtype AnimationNode = AnimationNode Object
                          deriving newtype AsVariant

instance HasBaseClass AnimationNode where
        type BaseClass AnimationNode = Resource
        super = coerce

-- | Blends two animations additively inside of an @AnimationNodeBlendTree@.
--   A resource to add to an @AnimationNodeBlendTree@. Blends two animations additively based on an amount value in the @@0.0, 1.0@@ range.
newtype AnimationNodeAdd2 = AnimationNodeAdd2 Object
                              deriving newtype AsVariant

instance HasBaseClass AnimationNodeAdd2 where
        type BaseClass AnimationNodeAdd2 = AnimationNode
        super = coerce

-- | Blends two of three animations additively inside of an @AnimationNodeBlendTree@.
--   A resource to add to an @AnimationNodeBlendTree@. Blends two animations together additively out of three based on a value in the @@-1.0, 1.0@@ range.
--   		This node has three inputs:
--   		- The base animation to add to
--   		- A -add animation to blend with when the blend amount is in the @@-1.0, 0.0@@ range.
--   		- A +add animation to blend with when the blend amount is in the @@0.0, 1.0@@ range
newtype AnimationNodeAdd3 = AnimationNodeAdd3 Object
                              deriving newtype AsVariant

instance HasBaseClass AnimationNodeAdd3 where
        type BaseClass AnimationNodeAdd3 = AnimationNode
        super = coerce

-- | Input animation to use in an @AnimationNodeBlendTree@.
--   A resource to add to an @AnimationNodeBlendTree@. Only features one output set using the @animation@ property. Use it as an input for @AnimationNode@ that blend animations together.
newtype AnimationNodeAnimation = AnimationNodeAnimation Object
                                   deriving newtype AsVariant

instance HasBaseClass AnimationNodeAnimation where
        type BaseClass AnimationNodeAnimation = AnimationRootNode
        super = coerce

-- | Blends two animations linearly inside of an @AnimationNodeBlendTree@.
--   A resource to add to an @AnimationNodeBlendTree@. Blends two animations linearly based on an amount value in the @@0.0, 1.0@@ range.
newtype AnimationNodeBlend2 = AnimationNodeBlend2 Object
                                deriving newtype AsVariant

instance HasBaseClass AnimationNodeBlend2 where
        type BaseClass AnimationNodeBlend2 = AnimationNode
        super = coerce

-- | Blends two of three animations linearly inside of an @AnimationNodeBlendTree@.
--   A resource to add to an @AnimationNodeBlendTree@. Blends two animations together linearly out of three based on a value in the @@-1.0, 1.0@@ range.
--   		This node has three inputs:
--   		- The base animation
--   		- A -blend animation to blend with when the blend amount is in the @@-1.0, 0.0@@ range.
--   		- A +blend animation to blend with when the blend amount is in the @@0.0, 1.0@@ range
newtype AnimationNodeBlend3 = AnimationNodeBlend3 Object
                                deriving newtype AsVariant

instance HasBaseClass AnimationNodeBlend3 where
        type BaseClass AnimationNodeBlend3 = AnimationNode
        super = coerce

-- | Blends linearly between two of any number of @AnimationNode@ of any type placed on a virtual axis.
--   A resource to add to an @AnimationNodeBlendTree@.
--   		This is a virtual axis on which you can add any type of @AnimationNode@ using @method add_blend_point@.
--   		Outputs the linear blend of the two @AnimationNode@s closest to the node's current value.
--   		You can set the extents of the axis using the @min_space@ and @max_space@.
newtype AnimationNodeBlendSpace1D = AnimationNodeBlendSpace1D Object
                                      deriving newtype AsVariant

instance HasBaseClass AnimationNodeBlendSpace1D where
        type BaseClass AnimationNodeBlendSpace1D = AnimationRootNode
        super = coerce

-- | Blends linearly between three @AnimationNode@ of any type placed in a 2D space.
--   A resource to add to an @AnimationNodeBlendTree@.
--   		This node allows you to blend linearly between three animations using a @Vector2@ weight.
--   		You can add vertices to the blend space with @method add_blend_point@ and automatically triangulate it by setting @auto_triangles@ to @true@. Otherwise, use @method add_triangle@ and @method remove_triangle@ to create up the blend space by hand.
newtype AnimationNodeBlendSpace2D = AnimationNodeBlendSpace2D Object
                                      deriving newtype AsVariant

instance HasBaseClass AnimationNodeBlendSpace2D where
        type BaseClass AnimationNodeBlendSpace2D = AnimationRootNode
        super = coerce

-- | @AnimationTree@ node resource that contains many blend type nodes.
--   This node may contain a sub-tree of any other blend type nodes, such as mix, blend2, blend3, one shot, etc. This is one of the most commonly used roots.
newtype AnimationNodeBlendTree = AnimationNodeBlendTree Object
                                   deriving newtype AsVariant

instance HasBaseClass AnimationNodeBlendTree where
        type BaseClass AnimationNodeBlendTree = AnimationRootNode
        super = coerce

-- | Plays an animation once in @AnimationNodeBlendTree@.
--   A resource to add to an @AnimationNodeBlendTree@. This node will execute a sub-animation and return once it finishes. Blend times for fading in and out can be customized, as well as filters.
newtype AnimationNodeOneShot = AnimationNodeOneShot Object
                                 deriving newtype AsVariant

instance HasBaseClass AnimationNodeOneShot where
        type BaseClass AnimationNodeOneShot = AnimationNode
        super = coerce

-- | Generic output node to be added to @AnimationNodeBlendTree@.
newtype AnimationNodeOutput = AnimationNodeOutput Object
                                deriving newtype AsVariant

instance HasBaseClass AnimationNodeOutput where
        type BaseClass AnimationNodeOutput = AnimationNode
        super = coerce

-- | State machine for control of animations.
--   Contains multiple nodes representing animation states, connected in a graph. Node transitions can be configured to happen automatically or via code, using a shortest-path algorithm. Retrieve the @AnimationNodeStateMachinePlayback@ object from the @AnimationTree@ node to control it programmatically.
--   		__Example:__
--   		
--   @
--   
--   		var state_machine = $AnimationTree.get("parameters/playback")
--   		state_machine.travel("some_state")
--   		
--   @
newtype AnimationNodeStateMachine = AnimationNodeStateMachine Object
                                      deriving newtype AsVariant

instance HasBaseClass AnimationNodeStateMachine where
        type BaseClass AnimationNodeStateMachine = AnimationRootNode
        super = coerce

-- | Playback control for @AnimationNodeStateMachine@.
--   Allows control of @AnimationTree@ state machines created with @AnimationNodeStateMachine@. Retrieve with @$AnimationTree.get("parameters/playback")@.
--   		__Example:__
--   		
--   @
--   
--   		var state_machine = $AnimationTree.get("parameters/playback")
--   		state_machine.travel("some_state")
--   		
--   @
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

-- | A time-scaling animation node to be used with @AnimationTree@.
--   Allows scaling the speed of the animation (or reversing it) in any children nodes. Setting it to 0 will pause the animation.
newtype AnimationNodeTimeScale = AnimationNodeTimeScale Object
                                   deriving newtype AsVariant

instance HasBaseClass AnimationNodeTimeScale where
        type BaseClass AnimationNodeTimeScale = AnimationNode
        super = coerce

-- | A time-seeking animation node to be used with @AnimationTree@.
--   This node can be used to cause a seek command to happen to any sub-children of the graph. After setting the time, this value returns to -1.
newtype AnimationNodeTimeSeek = AnimationNodeTimeSeek Object
                                  deriving newtype AsVariant

instance HasBaseClass AnimationNodeTimeSeek where
        type BaseClass AnimationNodeTimeSeek = AnimationNode
        super = coerce

-- | A generic animation transition node for @AnimationTree@.
--   Simple state machine for cases which don't require a more advanced @AnimationNodeStateMachine@. Animations can be connected to the inputs and transition times can be specified.
newtype AnimationNodeTransition = AnimationNodeTransition Object
                                    deriving newtype AsVariant

instance HasBaseClass AnimationNodeTransition where
        type BaseClass AnimationNodeTransition = AnimationNode
        super = coerce

-- | Container and player of @Animation@ resources.
--   An animation player is used for general-purpose playback of @Animation@ resources. It contains a dictionary of animations (referenced by name) and custom blend times between their transitions. Additionally, animations can be played and blended in different channels.
--   		@AnimationPlayer@ is more suited than @Tween@ for animations where you know the final values in advance. For example, fading a screen in and out is more easily done with an @AnimationPlayer@ node thanks to the animation tools provided by the editor. That particular example can also be implemented with a @Tween@ node, but it requires doing everything by code.
--   		Updating the target properties of animations occurs at process time.
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

-- | A node to be used for advanced animation transitions in an @AnimationPlayer@.
--   Note: When linked with an @AnimationPlayer@, several properties and methods of the corresponding @AnimationPlayer@ will not function as expected. Playback and transitions should be handled using only the @AnimationTree@ and its constituent @AnimationNode@(s). The @AnimationPlayer@ node should be used solely for adding, deleting, and editing animations.
newtype AnimationTree = AnimationTree Object
                          deriving newtype AsVariant

instance HasBaseClass AnimationTree where
        type BaseClass AnimationTree = Node
        super = coerce

-- | @i@Deprecated.@/i@ Animation player that uses a node graph for blending animations. Superseded by @AnimationTree@.
--   @i@Deprecated.@/i@ A node graph tool for blending multiple animations bound to an @AnimationPlayer@. Especially useful for animating characters or other skeleton-based rigs. It can combine several animations to form a desired pose.
--   		It takes @Animation@s from an @AnimationPlayer@ node and mixes them depending on the graph.
--   		See @AnimationTree@ for a more full-featured replacement of this node.
newtype AnimationTreePlayer = AnimationTreePlayer Object
                                deriving newtype AsVariant

instance HasBaseClass AnimationTreePlayer where
        type BaseClass AnimationTreePlayer = Node
        super = coerce

-- | General-purpose area node for detection and 3D physics influence.
--   3D area that detects @CollisionObject@ nodes overlapping, entering, or exiting. Can also alter or override local physics parameters (gravity, damping).
newtype Area = Area Object
                 deriving newtype AsVariant

instance HasBaseClass Area where
        type BaseClass Area = CollisionObject
        super = coerce

-- | 2D area for detection and 2D physics influence.
--   2D area that detects @CollisionObject2D@ nodes overlapping, entering, or exiting. Can also alter or override local physics parameters (gravity, damping).
newtype Area2D = Area2D Object
                   deriving newtype AsVariant

instance HasBaseClass Area2D where
        type BaseClass Area2D = CollisionObject2D
        super = coerce

-- | @Mesh@ type that provides utility for constructing a surface from arrays.
--   The @ArrayMesh@ is used to construct a @Mesh@ by specifying the attributes as arrays.
--   		The most basic example is the creation of a single triangle:
--   		
--   @
--   
--   		var vertices = PoolVector3Array()
--   		vertices.push_back(Vector3(0, 1, 0))
--   		vertices.push_back(Vector3(1, 0, 0))
--   		vertices.push_back(Vector3(0, 0, 1))
--   		# Initialize the ArrayMesh.
--   		var arr_mesh = ArrayMesh.new()
--   		var arrays = @@
--   		arrays.resize(ArrayMesh.ARRAY_MAX)
--   		arrays@ArrayMesh.ARRAY_VERTEX@ = vertices
--   		# Create the Mesh.
--   		arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
--   		var m = MeshInstance.new()
--   		m.mesh = arr_mesh
--   		
--   @
--   
--   		The @MeshInstance@ is ready to be added to the @SceneTree@ to be shown.
--   		See also @ImmediateGeometry@, @MeshDataTool@ and @SurfaceTool@ for procedural geometry generation.
--   		__Note:__ Godot uses clockwise @url=https://learnopengl.com/Advanced-OpenGL/Face-culling@winding order@/url@ for front faces of triangle primitive modes.
newtype ArrayMesh = ArrayMesh Object
                      deriving newtype AsVariant

instance HasBaseClass ArrayMesh where
        type BaseClass ArrayMesh = Mesh
        super = coerce

-- | Packs multiple small textures in a single, bigger one. Helps to optimize video memory costs and render calls.
--   @Texture@ resource aimed at managing big textures files that pack multiple smaller textures. Consists of a @Texture@, a margin that defines the border width, and a region that defines the actual area of the AtlasTexture.
newtype AtlasTexture = AtlasTexture Object
                         deriving newtype AsVariant

instance HasBaseClass AtlasTexture where
        type BaseClass AtlasTexture = Texture
        super = coerce

-- | Stores information about the audio buses.
--   Stores position, muting, solo, bypass, effects, effect position, volume, and the connections between buses. See @AudioServer@ for usage.
newtype AudioBusLayout = AudioBusLayout Object
                           deriving newtype AsVariant

instance HasBaseClass AudioBusLayout where
        type BaseClass AudioBusLayout = Resource
        super = coerce

-- | Audio effect for audio.
--   Base resource for audio bus. Applies an audio effect on the bus that the resource is applied on.
newtype AudioEffect = AudioEffect Object
                        deriving newtype AsVariant

instance HasBaseClass AudioEffect where
        type BaseClass AudioEffect = Resource
        super = coerce

-- | Adds an amplifying audio effect to an audio bus.
--   		Increases or decreases the volume of the selected audio bus.
--   Increases or decreases the volume being routed through the audio bus.
newtype AudioEffectAmplify = AudioEffectAmplify Object
                               deriving newtype AsVariant

instance HasBaseClass AudioEffectAmplify where
        type BaseClass AudioEffectAmplify = AudioEffect
        super = coerce

-- | Adds a band limit filter to the audio bus.
--   Limits the frequencies in a range around the @AudioEffectFilter.cutoff_hz@ and allows frequencies outside of this range to pass.
newtype AudioEffectBandLimitFilter = AudioEffectBandLimitFilter Object
                                       deriving newtype AsVariant

instance HasBaseClass AudioEffectBandLimitFilter where
        type BaseClass AudioEffectBandLimitFilter = AudioEffectFilter
        super = coerce

-- | Adds a band pass filter to the audio bus.
--   Attenuates the frequencies inside of a range around the @AudioEffectFilter.cutoff_hz@ and cuts frequencies outside of this band.
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

-- | Adds a compressor audio effect to an audio bus.
--   		Reduces sounds that exceed a certain threshold level, smooths out the dynamics and increases the overall volume.
--   Dynamic range compressor reduces the level of the sound when the amplitude goes over a certain threshold in Decibels. One of the main uses of a compressor is to increase the dynamic range by clipping as little as possible (when sound goes over 0dB).
--   		Compressor has many uses in the mix:
--   		- In the Master bus to compress the whole output (although an @AudioEffectLimiter@ is probably better).
--   		- In voice channels to ensure they sound as balanced as possible.
--   		- Sidechained. This can reduce the sound level sidechained with another audio bus for threshold detection. This technique is common in video game mixing to the level of music and SFX while voices are being heard.
--   		- Accentuates transients by using a wider attack, making effects sound more punchy.
newtype AudioEffectCompressor = AudioEffectCompressor Object
                                  deriving newtype AsVariant

instance HasBaseClass AudioEffectCompressor where
        type BaseClass AudioEffectCompressor = AudioEffect
        super = coerce

-- | Adds a delay audio effect to an audio bus. Plays input signal back after a period of time.
--   		Two tap delay and feedback options.
--   Plays input signal back after a period of time. The delayed signal may be played back multiple times to create the sound of a repeating, decaying echo. Delay effects range from a subtle echo effect to a pronounced blending of previous sounds with new sounds.
newtype AudioEffectDelay = AudioEffectDelay Object
                             deriving newtype AsVariant

instance HasBaseClass AudioEffectDelay where
        type BaseClass AudioEffectDelay = AudioEffect
        super = coerce

-- | Adds a distortion audio effect to an Audio bus.
--   		Modify the sound to make it distorted.
--   Different types are available: clip, tan, lo-fi (bit crushing), overdrive, or waveshape.
--   		By distorting the waveform the frequency content change, which will often make the sound "crunchy" or "abrasive". For games, it can simulate sound coming from some saturated device or speaker very efficiently.
newtype AudioEffectDistortion = AudioEffectDistortion Object
                                  deriving newtype AsVariant

instance HasBaseClass AudioEffectDistortion where
        type BaseClass AudioEffectDistortion = AudioEffect
        super = coerce

-- | Base class for audio equalizers. Gives you control over frequencies.
--   		Use it to create a custom equalizer if @AudioEffectEQ6@, @AudioEffectEQ10@ or @AudioEffectEQ21@ don't fit your needs.
--   AudioEffectEQ gives you control over frequencies. Use it to compensate for existing deficiencies in audio. AudioEffectEQs are useful on the Master bus to completely master a mix and give it more character. They are also useful when a game is run on a mobile device, to adjust the mix to that kind of speakers (it can be added but disabled when headphones are plugged).
newtype AudioEffectEQ = AudioEffectEQ Object
                          deriving newtype AsVariant

instance HasBaseClass AudioEffectEQ where
        type BaseClass AudioEffectEQ = AudioEffect
        super = coerce

-- | Adds a 10-band equalizer audio effect to an Audio bus. Gives you control over frequencies from 31 Hz to 16000 Hz.
--   		Each frequency can be modulated between -60/+24 dB.
--   Frequency bands:
--   		Band 1: 31 Hz
--   		Band 2: 62 Hz
--   		Band 3: 125 Hz
--   		Band 4: 250 Hz
--   		Band 5: 500 Hz
--   		Band 6: 1000 Hz
--   		Band 7: 2000 Hz
--   		Band 8: 4000 Hz
--   		Band 9: 8000 Hz
--   		Band 10: 16000 Hz
--   		See also @AudioEffectEQ@, @AudioEffectEQ6@, @AudioEffectEQ21@.
newtype AudioEffectEQ10 = AudioEffectEQ10 Object
                            deriving newtype AsVariant

instance HasBaseClass AudioEffectEQ10 where
        type BaseClass AudioEffectEQ10 = AudioEffectEQ
        super = coerce

-- | Adds a 21-band equalizer audio effect to an Audio bus. Gives you control over frequencies from 22 Hz to 22000 Hz.
--   		Each frequency can be modulated between -60/+24 dB.
--   Frequency bands:
--   		Band 1: 22 Hz
--   		Band 2: 32 Hz
--   		Band 3: 44 Hz
--   		Band 4: 63 Hz
--   		Band 5: 90 Hz
--   		Band 6: 125 Hz
--   		Band 7: 175 Hz
--   		Band 8: 250 Hz
--   		Band 9: 350 Hz
--   		Band 10: 500 Hz
--   		Band 11: 700 Hz
--   		Band 12: 1000 Hz
--   		Band 13: 1400 Hz
--   		Band 14: 2000 Hz
--   		Band 15: 2800 Hz
--   		Band 16: 4000 Hz
--   		Band 17: 5600 Hz
--   		Band 18: 8000 Hz
--   		Band 19: 11000 Hz
--   		Band 20: 16000 Hz
--   		Band 21: 22000 Hz
--   		See also @AudioEffectEQ@, @AudioEffectEQ6@, @AudioEffectEQ10@.
newtype AudioEffectEQ21 = AudioEffectEQ21 Object
                            deriving newtype AsVariant

instance HasBaseClass AudioEffectEQ21 where
        type BaseClass AudioEffectEQ21 = AudioEffectEQ
        super = coerce

-- | Adds a 6-band equalizer audio effect to an Audio bus. Gives you control over frequencies from 32 Hz to 10000 Hz.
--   		Each frequency can be modulated between -60/+24 dB.
--   Frequency bands:
--   		Band 1: 32 Hz
--   		Band 2: 100 Hz
--   		Band 3: 320 Hz
--   		Band 4: 1000 Hz
--   		Band 5: 3200 Hz
--   		Band 6: 10000 Hz
--   		See also @AudioEffectEQ@, @AudioEffectEQ10@, @AudioEffectEQ21@.
newtype AudioEffectEQ6 = AudioEffectEQ6 Object
                           deriving newtype AsVariant

instance HasBaseClass AudioEffectEQ6 where
        type BaseClass AudioEffectEQ6 = AudioEffectEQ
        super = coerce

-- | Adds a filter to the audio bus.
--   Allows frequencies other than the @cutoff_hz@ to pass.
newtype AudioEffectFilter = AudioEffectFilter Object
                              deriving newtype AsVariant

instance HasBaseClass AudioEffectFilter where
        type BaseClass AudioEffectFilter = AudioEffect
        super = coerce

-- | Adds a high-pass filter to the Audio Bus.
--   Cuts frequencies lower than the @AudioEffectFilter.cutoff_hz@ and allows higher frequencies to pass.
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

-- | Adds a soft-clip limiter audio effect to an Audio bus.
--   A limiter is similar to a compressor, but it's less flexible and designed to disallow sound going over a given dB threshold. Adding one in the Master bus is always recommended to reduce the effects of clipping.
--   		Soft clipping starts to reduce the peaks a little below the threshold level and progressively increases its effect as the input level increases such that the threshold is never exceeded.
newtype AudioEffectLimiter = AudioEffectLimiter Object
                               deriving newtype AsVariant

instance HasBaseClass AudioEffectLimiter where
        type BaseClass AudioEffectLimiter = AudioEffect
        super = coerce

-- | Adds a low-pass filter to the Audio bus.
--   Cuts frequencies higher than the @AudioEffectFilter.cutoff_hz@ and allows lower frequencies to pass.
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

-- | Adds a notch filter to the Audio bus.
--   Attenuates frequencies in a narrow band around the @AudioEffectFilter.cutoff_hz@ and cuts frequencies outside of this range.
newtype AudioEffectNotchFilter = AudioEffectNotchFilter Object
                                   deriving newtype AsVariant

instance HasBaseClass AudioEffectNotchFilter where
        type BaseClass AudioEffectNotchFilter = AudioEffectFilter
        super = coerce

-- | Adds a panner audio effect to an Audio bus. Pans sound left or right.
--   Determines how much of an audio signal is sent to the left and right buses.
newtype AudioEffectPanner = AudioEffectPanner Object
                              deriving newtype AsVariant

instance HasBaseClass AudioEffectPanner where
        type BaseClass AudioEffectPanner = AudioEffect
        super = coerce

-- | Adds a phaser audio effect to an Audio bus.
--   		Combines the original signal with a copy that is slightly out of phase with the original.
--   Combines phase-shifted signals with the original signal. The movement of the phase-shifted signals is controlled using a low-frequency oscillator.
newtype AudioEffectPhaser = AudioEffectPhaser Object
                              deriving newtype AsVariant

instance HasBaseClass AudioEffectPhaser where
        type BaseClass AudioEffectPhaser = AudioEffect
        super = coerce

-- | Adds a pitch-shifting audio effect to an Audio bus.
--   		Raises or lowers the pitch of original sound.
--   Allows modulation of pitch independently of tempo. All frequencies can be increased/decreased with minimal effect on transients.
newtype AudioEffectPitchShift = AudioEffectPitchShift Object
                                  deriving newtype AsVariant

instance HasBaseClass AudioEffectPitchShift where
        type BaseClass AudioEffectPitchShift = AudioEffect
        super = coerce

-- | Audio effect used for recording sound from a microphone.
--   Allows the user to record sound from a microphone. It sets and gets the format in which the audio file will be recorded (8-bit, 16-bit, or compressed). It checks whether or not the recording is active, and if it is, records the sound. It then returns the recorded sample.
newtype AudioEffectRecord = AudioEffectRecord Object
                              deriving newtype AsVariant

instance HasBaseClass AudioEffectRecord where
        type BaseClass AudioEffectRecord = AudioEffect
        super = coerce

-- | Adds a reverberation audio effect to an Audio bus.
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

-- | Server interface for low-level audio access.
--   @AudioServer@ is a low-level server interface for audio access. It is in charge of creating sample data (playable audio) as well as its playback via a voice interface.
newtype AudioServer = AudioServer Object
                        deriving newtype AsVariant

instance HasBaseClass AudioServer where
        type BaseClass AudioServer = Object
        super = coerce

-- | Base class for audio streams.
--    Audio streams are used for sound effects and music playback, and support WAV (via @AudioStreamSample@) and OGG (via @AudioStreamOGGVorbis@) file formats.
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
--   Can play, loop, pause a scroll through audio. See @AudioStream@ and @AudioStreamOGGVorbis@ for usage.
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

-- | Plays back audio non-positionally.
--   Plays an audio stream non-positionally.
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
--   		By default, audio is heard from the camera position. This can be changed by adding a @Listener@ node to the scene and enabling it by calling @method Listener.make_current@ on it.
newtype AudioStreamPlayer3D = AudioStreamPlayer3D Object
                                deriving newtype AsVariant

instance HasBaseClass AudioStreamPlayer3D where
        type BaseClass AudioStreamPlayer3D = Spatial
        super = coerce

-- | Plays audio with random pitch shifting.
--   Randomly varies pitch on each start.
newtype AudioStreamRandomPitch = AudioStreamRandomPitch Object
                                   deriving newtype AsVariant

instance HasBaseClass AudioStreamRandomPitch where
        type BaseClass AudioStreamRandomPitch = AudioStream
        super = coerce

-- | Stores audio data loaded from WAV files.
--   AudioStreamSample stores sound samples loaded from WAV files. To play the stored sound, use an @AudioStreamPlayer@ (for non-positional audio) or @AudioStreamPlayer2D@/@AudioStreamPlayer3D@ (for positional audio). The sound can be looped.
--   		This class can also be used to store dynamically-generated PCM audio data.
newtype AudioStreamSample = AudioStreamSample Object
                              deriving newtype AsVariant

instance HasBaseClass AudioStreamSample where
        type BaseClass AudioStreamSample = AudioStream
        super = coerce

-- | Copies a region of the screen (or the whole screen) to a buffer so it can be accessed in your shader scripts through the @texture(SCREEN_TEXTURE, ...)@ function.
--   Node for back-buffering the currently-displayed screen. The region defined in the BackBufferCopy node is bufferized with the content of the screen it covers, or the entire screen according to the copy mode set. Use the @texture(SCREEN_TEXTURE, ...)@ function in your shader scripts to access the buffer.
--   		__Note:__ Since this node inherits from @Node2D@ (and not @Control@), anchors and margins won't apply to child @Control@-derived nodes. This can be problematic when resizing the window. To avoid this, add @Control@-derived nodes as @i@siblings@/i@ to the BackBufferCopy node instead of adding them as children.
newtype BackBufferCopy = BackBufferCopy Object
                           deriving newtype AsVariant

instance HasBaseClass BackBufferCopy where
        type BaseClass BackBufferCopy = Node2D
        super = coerce

-- | Prerendered indirect light map for a scene.
--   Baked lightmaps are an alternative workflow for adding indirect (or baked) lighting to a scene. Unlike the @GIProbe@ approach, baked lightmaps work fine on low-end PCs and mobile devices as they consume almost no resources in run-time.
--   		__Note:__ This node has many known bugs and will be @url=https://godotengine.org/article/godot-40-will-get-new-modernized-lightmapper@rewritten for Godot 4.0@/url@. See @url=https://github.com/godotengine/godot/issues/30929@GitHub issue #30929@/url@.
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

-- | Renders text using fonts under the @url=https://www.angelcode.com/products/bmfont/@BMFont@/url@ format.
--   		Handles files with the @.fnt@ extension.
--   Renders text using @*.fnt@ fonts containing texture atlases. Supports distance fields. For using vector font files like TTF directly, see @DynamicFont@.
newtype BitmapFont = BitmapFont Object
                       deriving newtype AsVariant

instance HasBaseClass BitmapFont where
        type BaseClass BitmapFont = Font
        super = coerce

-- | Joint used with @Skeleton2D@ to control and animate other nodes.
--   Use a hierarchy of @Bone2D@ bound to a @Skeleton2D@ to control, and animate other @Node2D@ nodes.
--   		You can use @Bone2D@ and @Skeleton2D@ nodes to animate 2D meshes created with the Polygon 2D UV editor.
--   		Each bone has a @rest@ transform that you can reset to with @method apply_rest@. These rest poses are relative to the bone's parent.
--   		If in the editor, you can set the rest pose of an entire skeleton using a menu option, from the code, you need to iterate over the bones to set their individual rest poses.
newtype Bone2D = Bone2D Object
                   deriving newtype AsVariant

instance HasBaseClass Bone2D where
        type BaseClass Bone2D = Node2D
        super = coerce

-- | A node that will attach to a bone.
--   This node must be the child of a @Skeleton@ node. You can then select a bone for this node to attach to. The BoneAttachment node will copy the transform of the selected bone.
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
--   3D box shape that can be a child of a @PhysicsBody@ or @Area@.
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
--   Button is the standard themed button. It can contain text and an icon, and will display them according to the current @Theme@.
--   		__Example of creating a button and assigning an action when pressed by code:__
--   		
--   @
--   
--   		func _ready():
--   		    var button = Button.new()
--   		    button.text = "Click me"
--   		    button.connect("pressed", self, "_button_pressed")
--   		    add_child(button)
--   
--   		func _button_pressed():
--   		    print("Hello world!")
--   		
--   @
--   
--   		Buttons (like all Control nodes) can also be created in the editor, but some situations may require creating them from code.
newtype Button = Button Object
                   deriving newtype AsVariant

instance HasBaseClass Button where
        type BaseClass Button = BaseButton
        super = coerce

-- | Group of Buttons.
--   Group of @Button@. All direct and indirect children buttons become radios. Only one allows being pressed.
--   		@BaseButton.toggle_mode@ should be @true@.
newtype ButtonGroup = ButtonGroup Object
                        deriving newtype AsVariant

instance HasBaseClass ButtonGroup where
        type BaseClass ButtonGroup = Resource
        super = coerce

-- | CPU-based 3D particle emitter.
--   CPU-based 3D particle node used to create a variety of particle systems and effects.
--   		See also @Particles@, which provides the same functionality with hardware acceleration, but may not run on older devices.
newtype CPUParticles = CPUParticles Object
                         deriving newtype AsVariant

instance HasBaseClass CPUParticles where
        type BaseClass CPUParticles = GeometryInstance
        super = coerce

-- | CPU-based 2D particle emitter.
--   CPU-based 2D particle node used to create a variety of particle systems and effects.
--   		See also @Particles2D@, which provides the same functionality with hardware acceleration, but may not run on older devices.
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
--   Camera is a special node that displays what is visible from its current location. Cameras register themselves in the nearest @Viewport@ node (when ascending the tree). Only one camera can be active per viewport. If no viewport is available ascending the tree, the camera will register in the global viewport. In other words, a camera just provides 3D display capabilities to a @Viewport@, and, without one, a scene registered in that @Viewport@ (or higher viewports) can't be displayed.
newtype Camera = Camera Object
                   deriving newtype AsVariant

instance HasBaseClass Camera where
        type BaseClass Camera = Spatial
        super = coerce

-- | Camera node for 2D scenes.
--    It forces the screen (current layer) to scroll following this node. This makes it easier (and faster) to program scrollable scenes than manually changing the position of @CanvasItem@-based nodes.
--   		This node is intended to be a simple helper to get things going quickly and it may happen that more functionality is desired to change how the camera works. To make your own custom camera node, inherit from @Node2D@ and change the transform of the canvas by setting @Viewport.canvas_transform@ in @Viewport@ (you can obtain the current @Viewport@ by using @method Node.get_viewport@).
--   		Note that the @Camera2D@ node's @position@ doesn't represent the actual position of the screen, which may differ due to applied smoothing or limits. You can use @method get_camera_screen_center@ to get the real position.
newtype Camera2D = Camera2D Object
                     deriving newtype AsVariant

instance HasBaseClass Camera2D where
        type BaseClass Camera2D = Node2D
        super = coerce

-- | A camera feed gives you access to a single physical camera attached to your device.
--    When enabled, Godot will start capturing frames from the camera which can then be used.
--   		__Note:__ Many cameras will return YCbCr images which are split into two textures and need to be combined in a shader. Godot does this automatically for you if you set the environment to show the camera image in the background.
newtype CameraFeed = CameraFeed Object
                       deriving newtype AsVariant

instance HasBaseClass CameraFeed where
        type BaseClass CameraFeed = Reference
        super = coerce

-- | Server keeping track of different cameras accessible in Godot.
--   The @CameraServer@ keeps track of different cameras accessible in Godot. These are external cameras such as webcams or the cameras on your phone.
--   		It is notably used to provide AR modules with a video feed from the camera.
newtype CameraServer = CameraServer Object
                         deriving newtype AsVariant

instance HasBaseClass CameraServer where
        type BaseClass CameraServer = Object
        super = coerce

-- | Texture provided by a @CameraFeed@.
--   This texture gives access to the camera texture provided by a @CameraFeed@.
--   		__Note:__ Many cameras supply YCbCr images which need to be converted in a shader.
newtype CameraTexture = CameraTexture Object
                          deriving newtype AsVariant

instance HasBaseClass CameraTexture where
        type BaseClass CameraTexture = Texture
        super = coerce

-- | Base class of anything 2D.
--    Canvas items are laid out in a tree; children inherit and extend their parent's transform. @CanvasItem@ is extended by @Control@ for anything GUI-related, and by @Node2D@ for anything related to the 2D engine.
--   		Any @CanvasItem@ can draw. For this, @method update@ must be called, then @NOTIFICATION_DRAW@ will be received on idle time to request redraw. Because of this, canvas items don't need to be redrawn on every frame, improving the performance significantly. Several functions for drawing on the @CanvasItem@ are provided (see @draw_*@ functions). However, they can only be used inside the @method Object._notification@, signal or @method _draw@ virtual functions.
--   		Canvas items are drawn in tree order. By default, children are on top of their parents so a root @CanvasItem@ will be drawn behind everything. This behavior can be changed on a per-item basis.
--   		A @CanvasItem@ can also be hidden, which will also hide its children. It provides many ways to change parameters such as modulation (for itself and its children) and self modulation (only for itself), as well as its blend mode.
--   		Ultimately, a transform notification can be requested, which will notify the node that its global position changed in case the parent tree changed.
--   		__Note:__ Unless otherwise specified, all methods that have angle parameters must have angles specified as @i@radians@/i@. To convert degrees to radians, use @method @GDScript.deg2rad@.
newtype CanvasItem = CanvasItem Object
                       deriving newtype AsVariant

instance HasBaseClass CanvasItem where
        type BaseClass CanvasItem = Node
        super = coerce

-- | A material for @CanvasItem@s.
--   @CanvasItemMaterial@s provide a means of modifying the textures associated with a CanvasItem. They specialize in describing blend and lighting behaviors for textures. Use a @ShaderMaterial@ to more fully customize a material's interactions with a @CanvasItem@.
newtype CanvasItemMaterial = CanvasItemMaterial Object
                               deriving newtype AsVariant

instance HasBaseClass CanvasItemMaterial where
        type BaseClass CanvasItemMaterial = Material
        super = coerce

-- | Canvas drawing layer.
--    @CanvasItem@ nodes that are direct or indirect children of a @CanvasLayer@ will be drawn in that layer. The layer is a numeric index that defines the draw order. The default 2D scene renders with index 0, so a @CanvasLayer@ with index -1 will be drawn below, and one with index 1 will be drawn above. This is very useful for HUDs (in layer 1+ or above), or backgrounds (in layer -1 or below).
newtype CanvasLayer = CanvasLayer Object
                        deriving newtype AsVariant

instance HasBaseClass CanvasLayer where
        type BaseClass CanvasLayer = Node
        super = coerce

-- | Tint the entire canvas.
--   @CanvasModulate@ tints the canvas elements using its assigned @color@.
newtype CanvasModulate = CanvasModulate Object
                           deriving newtype AsVariant

instance HasBaseClass CanvasModulate where
        type BaseClass CanvasModulate = Node2D
        super = coerce

-- | Class representing a capsule-shaped @PrimitiveMesh@.
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
--   CenterContainer keeps children controls centered. This container keeps all children to their minimum size, in the center.
newtype CenterContainer = CenterContainer Object
                            deriving newtype AsVariant

instance HasBaseClass CenterContainer where
        type BaseClass CenterContainer = Container
        super = coerce

-- | Controls how an individual character will be displayed in a @RichTextEffect@.
--   By setting various properties on this object, you can control how individual characters will be displayed in a @RichTextEffect@.
newtype CharFXTransform = CharFXTransform Object
                            deriving newtype AsVariant

instance HasBaseClass CharFXTransform where
        type BaseClass CharFXTransform = Reference
        super = coerce

-- | Binary choice user interface widget. See also @CheckButton@.
--   A checkbox allows the user to make a binary choice (choosing only one of two possible options). It's similar to @CheckButton@ in functionality, but it has a different apperance. To follow established UX patterns, it's recommended to use CheckBox when toggling it has __no__ immediate effect on something. For instance, it should be used when toggling it will only do something once a confirmation button is pressed.
newtype CheckBox = CheckBox Object
                     deriving newtype AsVariant

instance HasBaseClass CheckBox where
        type BaseClass CheckBox = Button
        super = coerce

-- | Checkable button. See also @CheckBox@.
--   CheckButton is a toggle button displayed as a check field. It's similar to @CheckBox@ in functionality, but it has a different apperance. To follow established UX patterns, it's recommended to use CheckButton when toggling it has an __immediate__ effect on something. For instance, it should be used if toggling it enables/disables a setting without requiring the user to press a confirmation button.
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

-- | A @Camera@ that includes collision.
--   This node extends @Camera@ to add collisions with @Area@ and/or @PhysicsBody@ nodes. The camera cannot move through colliding objects.
newtype ClippedCamera = ClippedCamera Object
                          deriving newtype AsVariant

instance HasBaseClass ClippedCamera where
        type BaseClass ClippedCamera = Camera
        super = coerce

-- | Base node for collision objects.
--   CollisionObject is the base class for physics objects. It can hold any number of collision @Shape@s. Each shape must be assigned to a @i@shape owner@/i@. The CollisionObject can have any number of shape owners. Shape owners are not nodes and do not appear in the editor, but are accessible through code using the @shape_owner_*@ methods.
newtype CollisionObject = CollisionObject Object
                            deriving newtype AsVariant

instance HasBaseClass CollisionObject where
        type BaseClass CollisionObject = Spatial
        super = coerce

-- | Base node for 2D collision objects.
--   CollisionObject2D is the base class for 2D physics objects. It can hold any number of 2D collision @Shape2D@s. Each shape must be assigned to a @i@shape owner@/i@. The CollisionObject2D can have any number of shape owners. Shape owners are not nodes and do not appear in the editor, but are accessible through code using the @shape_owner_*@ methods.
newtype CollisionObject2D = CollisionObject2D Object
                              deriving newtype AsVariant

instance HasBaseClass CollisionObject2D where
        type BaseClass CollisionObject2D = Node2D
        super = coerce

-- | Editor-only class for defining a collision polygon in 3D space.
--   Allows editing a collision polygon's vertices on a selected plane. Can also set a depth perpendicular to that plane. This class is only available in the editor. It will not appear in the scene tree at run-time. Creates a @Shape@ for gameplay. Properties modified during gameplay will have no effect.
newtype CollisionPolygon = CollisionPolygon Object
                             deriving newtype AsVariant

instance HasBaseClass CollisionPolygon where
        type BaseClass CollisionPolygon = Spatial
        super = coerce

-- | Defines a 2D collision polygon.
--   Provides a 2D collision polygon to a @CollisionObject2D@ parent. Polygons can be drawn in the editor or specified by a list of vertices.
newtype CollisionPolygon2D = CollisionPolygon2D Object
                               deriving newtype AsVariant

instance HasBaseClass CollisionPolygon2D where
        type BaseClass CollisionPolygon2D = Node2D
        super = coerce

-- | Node that represents collision shape data in 3D space.
--   Editor facility for creating and editing collision shapes in 3D space. You can use this node to represent all sorts of collision shapes, for example, add this to an @Area@ to give it a detection shape, or add it to a @PhysicsBody@ to create a solid object. __IMPORTANT__: this is an Editor-only helper to create shapes, use @method CollisionObject.shape_owner_get_shape@ to get the actual shape.
newtype CollisionShape = CollisionShape Object
                           deriving newtype AsVariant

instance HasBaseClass CollisionShape where
        type BaseClass CollisionShape = Spatial
        super = coerce

-- | Node that represents collision shape data in 2D space.
--   Editor facility for creating and editing collision shapes in 2D space. You can use this node to represent all sorts of collision shapes, for example, add this to an @Area2D@ to give it a detection shape, or add it to a @PhysicsBody2D@ to create a solid object. __IMPORTANT__: this is an Editor-only helper to create shapes, use @method CollisionObject2D.shape_owner_get_shape@ to get the actual shape.
newtype CollisionShape2D = CollisionShape2D Object
                             deriving newtype AsVariant

instance HasBaseClass CollisionShape2D where
        type BaseClass CollisionShape2D = Node2D
        super = coerce

-- | Color picker control.
--   @Control@ node displaying a color picker widget. It's useful for selecting a color from an RGB/RGBA colorspace.
newtype ColorPicker = ColorPicker Object
                        deriving newtype AsVariant

instance HasBaseClass ColorPicker where
        type BaseClass ColorPicker = BoxContainer
        super = coerce

-- | Button that pops out a @ColorPicker@.
--   Encapsulates a @ColorPicker@ making it accessible by pressing a button. Pressing the button will toggle the @ColorPicker@ visibility.
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
--   Concave polygon shape resource, which can be set into a @PhysicsBody@ or area. This shape is created by feeding a list of triangles.
--   		Note: when used for collision, @ConcavePolygonShape@ is intended to work with static @PhysicsBody@ nodes like @StaticBody@ and will not work with @KinematicBody@ or @RigidBody@ with a mode other than Static.
newtype ConcavePolygonShape = ConcavePolygonShape Object
                                deriving newtype AsVariant

instance HasBaseClass ConcavePolygonShape where
        type BaseClass ConcavePolygonShape = Shape
        super = coerce

-- | Concave polygon 2D shape resource for physics.
--    It is made out of segments and is optimal for complex polygonal concave collisions. However, it is not advised to use for @RigidBody2D@ nodes. A CollisionPolygon2D in convex decomposition mode (solids) or several convex objects are advised for that instead. Otherwise, a concave polygon 2D shape is better for static collisions.
--   		The main difference between a @ConvexPolygonShape2D@ and a @ConcavePolygonShape2D@ is that a concave polygon assumes it is concave and uses a more complex method of collision detection, and a convex one forces itself to be convex in order to speed up collision detection.
newtype ConcavePolygonShape2D = ConcavePolygonShape2D Object
                                  deriving newtype AsVariant

instance HasBaseClass ConcavePolygonShape2D where
        type BaseClass ConcavePolygonShape2D = Shape2D
        super = coerce

-- | A twist joint between two 3D bodies.
--   The joint can rotate the bodies across an axis defined by the local x-axes of the @Joint@.
--   		The twist axis is initiated as the X axis of the @Joint@.
--   		Once the Bodies swing, the twist axis is calculated as the middle of the x-axes of the Joint in the local space of the two Bodies.
newtype ConeTwistJoint = ConeTwistJoint Object
                           deriving newtype AsVariant

instance HasBaseClass ConeTwistJoint where
        type BaseClass ConeTwistJoint = Joint
        super = coerce

-- | Helper class to handle INI-style files.
--   This helper class can be used to store @Variant@ values on the filesystem using INI-style formatting. The stored values are identified by a section and a key:
--   		
--   @
--   
--   		@section@
--   		some_key=42
--   		string_example="Hello World!"
--   		a_vector=Vector3( 1, 0, 2 )
--   		
--   @
--   
--   		The stored data can be saved to or parsed from a file, though ConfigFile objects can also be used directly without accessing the filesystem.
--   		The following example shows how to parse an INI-style file from the system, read its contents and store new values in it:
--   		
--   @
--   
--   		var config = ConfigFile.new()
--   		var err = config.load("user://settings.cfg")
--   		if err == OK: # If not, something went wrong with the file loading
--   		    # Look for the display/width pair, and default to 1024 if missing
--   		    var screen_width = config.get_value("display", "width", 1024)
--   		    # Store a variable if and only if it hasn't been defined yet
--   		    if not config.has_section_key("audio", "mute"):
--   		        config.set_value("audio", "mute", false)
--   		    # Save the changes by overwriting the previous file
--   		    config.save("user://settings.cfg")
--   		
--   @
--   
--   		Keep in mind that section and property names can't contain spaces. Anything after a space will be ignored on save and on load.
--   		ConfigFiles can also contain manually written comment lines starting with a semicolon (@;@). Those lines will be ignored when parsing the file. Note that comments will be lost when saving the ConfigFile. This can still be useful for dedicated server configuration files, which are typically never overwritten without explicit user action.
newtype ConfigFile = ConfigFile Object
                       deriving newtype AsVariant

instance HasBaseClass ConfigFile where
        type BaseClass ConfigFile = Reference
        super = coerce

-- | Dialog for confirmation of actions.
--    This dialog inherits from @AcceptDialog@, but has by default an OK and Cancel button (in host OS order).
--   		To get cancel action, you can use:
--   		
--   @
--   
--   		get_cancel().connect("pressed", self, "cancelled")
--   		
--   @
--   .
newtype ConfirmationDialog = ConfirmationDialog Object
                               deriving newtype AsVariant

instance HasBaseClass ConfirmationDialog where
        type BaseClass ConfirmationDialog = AcceptDialog
        super = coerce

-- | Base node for containers.
--    A @Container@ contains other controls and automatically arranges them in a certain way.
--   		A Control can inherit this to create custom container classes.
newtype Container = Container Object
                      deriving newtype AsVariant

instance HasBaseClass Container where
        type BaseClass Container = Control
        super = coerce

-- | All user interface nodes inherit from Control. A control's anchors and margins adapt its position and size relative to its parent.
--   Base class for all UI-related nodes. @Control@ features a bounding rectangle that defines its extents, an anchor position relative to its parent control or the current viewport, and margins that represent an offset to the anchor. The margins update automatically when the node, any of its parents, or the screen size change.
--   		For more information on Godot's UI system, anchors, margins, and containers, see the related tutorials in the manual. To build flexible UIs, you'll need a mix of UI elements that inherit from @Control@ and @Container@ nodes.
--   		__User Interface nodes and input__
--   		Godot sends input events to the scene's root node first, by calling @method Node._input@. @method Node._input@ forwards the event down the node tree to the nodes under the mouse cursor, or on keyboard focus. To do so, it calls @method MainLoop._input_event@. Call @method accept_event@ so no other node receives the event. Once you accepted an input, it becomes handled so @method Node._unhandled_input@ will not process it.
--   		Only one @Control@ node can be in keyboard focus. Only the node in focus will receive keyboard events. To get the focus, call @method grab_focus@. @Control@ nodes lose focus when another node grabs it, or if you hide the node in focus.
--   		Sets @mouse_filter@ to @MOUSE_FILTER_IGNORE@ to tell a @Control@ node to ignore mouse or touch events. You'll need it if you place an icon on top of a button.
--   		@Theme@ resources change the Control's appearance. If you change the @Theme@ on a @Control@ node, it affects all of its children. To override some of the theme's parameters, call one of the @add_*_override@ methods, like @method add_font_override@. You can override the theme with the inspector.
--   		__Note:__ Theme items are @i@not@/i@ @Object@ properties. This means you can't access their values using @method Object.get@ and @method Object.set@. Instead, use @method get_color@, @method get_constant@, @method get_font@, @method get_icon@, @method get_stylebox@, and the @add_*_override@ methods provided by this class.
newtype Control = Control Object
                    deriving newtype AsVariant

instance HasBaseClass Control where
        type BaseClass Control = CanvasItem
        super = coerce

-- | Convex polygon shape for 3D physics.
--   Convex polygon shape resource, which can be added to a @PhysicsBody@ or area.
newtype ConvexPolygonShape = ConvexPolygonShape Object
                               deriving newtype AsVariant

instance HasBaseClass ConvexPolygonShape where
        type BaseClass ConvexPolygonShape = Shape
        super = coerce

-- | Convex polygon shape for 2D physics.
--    A convex polygon, whatever its shape, is internally decomposed into as many convex polygons as needed to ensure all collision checks against it are always done on convex polygons (which are faster to check).
--   		The main difference between a @ConvexPolygonShape2D@ and a @ConcavePolygonShape2D@ is that a concave polygon assumes it is concave and uses a more complex method of collision detection, and a convex one forces itself to be convex in order to speed up collision detection.
newtype ConvexPolygonShape2D = ConvexPolygonShape2D Object
                                 deriving newtype AsVariant

instance HasBaseClass ConvexPolygonShape2D where
        type BaseClass ConvexPolygonShape2D = Shape2D
        super = coerce

-- | Access to advanced cryptographic functionalities.
--   The Crypto class allows you to access some more advanced cryptographic functionalities in Godot.
--   		For now, this includes generating cryptographically secure random bytes, and RSA keys and self-signed X509 certificates generation. More functionalities are planned for future releases.
--   		
--   @
--   
--   		extends Node
--   
--   		var crypto = Crypto.new()
--   		var key = CryptoKey.new()
--   		var cert = X509Certificate.new()
--   
--   		func _ready():
--   		    # Generate new RSA key.
--   		    key = crypto.generate_rsa(4096)
--   		    # Generate new self-signed certificate with the given key.
--   		    cert = crypto.generate_self_signed_certificate(key, "CN=mydomain.com,O=My Game Company,C=IT")
--   		    # Save key and certificate in the user folder.
--   		    key.save("user://generated.key")
--   		    cert.save("user://generated.crt")
--   		
--   @
--   
--   		__Note:__ Not available in HTML5 exports.
newtype Crypto = Crypto Object
                   deriving newtype AsVariant

instance HasBaseClass Crypto where
        type BaseClass Crypto = Reference
        super = coerce

-- | A cryptographic key (RSA).
--   The CryptoKey class represents a cryptographic key. Keys can be loaded and saved like any other @Resource@.
--   		They can be used to generate a self-signed @X509Certificate@ via @method Crypto.generate_self_signed_certificate@ and as private key in @method StreamPeerSSL.accept_stream@ along with the appropriate certificate.
--   		__Note:__ Not available in HTML5 exports.
newtype CryptoKey = CryptoKey Object
                      deriving newtype AsVariant

instance HasBaseClass CryptoKey where
        type BaseClass CryptoKey = Resource
        super = coerce

-- | A CubeMap is a 6-sided 3D texture.
--   A 6-sided 3D texture typically used for faking reflections. It can be used to make an object look as if it's reflecting its surroundings. This usually delivers much better performance than other reflection methods.
newtype CubeMap = CubeMap Object
                    deriving newtype AsVariant

instance HasBaseClass CubeMap where
        type BaseClass CubeMap = Resource
        super = coerce

-- | Generate an axis-aligned cuboid @PrimitiveMesh@.
--   
--   		The cube's UV layout is arranged in a 3×2 layout that allows texturing each face individually. To apply the same texture on all faces, change the material's UV property to @Vector3(3, 2, 1)@.
newtype CubeMesh = CubeMesh Object
                     deriving newtype AsVariant

instance HasBaseClass CubeMesh where
        type BaseClass CubeMesh = PrimitiveMesh
        super = coerce

-- | A mathematic curve.
--   A curve that can be saved and re-used for other objects. By default, it ranges between @0@ and @1@ on the Y axis and positions points relative to the @0.5@ Y position.
newtype Curve = Curve Object
                  deriving newtype AsVariant

instance HasBaseClass Curve where
        type BaseClass Curve = Resource
        super = coerce

-- | Describes a Bézier curve in 2D space.
--   This class describes a Bézier curve in 2D space. It is mainly used to give a shape to a @Path2D@, but can be manually sampled for other purposes.
--   		It keeps a cache of precalculated points along the curve, to speed up further calculations.
newtype Curve2D = Curve2D Object
                    deriving newtype AsVariant

instance HasBaseClass Curve2D where
        type BaseClass Curve2D = Resource
        super = coerce

-- | Describes a Bézier curve in 3D space.
--   This class describes a Bézier curve in 3D space. It is mainly used to give a shape to a @Path@, but can be manually sampled for other purposes.
--   		It keeps a cache of precalculated points along the curve, to speed up further calculations.
newtype Curve3D = Curve3D Object
                    deriving newtype AsVariant

instance HasBaseClass Curve3D where
        type BaseClass Curve3D = Resource
        super = coerce

-- | A texture that shows a curve.
--   Renders a given @Curve@ provided to it. Simplifies the task of drawing curves and/or saving them as image files.
newtype CurveTexture = CurveTexture Object
                         deriving newtype AsVariant

instance HasBaseClass CurveTexture where
        type BaseClass CurveTexture = Texture
        super = coerce

-- | Class representing a cylindrical @PrimitiveMesh@.
--    This class can be used to create cones by setting either the @top_radius@ or @bottom_radius@ properties to 0.0.
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
--   A directional light is a type of @Light@ node that models an infinite number of parallel rays covering the entire scene. It is used for lights with strong intensity that are located far away from the scene to model sunlight or moonlight. The worldspace location of the DirectionalLight transform (origin) is ignored. Only the basis is used to determine light direction.
newtype DirectionalLight = DirectionalLight Object
                             deriving newtype AsVariant

instance HasBaseClass DirectionalLight where
        type BaseClass DirectionalLight = Light
        super = coerce

-- | DynamicFont renders vector font files at runtime.
--   DynamicFont renders vector font files (such as TTF or OTF) dynamically at runtime instead of using a prerendered texture atlas like @BitmapFont@. This trades the faster loading time of @BitmapFont@s for the ability to change font parameters like size and spacing during runtime. @DynamicFontData@ is used for referencing the font file paths. DynamicFont also supports defining one or more fallback fonts, which will be used when displaying a character not supported by the main font.
--   		DynamicFont uses the @url=https://www.freetype.org/@FreeType@/url@ library for rasterization.
--   		
--   @
--   
--   		var dynamic_font = DynamicFont.new()
--   		dynamic_font.font_data = load("res://BarlowCondensed-Bold.ttf")
--   		dynamic_font.size = 64
--   		$"Label".set("custom_fonts/font", dynamic_font)
--   		
--   @
--   
--   		__Note:__ DynamicFont doesn't support features such as kerning, right-to-left typesetting, ligatures, text shaping, variable fonts and optional font features yet. If you wish to "bake" an optional font feature into a TTF font file, you can use @url=https://fontforge.org/@FontForge@/url@ to do so. In FontForge, use __File > Generate Fonts__, click __Options__, choose the desired features then generate the font.
newtype DynamicFont = DynamicFont Object
                        deriving newtype AsVariant

instance HasBaseClass DynamicFont where
        type BaseClass DynamicFont = Font
        super = coerce

-- | Used with @DynamicFont@ to describe the location of a font file.
--   Used with @DynamicFont@ to describe the location of a vector font file for dynamic rendering at runtime.
newtype DynamicFontData = DynamicFontData Object
                            deriving newtype AsVariant

instance HasBaseClass DynamicFontData where
        type BaseClass DynamicFontData = Resource
        super = coerce

-- | A script that is executed when exporting projects.
newtype EditorExportPlugin = EditorExportPlugin Object
                               deriving newtype AsVariant

instance HasBaseClass EditorExportPlugin where
        type BaseClass EditorExportPlugin = Reference
        super = coerce

-- | An editor feature profile which can be used to disable specific features.
--   An editor feature profile can be used to disable specific features of the Godot editor. When disabled, the features won't appear in the editor, which makes the editor less cluttered. This is useful in education settings to reduce confusion or when working in a team. For example, artists and level designers could use a feature profile that disables the script editor to avoid accidentally making changes to files they aren't supposed to edit.
--   		To manage editor feature profiles visually, use __Editor > Manage Feature Profiles...__ at the top of the editor window.
newtype EditorFeatureProfile = EditorFeatureProfile Object
                                 deriving newtype AsVariant

instance HasBaseClass EditorFeatureProfile where
        type BaseClass EditorFeatureProfile = Reference
        super = coerce

-- | A modified version of @FileDialog@ used by the editor.
newtype EditorFileDialog = EditorFileDialog Object
                             deriving newtype AsVariant

instance HasBaseClass EditorFileDialog where
        type BaseClass EditorFileDialog = ConfirmationDialog
        super = coerce

-- | Resource filesystem, as the editor sees it.
--   This object holds information of all resources in the filesystem, their types, etc.
--   		__Note:__ This class shouldn't be instantiated directly. Instead, access the singleton using @method EditorInterface.get_resource_filesystem@.
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
--   EditorImportPlugins provide a way to extend the editor's resource import functionality. Use them to import resources from custom files or to provide alternatives to the editor's existing importers. Register your @EditorPlugin@ with @method EditorPlugin.add_import_plugin@.
--   		EditorImportPlugins work by associating with specific file extensions and a resource type. See @method get_recognized_extensions@ and @method get_resource_type@. They may optionally specify some import presets that affect the import process. EditorImportPlugins are responsible for creating the resources and saving them in the @.import@ directory.
--   		Below is an example EditorImportPlugin that imports a @Mesh@ from a file with the extension ".special" or ".spec":
--   		
--   @
--   
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
--   		    return @"special", "spec"@
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
--   		    return @{"name": "my_option", "default_value": false}@
--   
--   		func import(source_file, save_path, options, platform_variants, gen_files):
--   		    var file = File.new()
--   		    if file.open(source_file, File.READ) != OK:
--   		        return FAILED
--   
--   		    var mesh = Mesh.new()
--   		    # Fill the Mesh with data read in "file", left as an exercise to the reader
--   
--   		    var filename = save_path + "." + get_save_extension()
--   		    ResourceSaver.save(filename, mesh)
--   		    return OK
--   		
--   @
newtype EditorImportPlugin = EditorImportPlugin Object
                               deriving newtype AsVariant

instance HasBaseClass EditorImportPlugin where
        type BaseClass EditorImportPlugin = ResourceImporter
        super = coerce

-- | A tab used to edit properties of the selected node.
--   The editor inspector is by default located on the right-hand side of the editor. It's used to edit the properties of the selected node. For example, you can select a node such as @Sprite@ then edit its transform through the inspector tool. The editor inspector is an essential tool in the game development workflow.
--   		__Note:__ This class shouldn't be instantiated directly. Instead, access the singleton using @method EditorInterface.get_inspector@.
newtype EditorInspector = EditorInspector Object
                            deriving newtype AsVariant

instance HasBaseClass EditorInspector where
        type BaseClass EditorInspector = ScrollContainer
        super = coerce

-- | Plugin for adding custom property editors on inspector.
--   This plugins allows adding custom property editors to @EditorInspector@.
--   		Plugins are registered via @method EditorPlugin.add_inspector_plugin@.
--   		When an object is edited, the @method can_handle@ function is called and must return @true@ if the object type is supported.
--   		If supported, the function @method parse_begin@ will be called, allowing to place custom controls at the beginning of the class.
--   		Subsequently, the @method parse_category@ and @method parse_property@ are called for every category and property. They offer the ability to add custom controls to the inspector too.
--   		Finally @method parse_end@ will be called.
--   		On each of these calls, the "add" functions can be called.
newtype EditorInspectorPlugin = EditorInspectorPlugin Object
                                  deriving newtype AsVariant

instance HasBaseClass EditorInspectorPlugin where
        type BaseClass EditorInspectorPlugin = Reference
        super = coerce

-- | Godot editor's interface.
--   EditorInterface gives you control over Godot editor's window. It allows customizing the window, saving and (re-)loading scenes, rendering mesh previews, inspecting and editing resources and objects, and provides access to @EditorSettings@, @EditorFileSystem@, @EditorResourcePreview@, @ScriptEditor@, the editor viewport, and information about scenes.
--   		__Note:__ This class shouldn't be instantiated directly. Instead, access the singleton using @method EditorPlugin.get_editor_interface@.
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
--   Plugins are used by the editor to extend functionality. The most common types of plugins are those which edit a given node or resource type, import plugins and export plugins. See also @EditorScript@ to add functions to the editor.
newtype EditorPlugin = EditorPlugin Object
                         deriving newtype AsVariant

instance HasBaseClass EditorPlugin where
        type BaseClass EditorPlugin = Node
        super = coerce

-- | Custom control to edit properties for adding into the inspector.
--   This control allows property editing for one or multiple properties into @EditorInspector@. It is added via @EditorInspectorPlugin@.
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
--   		__Note:__ This class shouldn't be instantiated directly. Instead, access the singleton using @method EditorInterface.get_resource_previewer@.
newtype EditorResourcePreview = EditorResourcePreview Object
                                  deriving newtype AsVariant

instance HasBaseClass EditorResourcePreview where
        type BaseClass EditorResourcePreview = Node
        super = coerce

-- | Custom generator of previews.
--   Custom code to generate previews. Please check @file_dialog/thumbnail_size@ in @EditorSettings@ to find out the right size to do previews at.
newtype EditorResourcePreviewGenerator = EditorResourcePreviewGenerator Object
                                           deriving newtype AsVariant

instance HasBaseClass EditorResourcePreviewGenerator where
        type BaseClass EditorResourcePreviewGenerator = Reference
        super = coerce

-- | Imports scenes from third-parties' 3D files.
newtype EditorSceneImporter = EditorSceneImporter Object
                                deriving newtype AsVariant

instance HasBaseClass EditorSceneImporter where
        type BaseClass EditorSceneImporter = Reference
        super = coerce

-- | FBX 3D asset importer based on @url=http://assimp.org/@Assimp@/url@.
--   This is an FBX 3D asset importer based on @url=http://assimp.org/@Assimp@/url@. It currently has many known limitations and works best with static meshes. Most animated meshes won't import correctly.
--   		If exporting a FBX scene from Autodesk Maya, use these FBX export settings:
--   		
--   @
--   
--   		- Smoothing Groups
--   		- Smooth Mesh
--   		- Triangluate (for meshes with blend shapes)
--   		- Bake Animation
--   		- Resample All
--   		- Deformed Models
--   		- Skins
--   		- Blend Shapes
--   		- Curve Filters
--   		- Constant Key Reducer
--   		- Auto Tangents Only
--   		- *Do not check* Constraints (as it will break the file)
--   		- Can check Embed Media (embeds textures into the exported FBX file)
--   		  - Note that when importing embedded media, the texture and mesh will be a single immutable file.
--   		  - You will have to re-export then re-import the FBX if the texture has changed.
--   		- Units: Centimeters
--   		- Up Axis: Y
--   		- Binary format in FBX 2017
--   		
--   @
newtype EditorSceneImporterAssimp = EditorSceneImporterAssimp Object
                                      deriving newtype AsVariant

instance HasBaseClass EditorSceneImporterAssimp where
        type BaseClass EditorSceneImporterAssimp = EditorSceneImporter
        super = coerce

-- | Post-processes scenes after import.
--   Imported scenes can be automatically modified right after import by setting their __Custom Script__ Import property to a @tool@ script that inherits from this class.
--   		The @method post_import@ callback receives the imported scene's root node and returns the modified version of the scene. Usage example:
--   		
--   @
--   
--   		tool # Needed so it runs in editor
--   		extends EditorScenePostImport
--   
--   		# This sample changes all node names
--   
--   		# Called right after the scene is imported and gets the root node
--   		func post_import(scene):
--   		    # Change all node names to "modified_@oldnodename@"
--   		    iterate(scene)
--   		    return scene # Remember to return the imported scene
--   
--   		func iterate(node):
--   		    if node != null:
--   		        node.name = "modified_" + node.name
--   		        for child in node.get_children():
--   		            iterate(child)
--   		
--   @
newtype EditorScenePostImport = EditorScenePostImport Object
                                  deriving newtype AsVariant

instance HasBaseClass EditorScenePostImport where
        type BaseClass EditorScenePostImport = Reference
        super = coerce

-- | Base script that can be used to add extension functions to the editor.
--   Scripts extending this class and implementing its @method _run@ method can be executed from the Script Editor's __File > Run__ menu option (or by pressing @Ctrl+Shift+X@) while the editor is running. This is useful for adding custom in-editor functionality to Godot. For more complex additions, consider using @EditorPlugin@s instead.
--   		__Note:__ Extending scripts need to have @tool@ mode enabled.
--   		__Example script:__
--   		
--   @
--   
--   		tool
--   		extends EditorScript
--   
--   		func _run():
--   		    print("Hello from the Godot Editor!")
--   		
--   @
--   
--   		__Note:__ The script is run in the Editor context, which means the output is visible in the console window started with the Editor (stdout) instead of the usual Godot __Output__ dock.
newtype EditorScript = EditorScript Object
                         deriving newtype AsVariant

instance HasBaseClass EditorScript where
        type BaseClass EditorScript = Reference
        super = coerce

-- | Manages the SceneTree selection in the editor.
--   This object manages the SceneTree selection in the editor.
--   		__Note:__ This class shouldn't be instantiated directly. Instead, access the singleton using @method EditorInterface.get_selection@.
newtype EditorSelection = EditorSelection Object
                            deriving newtype AsVariant

instance HasBaseClass EditorSelection where
        type BaseClass EditorSelection = Object
        super = coerce

-- | Object that holds the project-independent editor settings.
--    These settings are generally visible in the __Editor > Editor Settings__ menu.
--   		Property names use slash delimiters to distinguish sections. Setting values can be of any @Variant@ type. It's recommended to use @snake_case@ for editor settings to be consistent with the Godot editor itself.
--   		Accessing the settings can be done using the following methods, such as:
--   		
--   @
--   
--   		# `settings.set("some/property", value)` also works as this class overrides `_set()` internally.
--   		settings.set_setting("some/property",value)
--   
--   		# `settings.get("some/property", value)` also works as this class overrides `_get()` internally.
--   		settings.get_setting("some/property")
--   
--   		var list_of_settings = settings.get_property_list()
--   		
--   @
--   
--   		__Note:__ This class shouldn't be instantiated directly. Instead, access the singleton using @method EditorInterface.get_editor_settings@.
newtype EditorSettings = EditorSettings Object
                           deriving newtype AsVariant

instance HasBaseClass EditorSettings where
        type BaseClass EditorSettings = Resource
        super = coerce

-- | Custom gizmo for editing Spatial objects.
--   Custom gizmo that is used for providing custom visualization and editing (handles) for 3D Spatial objects. See @EditorSpatialGizmoPlugin@ for more information.
newtype EditorSpatialGizmo = EditorSpatialGizmo Object
                               deriving newtype AsVariant

instance HasBaseClass EditorSpatialGizmo where
        type BaseClass EditorSpatialGizmo = SpatialGizmo
        super = coerce

-- | Used by the editor to define Spatial gizmo types.
--   EditorSpatialGizmoPlugin allows you to define a new type of Gizmo. There are two main ways to do so: extending @EditorSpatialGizmoPlugin@ for the simpler gizmos, or creating a new @EditorSpatialGizmo@ type. See the tutorial in the documentation for more info.
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

-- | Version Control System (VCS) interface which reads and writes to the local VCS in use.
--   Used by the editor to display VCS extracted information in the editor. The implementation of this API is included in VCS addons, which are essentially GDNative plugins that need to be put into the project folder. These VCS addons are scripts which are attached (on demand) to the object instance of @EditorVCSInterface@. All the functions listed below, instead of performing the task themselves, they call the internally defined functions in the VCS addons to provide a plug-n-play experience.
newtype EditorVCSInterface = EditorVCSInterface Object
                               deriving newtype AsVariant

instance HasBaseClass EditorVCSInterface where
        type BaseClass EditorVCSInterface = Object
        super = coerce

-- | Holds a reference to an @Object@'s instance ID.
--   Utility class which holds a reference to the internal identifier of an @Object@ instance, as given by @method Object.get_instance_id@. This ID can then be used to retrieve the object instance with @method @GDScript.instance_from_id@.
--   		This class is used internally by the editor inspector and script debugger, but can also be used in plugins to pass and display objects as their IDs.
newtype EncodedObjectAsID = EncodedObjectAsID Object
                              deriving newtype AsVariant

instance HasBaseClass EncodedObjectAsID where
        type BaseClass EncodedObjectAsID = Reference
        super = coerce

-- | Resource for environment nodes (like @WorldEnvironment@) that define multiple rendering options.
--   Resource for environment nodes (like @WorldEnvironment@) that define multiple environment operations (such as background @Sky@ or @Color@, ambient light, fog, depth-of-field...). These parameters affect the final render of the scene. The order of these operations is:
--   		- Depth of Field Blur
--   		- Glow
--   		- Tonemap (Auto Exposure)
--   		- Adjustments
--   		These effects will only apply when the @Viewport@'s intended usage is "3D" or "3D Without Effects". This can be configured for the root Viewport with @ProjectSettings.rendering/quality/intended_usage/framebuffer_allocation@, or for specific Viewports via the @Viewport.usage@ property.
newtype Environment = Environment Object
                        deriving newtype AsVariant

instance HasBaseClass Environment where
        type BaseClass Environment = Resource
        super = coerce

-- | A class that stores an expression you can execute.
--   An expression can be made of any arithmetic operation, built-in math function call, method call of a passed instance, or built-in type construction call.
--   		An example expression text using the built-in math functions could be @sqrt(pow(3,2) + pow(4,2))@.
--   		In the following example we use a @LineEdit@ node to write our expression and show the result.
--   		
--   @
--   
--   		onready var expression = Expression.new()
--   
--   		func _ready():
--   		    $LineEdit.connect("text_entered", self, "_on_text_entered")
--   
--   		func _on_text_entered(command):
--   		    var error = expression.parse(command, @@)
--   		    if error != OK:
--   		        print(expression.get_error_text())
--   		        return
--   		    var result = expression.execute(@@, null, true)
--   		    if not expression.has_execute_failed():
--   		        $LineEdit.text = str(result)
--   		
--   @
newtype Expression = Expression Object
                       deriving newtype AsVariant

instance HasBaseClass Expression where
        type BaseClass Expression = Reference
        super = coerce

-- | Dialog for selecting files or directories in the filesystem.
--   FileDialog is a preset dialog used to choose files and directories in the filesystem. It supports filter masks. The FileDialog automatically sets its window title according to the @mode@. If you want to use a custom title, disable this by setting @mode_overrides_title@ to @false@.
newtype FileDialog = FileDialog Object
                       deriving newtype AsVariant

instance HasBaseClass FileDialog where
        type BaseClass FileDialog = ConfirmationDialog
        super = coerce

-- | Internationalized font and text drawing support.
--   Font contains a Unicode-compatible character set, as well as the ability to draw it with variable width, ascent, descent and kerning. For creating fonts from TTF files (or other font formats), see the editor support for fonts.
--   		__Note:__ If a DynamicFont doesn't contain a character used in a string, the character in question will be replaced with codepoint @0xfffd@ if it's available in the DynamicFont. If this replacement character isn't available in the DynamicFont, the character will be hidden without displaying any replacement character in the string.
--   		__Note:__ If a BitmapFont doesn't contain a character used in a string, the character in question will be hidden without displaying any replacement character in the string.
newtype Font = Font Object
                 deriving newtype AsVariant

instance HasBaseClass Font where
        type BaseClass Font = Resource
        super = coerce

-- | Reference to a function in an object.
--   In GDScript, functions are not @i@first-class objects@/i@. This means it is impossible to store them directly as variables, return them from another function, or pass them as arguments.
--   		However, by creating a @FuncRef@ using the @method @GDScript.funcref@ function, a reference to a function in a given object can be created, passed around and called.
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

-- | Real-time global illumination (GI) probe.
--   @GIProbe@s are used to provide high-quality real-time indirect light to scenes. They precompute the effect of objects that emit light and the effect of static geometry to simulate the behavior of complex light in real-time. @GIProbe@s need to be baked before using, however, once baked, dynamic objects will receive light from them. Further, lights can be fully dynamic or baked.
--   		Having @GIProbe@s in a scene can be expensive, the quality of the probe can be turned down in exchange for better performance in the @ProjectSettings@ using @ProjectSettings.rendering/quality/voxel_cone_tracing/high_quality@.
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

-- | The generic 6-degrees-of-freedom joint can implement a variety of joint types by locking certain axes' rotation or translation.
--   The first 3 DOF axes are linear axes, which represent translation of Bodies, and the latter 3 DOF axes represent the angular motion. Each axis can be either locked, or limited.
newtype Generic6DOFJoint = Generic6DOFJoint Object
                             deriving newtype AsVariant

instance HasBaseClass Generic6DOFJoint where
        type BaseClass Generic6DOFJoint = Joint
        super = coerce

-- | Base node for geometry-based visual instances.
--    Shares some common functionality like visibility and custom materials.
newtype GeometryInstance = GeometryInstance Object
                             deriving newtype AsVariant

instance HasBaseClass GeometryInstance where
        type BaseClass GeometryInstance = VisualInstance
        super = coerce

-- | A color interpolator resource which can be used to generate colors between user-defined color points.
--   Given a set of colors, this resource will interpolate them in order. This means that if you have color 1, color 2 and color 3, the ramp will interpolate from color 1 to color 2 and from color 2 to color 3. The ramp will initially have 2 colors (black and white), one (black) at ramp lower offset 0 and the other (white) at the ramp higher offset 1.
newtype Gradient = Gradient Object
                     deriving newtype AsVariant

instance HasBaseClass Gradient where
        type BaseClass Gradient = Resource
        super = coerce

-- | Gradient-filled texture.
--   GradientTexture uses a @Gradient@ to fill the texture data. The gradient will be filled from left to right using colors obtained from the gradient. This means the texture does not necessarily represent an exact copy of the gradient, but instead an interpolation of samples obtained from the gradient at fixed steps (see @width@).
newtype GradientTexture = GradientTexture Object
                            deriving newtype AsVariant

instance HasBaseClass GradientTexture where
        type BaseClass GradientTexture = Texture
        super = coerce

-- | GraphEdit is an area capable of showing various GraphNodes. It manages connection events between them.
--   GraphEdit manages the showing of GraphNodes it contains, as well as connections and disconnections between them. Signals are sent for each of these two events. Disconnection between GraphNode slots is disabled by default.
--   		It is greatly advised to enable low-processor usage mode (see @OS.low_processor_usage_mode@) when using GraphEdits.
newtype GraphEdit = GraphEdit Object
                      deriving newtype AsVariant

instance HasBaseClass GraphEdit where
        type BaseClass GraphEdit = Control
        super = coerce

-- | A GraphNode is a container with potentially several input and output slots allowing connections between GraphNodes. Slots can have different, incompatible types.
--   A GraphNode is a container. Each GraphNode can have several input and output slots, sometimes referred to as ports, allowing connections between GraphNodes. To add a slot to GraphNode, add any @Control@-derived child node to it.
--   		After adding at least one child to GraphNode new sections will be automatically created in the Inspector called 'Slot'. When 'Slot' is expanded you will see list with index number for each slot. You can click on each of them to expand further.
--   		In the Inspector you can enable (show) or disable (hide) slots. By default all slots are disabled so you may not see any slots on your GraphNode initially. You can assign a type to each slot. Only slots of the same type will be able to connect to each other. You can also assign colors to slots. A tuple of input and output slots is defined for each GUI element included in the GraphNode. Input connections are on the left and output connections are on the right side of GraphNode. Only enabled slots are counted as connections.
newtype GraphNode = GraphNode Object
                      deriving newtype AsVariant

instance HasBaseClass GraphNode where
        type BaseClass GraphNode = Container
        super = coerce

-- | Grid container used to arrange Control-derived children in a grid like layout.
--   GridContainer will arrange its Control-derived children in a grid like structure, the grid columns are specified using the @columns@ property and the number of rows will be equal to the number of children in the container divided by the number of columns. For example, if the container has 5 children, and 2 columns, there will be 3 rows in the container.
--   		Notice that grid layout will preserve the columns and rows for every size of the container, and that empty columns will be expanded automatically.
--   		__Note:__ GridContainer only works with child nodes inheriting from Control. It won't rearrange child nodes inheriting from Node2D.
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
--    See @BoxContainer@.
newtype HBoxContainer = HBoxContainer Object
                          deriving newtype AsVariant

instance HasBaseClass HBoxContainer where
        type BaseClass HBoxContainer = BoxContainer
        super = coerce

-- | Horizontal scroll bar.
--   Horizontal version of @ScrollBar@, which goes from left (min) to right (max).
newtype HScrollBar = HScrollBar Object
                       deriving newtype AsVariant

instance HasBaseClass HScrollBar where
        type BaseClass HScrollBar = ScrollBar
        super = coerce

-- | Horizontal separator.
--    See @Separator@. Even though it looks horizontal, it is used to separate objects vertically.
newtype HSeparator = HSeparator Object
                       deriving newtype AsVariant

instance HasBaseClass HSeparator where
        type BaseClass HSeparator = Separator
        super = coerce

-- | Horizontal slider.
--    See @Slider@. This one goes from left (min) to right (max).
--   		__Note:__ The @signal Range.changed@ and @signal Range.value_changed@ signals are part of the @Range@ class which this class inherits from.
newtype HSlider = HSlider Object
                    deriving newtype AsVariant

instance HasBaseClass HSlider where
        type BaseClass HSlider = Slider
        super = coerce

-- | Horizontal split container.
--    See @SplitContainer@. This goes from left to right.
newtype HSplitContainer = HSplitContainer Object
                            deriving newtype AsVariant

instance HasBaseClass HSplitContainer where
        type BaseClass HSplitContainer = SplitContainer
        super = coerce

-- | Low-level hyper-text transfer protocol client.
--   Hyper-text transfer protocol client (sometimes called "User Agent"). Used to make HTTP requests to download web content, upload files and other data or to communicate with various services, among other use cases. __See the @HTTPRequest@ node for an higher-level alternative.__
--   		__Note:__ This client only needs to connect to a host once (see @method connect_to_host@) to send multiple requests. Because of this, methods that take URLs usually take just the part after the host instead of the full URL, as the client is already connected to a host. See @method request@ for a full example and to get started.
--   		A @HTTPClient@ should be reused between multiple requests or to connect to different hosts instead of creating one client per request. Supports SSL and SSL server certificate verification. HTTP status codes in the 2xx range indicate success, 3xx redirection (i.e. "try again, but over here"), 4xx something was wrong with the request, and 5xx something went wrong on the server's side.
--   		For more information on HTTP, see https://developer.mozilla.org/en-US/docs/Web/HTTP (or read RFC 2616 to get it straight from the source: https://tools.ietf.org/html/rfc2616).
--   		__Note:__ When performing HTTP requests from a project exported to HTML5, keep in mind the remote server may not allow requests from foreign origins due to @url=https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS@CORS@/url@. If you host the server in question, you should modify its backend to allow requests from foreign origins by adding the @Access-Control-Allow-Origin: *@ HTTP header.
newtype HTTPClient = HTTPClient Object
                       deriving newtype AsVariant

instance HasBaseClass HTTPClient where
        type BaseClass HTTPClient = Reference
        super = coerce

-- | A node with the ability to send HTTP(S) requests.
--   A node with the ability to send HTTP requests. Uses @HTTPClient@ internally.
--   		Can be used to make HTTP requests, i.e. download or upload files or web content via HTTP.
--   		__Example of contacting a REST API and printing one of its returned fields:__
--   		
--   @
--   
--   		func _ready():
--   		    # Create an HTTP request node and connect its completion signal.
--   		    var http_request = HTTPRequest.new()
--   		    add_child(http_request)
--   		    http_request.connect("request_completed", self, "_http_request_completed")
--   
--   		    # Perform a GET request. The URL below returns JSON as of writing.
--   		    var error = http_request.request("https://httpbin.org/get")
--   		    if error != OK:
--   		        push_error("An error occurred in the HTTP request.")
--   
--   		    # Perform a POST request. The URL below returns JSON as of writing.
--   		    # Note: Don't make simultaneous requests using a single HTTPRequest node.
--   		    # The snippet below is provided for reference only.
--   		    var body = {"name": "Godette"}
--   		    var error = http_request.request("https://httpbin.org/post", @@, true, HTTPClient.METHOD_POST, body)
--   		    if error != OK:
--   		        push_error("An error occurred in the HTTP request.")
--   
--   
--   		# Called when the HTTP request is completed.
--   		func _http_request_completed(result, response_code, headers, body):
--   		    var response = parse_json(body.get_string_from_utf8())
--   
--   		    # Will print the user agent string used by the HTTPRequest node (as recognized by httpbin.org).
--   		    print(response.headers@"User-Agent"@)
--   		
--   @
--   
--   		__Example of loading and displaying an image using HTTPRequest:__
--   		
--   @
--   
--   		func _ready():
--   		    # Create an HTTP request node and connect its completion signal.
--   		    var http_request = HTTPRequest.new()
--   		    add_child(http_request)
--   		    http_request.connect("request_completed", self, "_http_request_completed")
--   
--   		    # Perform the HTTP request. The URL below returns a PNG image as of writing.
--   		    var error = http_request.request("https://via.placeholder.com/512")
--   		    if error != OK:
--   		        push_error("An error occurred in the HTTP request.")
--   
--   
--   		# Called when the HTTP request is completed.
--   		func _http_request_completed(result, response_code, headers, body):
--   		    var image = Image.new()
--   		    var error = image.load_png_from_buffer(body)
--   		    if error != OK:
--   		        push_error("Couldn't load the image.")
--   
--   		    var texture = ImageTexture.new()
--   		    texture.create_from_image(image)
--   
--   		    # Display the image in a TextureRect node.
--   		    var texture_rect = TextureRect.new()
--   		    add_child(texture_rect)
--   		    texture_rect.texture = texture
--   		
--   @
--   
--   		__Note:__ When performing HTTP requests from a project exported to HTML5, keep in mind the remote server may not allow requests from foreign origins due to @url=https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS@CORS@/url@. If you host the server in question, you should modify its backend to allow requests from foreign origins by adding the @Access-Control-Allow-Origin: *@ HTTP header.
newtype HTTPRequest = HTTPRequest Object
                        deriving newtype AsVariant

instance HasBaseClass HTTPRequest where
        type BaseClass HTTPRequest = Node
        super = coerce

-- | Context to compute cryptographic hashes over multiple iterations.
--   The HashingContext class provides an interface for computing cryptographic hashes over multiple iterations. This is useful for example when computing hashes of big files (so you don't have to load them all in memory), network streams, and data streams in general (so you don't have to hold buffers).
--   		The @enum HashType@ enum shows the supported hashing algorithms.
--   		
--   @
--   
--   		const CHUNK_SIZE = 1024
--   
--   		func hash_file(path):
--   		    var ctx = HashingContext.new()
--   		    var file = File.new()
--   		    # Start a SHA-256 context.
--   		    ctx.start(HashingContext.HASH_SHA256)
--   		    # Check that file exists.
--   		    if not file.file_exists(path):
--   		        return
--   		    # Open the file to hash.
--   		    file.open(path, File.READ)
--   		    # Update the context after reading each chunk.
--   		    while not file.eof_reached():
--   		        ctx.update(file.get_buffer(CHUNK_SIZE))
--   		    # Get the computed hash.
--   		    var res = ctx.finish()
--   		    # Print the result as hex string and array.
--   		    printt(res.hex_encode(), Array(res))
--   		
--   @
--   
--   		__Note:__ Not available in HTML5 exports.
newtype HashingContext = HashingContext Object
                           deriving newtype AsVariant

instance HasBaseClass HashingContext where
        type BaseClass HashingContext = Reference
        super = coerce

-- | Height map shape for 3D physics (Bullet only).
--   Height map shape resource, which can be added to a @PhysicsBody@ or @Area@.
newtype HeightMapShape = HeightMapShape Object
                           deriving newtype AsVariant

instance HasBaseClass HeightMapShape where
        type BaseClass HeightMapShape = Shape
        super = coerce

-- | A hinge between two 3D bodies.
--   A HingeJoint normally uses the Z axis of body A as the hinge axis, another axis can be specified when adding it manually though.
newtype HingeJoint = HingeJoint Object
                       deriving newtype AsVariant

instance HasBaseClass HingeJoint where
        type BaseClass HingeJoint = Joint
        super = coerce

-- | Internet protocol (IP) support functions such as DNS resolution.
--   IP contains support functions for the Internet Protocol (IP). TCP/IP support is in different classes (see @StreamPeerTCP@ and @TCP_Server@). IP provides DNS hostname resolution support, both blocking and threaded.
newtype IP = IP Object
               deriving newtype AsVariant

instance HasBaseClass IP where
        type BaseClass IP = Object
        super = coerce

newtype IP_Unix = IP_Unix Object
                    deriving newtype AsVariant

instance HasBaseClass IP_Unix where
        type BaseClass IP_Unix = IP
        super = coerce

-- | Image datatype.
--   Native image datatype. Contains image data, which can be converted to a @Texture@, and several functions to interact with it. The maximum width and height for an @Image@ are @MAX_WIDTH@ and @MAX_HEIGHT@.
--   		__Note:__ The maximum image size is 16384×16384 pixels due to graphics hardware limitations. Larger images will fail to import.
newtype Image = Image Object
                  deriving newtype AsVariant

instance HasBaseClass Image where
        type BaseClass Image = Resource
        super = coerce

-- | A @Texture@ based on an @Image@.
--    Can be created from an @Image@ with @method create_from_image@.
--   		__Note:__ The maximum image size is 16384×16384 pixels due to graphics hardware limitations. Larger images will fail to import.
newtype ImageTexture = ImageTexture Object
                         deriving newtype AsVariant

instance HasBaseClass ImageTexture where
        type BaseClass ImageTexture = Texture
        super = coerce

-- | Draws simple geometry from code.
--    Uses a drawing mode similar to OpenGL 1.x.
--   		See also @ArrayMesh@, @MeshDataTool@ and @SurfaceTool@ for procedural geometry generation.
--   		__Note:__ ImmediateGeometry3D is best suited to small amounts of mesh data that change every frame. It will be slow when handling large amounts of mesh data. If mesh data doesn't change often, use @ArrayMesh@, @MeshDataTool@ or @SurfaceTool@ instead.
--   		__Note:__ Godot uses clockwise @url=https://learnopengl.com/Advanced-OpenGL/Face-culling@winding order@/url@ for front faces of triangle primitive modes.
newtype ImmediateGeometry = ImmediateGeometry Object
                              deriving newtype AsVariant

instance HasBaseClass ImmediateGeometry where
        type BaseClass ImmediateGeometry = GeometryInstance
        super = coerce

-- | A singleton that deals with inputs.
--    This includes key presses, mouse buttons and movement, joypads, and input actions. Actions and their events can be set in the __Input Map__ tab in the __Project > Project Settings__, or with the @InputMap@ class.
newtype Input = Input Object
                  deriving newtype AsVariant

instance HasBaseClass Input where
        type BaseClass Input = Object
        super = coerce

newtype InputDefault = InputDefault Object
                         deriving newtype AsVariant

instance HasBaseClass InputDefault where
        type BaseClass InputDefault = Input
        super = coerce

-- | Generic input event.
--   Base class of all sort of input event. See @method Node._input@.
newtype InputEvent = InputEvent Object
                       deriving newtype AsVariant

instance HasBaseClass InputEvent where
        type BaseClass InputEvent = Resource
        super = coerce

-- | Input event type for actions.
--   Contains a generic action which can be targeted from several types of inputs. Actions can be created from the __Input Map__ tab in the __Project > Project Settings__ menu. See @method Node._input@.
newtype InputEventAction = InputEventAction Object
                             deriving newtype AsVariant

instance HasBaseClass InputEventAction where
        type BaseClass InputEventAction = InputEvent
        super = coerce

-- | Base class for touch control gestures.
newtype InputEventGesture = InputEventGesture Object
                              deriving newtype AsVariant

instance HasBaseClass InputEventGesture where
        type BaseClass InputEventGesture = InputEventWithModifiers
        super = coerce

-- | Input event for gamepad buttons.
--   Input event type for gamepad buttons. For gamepad analog sticks and joysticks, see @InputEventJoypadMotion@.
newtype InputEventJoypadButton = InputEventJoypadButton Object
                                   deriving newtype AsVariant

instance HasBaseClass InputEventJoypadButton where
        type BaseClass InputEventJoypadButton = InputEvent
        super = coerce

-- | Input event type for gamepad joysticks and other motions. For buttons, see @InputEventJoypadButton@.
--   Stores information about joystick motions. One @InputEventJoypadMotion@ represents one axis at a time.
newtype InputEventJoypadMotion = InputEventJoypadMotion Object
                                   deriving newtype AsVariant

instance HasBaseClass InputEventJoypadMotion where
        type BaseClass InputEventJoypadMotion = InputEvent
        super = coerce

-- | Input event type for keyboard events.
--   Stores key presses on the keyboard. Supports key presses, key releases and @echo@ events.
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
--   Contains mouse click information. See @method Node._input@.
newtype InputEventMouseButton = InputEventMouseButton Object
                                  deriving newtype AsVariant

instance HasBaseClass InputEventMouseButton where
        type BaseClass InputEventMouseButton = InputEventMouse
        super = coerce

-- | Input event type for mouse motion events.
--   Contains mouse and pen motion information. Supports relative, absolute positions and speed. See @method Node._input@.
--   		__Note:__ By default, this event is only emitted once per frame rendered at most. If you need more precise input reporting, call @method Input.set_use_accumulated_input@ with @false@ to make events emitted as often as possible. If you use InputEventMouseMotion to draw lines, consider implementing @url=https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm@Bresenham's line algorithm@/url@ as well to avoid visible gaps in lines if the user is moving the mouse quickly.
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

-- | Input event type for screen drag events. Only available on mobile devices.
--   Contains screen drag information. See @method Node._input@.
newtype InputEventScreenDrag = InputEventScreenDrag Object
                                 deriving newtype AsVariant

instance HasBaseClass InputEventScreenDrag where
        type BaseClass InputEventScreenDrag = InputEvent
        super = coerce

-- | Input event type for screen touch events.
--   		(only available on mobile devices)
--   Stores multi-touch press/release information. Supports touch press, touch release and @index@ for multi-touch count and order.
newtype InputEventScreenTouch = InputEventScreenTouch Object
                                  deriving newtype AsVariant

instance HasBaseClass InputEventScreenTouch where
        type BaseClass InputEventScreenTouch = InputEvent
        super = coerce

-- | Base class for keys events with modifiers.
--   Contains keys events information with modifiers support like @Shift@ or @Alt@. See @method Node._input@.
newtype InputEventWithModifiers = InputEventWithModifiers Object
                                    deriving newtype AsVariant

instance HasBaseClass InputEventWithModifiers where
        type BaseClass InputEventWithModifiers = InputEvent
        super = coerce

-- | Singleton that manages @InputEventAction@.
--   Manages all @InputEventAction@ which can be created/modified from the project settings menu __Project > Project Settings > Input Map__ or in code with @method add_action@ and @method action_add_event@. See @method Node._input@.
newtype InputMap = InputMap Object
                     deriving newtype AsVariant

instance HasBaseClass InputMap where
        type BaseClass InputMap = Object
        super = coerce

-- | Placeholder for the root @Node@ of a @PackedScene@.
--   Turning on the option __Load As Placeholder__ for an instanced scene in the editor causes it to be replaced by an InstancePlaceholder when running the game. This makes it possible to delay actually loading the scene until calling @method replace_by_instance@. This is useful to avoid loading large scenes all at once by loading parts of it selectively.
--   		The InstancePlaceholder does not have a transform. This causes any child nodes to be positioned relatively to the Viewport from point (0,0), rather than their parent as displayed in the editor. Replacing the placeholder with a scene with a transform will transform children relatively to their parent again.
newtype InstancePlaceholder = InstancePlaceholder Object
                                deriving newtype AsVariant

instance HasBaseClass InstancePlaceholder where
        type BaseClass InstancePlaceholder = Node
        super = coerce

-- | @i@Deprecated.@/i@ Camera which moves toward another node.
--   @i@Deprecated (will be removed in Godot 4.0).@/i@ InterpolatedCamera is a @Camera@ which smoothly moves to match a target node's position and rotation.
--   		If it is not @enabled@ or does not have a valid target set, InterpolatedCamera acts like a normal Camera.
newtype InterpolatedCamera = InterpolatedCamera Object
                               deriving newtype AsVariant

instance HasBaseClass InterpolatedCamera where
        type BaseClass InterpolatedCamera = Camera
        super = coerce

-- | Control that provides a list of selectable items (and/or icons) in a single column, or optionally in multiple columns.
--   This control provides a selectable list of items that may be in a single (or multiple columns) with option of text, icons, or both text and icon. Tooltips are supported and may be different for every item in the list.
--   		Selectable items in the list may be selected or deselected and multiple selection may be enabled. Selection with right mouse button may also be enabled to allow use of popup context menus. Items may also be "activated" by double-clicking them or by pressing Enter.
--   		Item text only supports single-line strings, newline characters (e.g. @\n@) in the string won't produce a newline. Text wrapping is enabled in @ICON_MODE_TOP@ mode, but column's width is adjusted to fully fit its content by default. You need to set @fixed_column_width@ greater than zero to wrap the text.
newtype ItemList = ItemList Object
                     deriving newtype AsVariant

instance HasBaseClass ItemList where
        type BaseClass ItemList = Control
        super = coerce

-- | Data class wrapper for decoded JSON.
--   Returned by @method JSON.parse@, @JSONParseResult@ contains the decoded JSON or error information if the JSON source wasn't successfully parsed. You can check if the JSON source was successfully parsed with @if json_result.error == OK@.
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
--   The JavaScript singleton is implemented only in the HTML5 export. It's used to access the browser's JavaScript context. This allows interaction with embedding pages or calling third-party JavaScript APIs.
newtype JavaScript = JavaScript Object
                       deriving newtype AsVariant

instance HasBaseClass JavaScript where
        type BaseClass JavaScript = Object
        super = coerce

-- | Base class for all 3D joints.
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
--   		__Simulated motion:__ When these bodies are moved manually, either from code or from an @AnimationPlayer@ (with @AnimationPlayer.playback_process_mode@ set to "physics"), the physics will automatically compute an estimate of their linear and angular velocity. This makes them very useful for moving platforms or other AnimationPlayer-controlled objects (like a door, a bridge that opens, etc).
--   		__Kinematic characters:__ KinematicBody also has an API for moving objects (the @method move_and_collide@ and @method move_and_slide@ methods) while performing collision tests. This makes them really useful to implement characters that collide against a world, but that don't require advanced physics.
newtype KinematicBody = KinematicBody Object
                          deriving newtype AsVariant

instance HasBaseClass KinematicBody where
        type BaseClass KinematicBody = PhysicsBody
        super = coerce

-- | Kinematic body 2D node.
--   Kinematic bodies are special types of bodies that are meant to be user-controlled. They are not affected by physics at all; to other types of bodies, such as a character or a rigid body, these are the same as a static body. However, they have two main uses:
--   		__Simulated motion:__ When these bodies are moved manually, either from code or from an @AnimationPlayer@ (with @AnimationPlayer.playback_process_mode@ set to "physics"), the physics will automatically compute an estimate of their linear and angular velocity. This makes them very useful for moving platforms or other AnimationPlayer-controlled objects (like a door, a bridge that opens, etc).
--   		__Kinematic characters:__ KinematicBody2D also has an API for moving objects (the @method move_and_collide@ and @method move_and_slide@ methods) while performing collision tests. This makes them really useful to implement characters that collide against a world, but that don't require advanced physics.
newtype KinematicBody2D = KinematicBody2D Object
                            deriving newtype AsVariant

instance HasBaseClass KinematicBody2D where
        type BaseClass KinematicBody2D = PhysicsBody2D
        super = coerce

-- | Collision data for @KinematicBody@ collisions.
--   Contains collision data for @KinematicBody@ collisions. When a @KinematicBody@ is moved using @method KinematicBody.move_and_collide@, it stops if it detects a collision with another body. If a collision is detected, a KinematicCollision object is returned.
--   		This object contains information about the collision, including the colliding object, the remaining motion, and the collision position. This information can be used to calculate a collision response.
newtype KinematicCollision = KinematicCollision Object
                               deriving newtype AsVariant

instance HasBaseClass KinematicCollision where
        type BaseClass KinematicCollision = Reference
        super = coerce

-- | Collision data for @KinematicBody2D@ collisions.
--   Contains collision data for @KinematicBody2D@ collisions. When a @KinematicBody2D@ is moved using @method KinematicBody2D.move_and_collide@, it stops if it detects a collision with another body. If a collision is detected, a KinematicCollision2D object is returned.
--   		This object contains information about the collision, including the colliding object, the remaining motion, and the collision position. This information can be used to calculate a collision response.
newtype KinematicCollision2D = KinematicCollision2D Object
                                 deriving newtype AsVariant

instance HasBaseClass KinematicCollision2D where
        type BaseClass KinematicCollision2D = Reference
        super = coerce

-- | Displays plain text in a line or wrapped inside a rectangle. For formatted text, use @RichTextLabel@.
--   Label displays plain text on the screen. It gives you control over the horizontal and vertical alignment, and can wrap the text inside the node's bounding rectangle. It doesn't support bold, italics or other formatting. For that, use @RichTextLabel@ instead.
--   		__Note:__ Contrarily to most other @Control@s, Label's @Control.mouse_filter@ defaults to @Control.MOUSE_FILTER_IGNORE@ (i.e. it doesn't react to mouse input events). This implies that a label won't display any configured @Control.hint_tooltip@, unless you change its mouse filter.
newtype Label = Label Object
                  deriving newtype AsVariant

instance HasBaseClass Label where
        type BaseClass Label = Control
        super = coerce

-- | A @Texture@ capable of storing many smaller textures with offsets.
--   
--   		You can dynamically add pieces (@Texture@s) to this @LargeTexture@ using different offsets.
newtype LargeTexture = LargeTexture Object
                         deriving newtype AsVariant

instance HasBaseClass LargeTexture where
        type BaseClass LargeTexture = Texture
        super = coerce

-- | Provides a base class for different kinds of light nodes.
--   Light is the @i@abstract@/i@ base class for light nodes. As it can't be instanced, it shouldn't be used directly. Other types of light nodes inherit from it. Light contains the common variables and parameters used for lighting.
newtype Light = Light Object
                  deriving newtype AsVariant

instance HasBaseClass Light where
        type BaseClass Light = VisualInstance
        super = coerce

-- | Casts light in a 2D environment.
--    Light is defined by a (usually grayscale) texture, a color, an energy value, a mode (see constants), and various other parameters (range and shadows-related).
--   		__Note:__ Light2D can also be used as a mask.
newtype Light2D = Light2D Object
                    deriving newtype AsVariant

instance HasBaseClass Light2D where
        type BaseClass Light2D = Node2D
        super = coerce

-- | Occludes light cast by a Light2D, casting shadows.
--    The LightOccluder2D must be provided with an @OccluderPolygon2D@ in order for the shadow to be computed.
newtype LightOccluder2D = LightOccluder2D Object
                            deriving newtype AsVariant

instance HasBaseClass LightOccluder2D where
        type BaseClass LightOccluder2D = Node2D
        super = coerce

-- | A 2D line.
--   A line through several points in 2D space.
--   		__Note:__ By default, Godot can only draw up to 4,096 polygon points at a time. To increase this limit, open the Project Settings and increase @ProjectSettings.rendering/limits/buffers/canvas_polygon_buffer_size_kb@ and @ProjectSettings.rendering/limits/buffers/canvas_polygon_index_buffer_size_kb@.
newtype Line2D = Line2D Object
                   deriving newtype AsVariant

instance HasBaseClass Line2D where
        type BaseClass Line2D = Node2D
        super = coerce

-- | Control that provides single-line string editing.
--   LineEdit provides a single-line string editor, used for text fields.
--   		It features many built-in shortcuts which will always be available (@Ctrl@ here maps to @Command@ on macOS):
--   		- Ctrl + C: Copy
--   		- Ctrl + X: Cut
--   		- Ctrl + V or Ctrl + Y: Paste/"yank"
--   		- Ctrl + Z: Undo
--   		- Ctrl + Shift + Z: Redo
--   		- Ctrl + U: Delete text from the cursor position to the beginning of the line
--   		- Ctrl + K: Delete text from the cursor position to the end of the line
--   		- Ctrl + A: Select all text
--   		- Up/Down arrow: Move the cursor to the beginning/end of the line
--   		On macOS, some extra keyboard shortcuts are available:
--   		- Ctrl + F: Like the right arrow key, move the cursor one character right
--   		- Ctrl + B: Like the left arrow key, move the cursor one character left
--   		- Ctrl + P: Like the up arrow key, move the cursor to the previous line
--   		- Ctrl + N: Like the down arrow key, move the cursor to the next line
--   		- Ctrl + D: Like the Delete key, delete the character on the right side of cursor
--   		- Ctrl + H: Like the Backspace key, delete the character on the left side of the cursor
--   		- Command + Left arrow: Like the Home key, move the cursor to the beginning of the line
--   		- Command + Right arrow: Like the End key, move the cursor to the end of the line
newtype LineEdit = LineEdit Object
                     deriving newtype AsVariant

instance HasBaseClass LineEdit where
        type BaseClass LineEdit = Control
        super = coerce

-- | Line shape for 2D collisions.
--    It works like a 2D plane and will not allow any physics body to go to the negative side. Not recommended for rigid bodies, and usually not recommended for static bodies either because it forces checks against it on every frame.
newtype LineShape2D = LineShape2D Object
                        deriving newtype AsVariant

instance HasBaseClass LineShape2D where
        type BaseClass LineShape2D = Shape2D
        super = coerce

-- | Simple button used to represent a link to some resource.
--   This kind of button is primarily used when the interaction with the button causes a context change (like linking to a web page).
newtype LinkButton = LinkButton Object
                       deriving newtype AsVariant

instance HasBaseClass LinkButton where
        type BaseClass LinkButton = BaseButton
        super = coerce

-- | Overrides the location sounds are heard from.
--   Once added to the scene tree and enabled using @method make_current@, this node will override the location sounds are heard from. This can be used to listen from a location different from the @Camera@.
--   		__Note:__ There is no 2D equivalent for this node yet.
newtype Listener = Listener Object
                     deriving newtype AsVariant

instance HasBaseClass Listener where
        type BaseClass Listener = Spatial
        super = coerce

-- | Abstract base class for the game's main loop.
--   @MainLoop@ is the abstract base class for a Godot project's game loop. It is inherited by @SceneTree@, which is the default game loop implementation used in Godot projects, though it is also possible to write and use one's own @MainLoop@ subclass instead of the scene tree.
--   		Upon the application start, a @MainLoop@ implementation must be provided to the OS; otherwise, the application will exit. This happens automatically (and a @SceneTree@ is created) unless a main @Script@ is provided from the command line (with e.g. @godot -s my_loop.gd@, which should then be a @MainLoop@ implementation.
--   		Here is an example script implementing a simple @MainLoop@:
--   		
--   @
--   
--   		extends MainLoop
--   
--   		var time_elapsed = 0
--   		var keys_typed = @@
--   		var quit = false
--   
--   		func _initialize():
--   		    print("Initialized:")
--   		    print("  Starting time: %s" % str(time_elapsed))
--   
--   		func _idle(delta):
--   		    time_elapsed += delta
--   		    # Return true to end the main loop.
--   		    return quit
--   
--   		func _input_event(event):
--   		    # Record keys.
--   		    if event is InputEventKey and event.pressed and !event.echo:
--   		        keys_typed.append(OS.get_scancode_string(event.scancode))
--   		        # Quit on Escape press.
--   		        if event.scancode == KEY_ESCAPE:
--   		            quit = true
--   		    # Quit on any mouse click.
--   		    if event is InputEventMouseButton:
--   		        quit = true
--   
--   		func _finalize():
--   		    print("Finalized:")
--   		    print("  End time: %s" % str(time_elapsed))
--   		    print("  Keys typed: %s" % var2str(keys_typed))
--   		
--   @
newtype MainLoop = MainLoop Object
                     deriving newtype AsVariant

instance HasBaseClass MainLoop where
        type BaseClass MainLoop = Object
        super = coerce

-- | Simple margin container.
--   Adds a top, left, bottom, and right margin to all @Control@ nodes that are direct children of the container. To control the @MarginContainer@'s margin, use the @margin_*@ theme properties listed below.
--   		__Note:__ Be careful, @Control@ margin values are different than the constant margin values. If you want to change the custom margin values of the @MarginContainer@ by code, you should use the following examples:
--   		
--   @
--   
--   		var margin_value = 100
--   		set("custom_constants/margin_top", margin_value)
--   		set("custom_constants/margin_left", margin_value)
--   		set("custom_constants/margin_bottom", margin_value)
--   		set("custom_constants/margin_right", margin_value)
--   		
--   @
newtype MarginContainer = MarginContainer Object
                            deriving newtype AsVariant

instance HasBaseClass MarginContainer where
        type BaseClass MarginContainer = Container
        super = coerce

-- | Abstract base @Resource@ for coloring and shading geometry.
--   Material is a base @Resource@ used for coloring and shading geometry. All materials inherit from it and almost all @VisualInstance@ derived nodes carry a Material. A few flags and parameters are shared between all material types and are configured here.
newtype Material = Material Object
                     deriving newtype AsVariant

instance HasBaseClass Material where
        type BaseClass Material = Resource
        super = coerce

-- | Special button that brings up a @PopupMenu@ when clicked.
--   
--   		New items can be created inside this @PopupMenu@ using @get_popup().add_item("My Item Name")@. You can also create them directly from the editor. To do so, select the @MenuButton@ node, then in the toolbar at the top of the 2D editor, click __Items__ then click __Add__ in the popup. You will be able to give each items new properties.
newtype MenuButton = MenuButton Object
                       deriving newtype AsVariant

instance HasBaseClass MenuButton where
        type BaseClass MenuButton = Button
        super = coerce

-- | A @Resource@ that contains vertex array-based geometry.
--   Mesh is a type of @Resource@ that contains vertex array-based geometry, divided in @i@surfaces@/i@. Each surface contains a completely separate array and a material used to draw it. Design wise, a mesh with multiple surfaces is preferred to a single surface, because objects created in 3D editing software commonly contain multiple materials.
newtype Mesh = Mesh Object
                 deriving newtype AsVariant

instance HasBaseClass Mesh where
        type BaseClass Mesh = Resource
        super = coerce

-- | Helper tool to access and edit @Mesh@ data.
--   MeshDataTool provides access to individual vertices in a @Mesh@. It allows users to read and edit vertex data of meshes. It also creates an array of faces and edges.
--   		To use MeshDataTool, load a mesh with @method create_from_surface@. When you are finished editing the data commit the data to a mesh with @method commit_to_surface@.
--   		Below is an example of how MeshDataTool may be used.
--   		
--   @
--   
--   		var mdt = MeshDataTool.new()
--   		mdt.create_from_surface(mesh, 0)
--   		for i in range(mdt.get_vertex_count()):
--   		    var vertex = mdt.get_vertex(i)
--   		    ...
--   		    mdt.set_vertex(i, vertex)
--   		mesh.surface_remove(0)
--   		mdt.commit_to_surface(mesh)
--   		
--   @
--   
--   		See also @ArrayMesh@, @ImmediateGeometry@ and @SurfaceTool@ for procedural geometry generation.
--   		__Note:__ Godot uses clockwise @url=https://learnopengl.com/Advanced-OpenGL/Face-culling@winding order@/url@ for front faces of triangle primitive modes.
newtype MeshDataTool = MeshDataTool Object
                         deriving newtype AsVariant

instance HasBaseClass MeshDataTool where
        type BaseClass MeshDataTool = Reference
        super = coerce

-- | Node that instances meshes into a scenario.
--   MeshInstance is a node that takes a @Mesh@ resource and adds it to the current scenario by creating an instance of it. This is the class most often used to get 3D geometry rendered and can be used to instance a single @Mesh@ in many places. This allows to reuse geometry and save on resources. When a @Mesh@ has to be instanced more than thousands of times at close proximity, consider using a @MultiMesh@ in a @MultiMeshInstance@ instead.
newtype MeshInstance = MeshInstance Object
                         deriving newtype AsVariant

instance HasBaseClass MeshInstance where
        type BaseClass MeshInstance = GeometryInstance
        super = coerce

-- | Node used for displaying a @Mesh@ in 2D.
--    Can be constructed from an existing @Sprite@ via a tool in the editor toolbar. Select "Sprite" then "Convert to Mesh2D", select settings in popup and press "Create Mesh2D".
newtype MeshInstance2D = MeshInstance2D Object
                           deriving newtype AsVariant

instance HasBaseClass MeshInstance2D where
        type BaseClass MeshInstance2D = Node2D
        super = coerce

-- | Library of meshes.
--   A library of meshes. Contains a list of @Mesh@ resources, each with a name and ID. Each item can also include collision and navigation shapes. This resource is used in @GridMap@.
newtype MeshLibrary = MeshLibrary Object
                        deriving newtype AsVariant

instance HasBaseClass MeshLibrary where
        type BaseClass MeshLibrary = Resource
        super = coerce

-- | Simple texture that uses a mesh to draw itself.
--    It's limited because flags can't be changed and region drawing is not supported.
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

-- | Provides high-performance mesh instancing.
--   MultiMesh provides low-level mesh instancing. Drawing thousands of @MeshInstance@ nodes can be slow, since each object is submitted to the GPU then drawn individually.
--   		MultiMesh is much faster as it can draw thousands of instances with a single draw call, resulting in less API overhead.
--   		As a drawback, if the instances are too far away of each other, performance may be reduced as every single instance will always rendered (they are spatially indexed as one, for the whole object).
--   		Since instances may have any behavior, the AABB used for visibility must be provided by the user.
newtype MultiMesh = MultiMesh Object
                      deriving newtype AsVariant

instance HasBaseClass MultiMesh where
        type BaseClass MultiMesh = Resource
        super = coerce

-- | Node that instances a @MultiMesh@.
--   @MultiMeshInstance@ is a specialized node to instance @GeometryInstance@s based on a @MultiMesh@ resource.
--   		This is useful to optimize the rendering of a high amount of instances of a given mesh (for example trees in a forest or grass strands).
newtype MultiMeshInstance = MultiMeshInstance Object
                              deriving newtype AsVariant

instance HasBaseClass MultiMeshInstance where
        type BaseClass MultiMeshInstance = GeometryInstance
        super = coerce

-- | Node that instances a @MultiMesh@ in 2D.
--   @MultiMeshInstance2D@ is a specialized node to instance a @MultiMesh@ resource in 2D.
--   		Usage is the same as @MultiMeshInstance@.
newtype MultiMeshInstance2D = MultiMeshInstance2D Object
                                deriving newtype AsVariant

instance HasBaseClass MultiMeshInstance2D where
        type BaseClass MultiMeshInstance2D = Node2D
        super = coerce

-- | High-level multiplayer API.
--   This class implements most of the logic behind the high-level multiplayer API.
--   		By default, @SceneTree@ has a reference to this class that is used to provide multiplayer capabilities (i.e. RPC/RSET) across the whole scene.
--   		It is possible to override the MultiplayerAPI instance used by specific Nodes by setting the @Node.custom_multiplayer@ property, effectively allowing to run both client and server in the same scene.
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
--   Provides navigation and pathfinding within a collection of @NavigationMesh@es. By default, these will be automatically collected from child @NavigationMeshInstance@ nodes, but they can also be added on the fly with @method navmesh_add@. In addition to basic pathfinding, this class also assists with aligning navigation agents with the meshes they are navigating on.
newtype Navigation = Navigation Object
                       deriving newtype AsVariant

instance HasBaseClass Navigation where
        type BaseClass Navigation = Spatial
        super = coerce

-- | 2D navigation and pathfinding node.
--   Navigation2D provides navigation and pathfinding within a 2D area, specified as a collection of @NavigationPolygon@ resources. By default, these are automatically collected from child @NavigationPolygonInstance@ nodes, but they can also be added on the fly with @method navpoly_add@.
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
--   There are two ways to create polygons. Either by using the @method add_outline@ method, or using the @method add_polygon@ method.
--   		Using @method add_outline@:
--   		
--   @
--   
--   		var polygon = NavigationPolygon.new()
--   		var outline = PoolVector2Array(@Vector2(0, 0), Vector2(0, 50), Vector2(50, 50), Vector2(50, 0)@)
--   		polygon.add_outline(outline)
--   		polygon.make_polygons_from_outlines()
--   		$NavigationPolygonInstance.navpoly = polygon
--   		
--   @
--   
--   		Using @method add_polygon@ and indices of the vertices array.
--   		
--   @
--   
--   		var polygon = NavigationPolygon.new()
--   		var vertices = PoolVector2Array(@Vector2(0, 0), Vector2(0, 50), Vector2(50, 50), Vector2(50, 0)@)
--   		polygon.set_vertices(vertices)
--   		var indices = PoolIntArray(0, 3, 1)
--   		polygon.add_polygon(indices)
--   		$NavigationPolygonInstance.navpoly = polygon
--   		
--   @
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
--   Also known as 9-slice panels, NinePatchRect produces clean panels of any size, based on a small texture. To do so, it splits the texture in a 3×3 grid. When you scale the node, it tiles the texture's sides horizontally or vertically, the center on both axes but it doesn't scale or tile the corners.
newtype NinePatchRect = NinePatchRect Object
                          deriving newtype AsVariant

instance HasBaseClass NinePatchRect where
        type BaseClass NinePatchRect = Control
        super = coerce

-- | Base class for all @i@scene@/i@ objects.
--   Nodes are Godot's building blocks. They can be assigned as the child of another node, resulting in a tree arrangement. A given node can contain any number of nodes as children with the requirement that all siblings (direct children of a node) should have unique names.
--   		A tree of nodes is called a @i@scene@/i@. Scenes can be saved to the disk and then instanced into other scenes. This allows for very high flexibility in the architecture and data model of Godot projects.
--   		__Scene tree:__ The @SceneTree@ contains the active tree of nodes. When a node is added to the scene tree, it receives the @NOTIFICATION_ENTER_TREE@ notification and its @method _enter_tree@ callback is triggered. Child nodes are always added @i@after@/i@ their parent node, i.e. the @method _enter_tree@ callback of a parent node will be triggered before its child's.
--   		Once all nodes have been added in the scene tree, they receive the @NOTIFICATION_READY@ notification and their respective @method _ready@ callbacks are triggered. For groups of nodes, the @method _ready@ callback is called in reverse order, starting with the children and moving up to the parent nodes.
--   		This means that when adding a node to the scene tree, the following order will be used for the callbacks: @method _enter_tree@ of the parent, @method _enter_tree@ of the children, @method _ready@ of the children and finally @method _ready@ of the parent (recursively for the entire scene tree).
--   		__Processing:__ Nodes can override the "process" state, so that they receive a callback on each frame requesting them to process (do something). Normal processing (callback @method _process@, toggled with @method set_process@) happens as fast as possible and is dependent on the frame rate, so the processing time @i@delta@/i@ is passed as an argument. Physics processing (callback @method _physics_process@, toggled with @method set_physics_process@) happens a fixed number of times per second (60 by default) and is useful for code related to the physics engine.
--   		Nodes can also process input events. When present, the @method _input@ function will be called for each input that the program receives. In many cases, this can be overkill (unless used for simple projects), and the @method _unhandled_input@ function might be preferred; it is called when the input event was not handled by anyone else (typically, GUI @Control@ nodes), ensuring that the node only receives the events that were meant for it.
--   		To keep track of the scene hierarchy (especially when instancing scenes into other scenes), an "owner" can be set for the node with the @owner@ property. This keeps track of who instanced what. This is mostly useful when writing editors and tools, though.
--   		Finally, when a node is freed with @method Object.free@ or @method queue_free@, it will also free all its children.
--   		__Groups:__ Nodes can be added to as many groups as you want to be easy to manage, you could create groups like "enemies" or "collectables" for example, depending on your game. See @method add_to_group@, @method is_in_group@ and @method remove_from_group@. You can then retrieve all nodes in these groups, iterate them and even call methods on groups via the methods on @SceneTree@.
--   		__Networking with nodes:__ After connecting to a server (or making one, see @NetworkedMultiplayerENet@), it is possible to use the built-in RPC (remote procedure call) system to communicate over the network. By calling @method rpc@ with a method name, it will be called locally and in all connected peers (peers = clients and the server that accepts connections). To identify which node receives the RPC call, Godot will use its @NodePath@ (make sure node names are the same on all peers). Also, take a look at the high-level networking tutorial and corresponding demos.
newtype Node = Node Object
                 deriving newtype AsVariant

instance HasBaseClass Node where
        type BaseClass Node = Object
        super = coerce

-- | A 2D game object, inherited by all 2D-related nodes. Has a position, rotation, scale, and Z index.
--   A 2D game object, with a transform (position, rotation, and scale). All 2D nodes, including physics objects and sprites, inherit from Node2D. Use Node2D as a parent node to move, scale and rotate children in a 2D project. Also gives control of the node's render order.
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
--   Editor facility that helps you draw a 2D polygon used as resource for @LightOccluder2D@.
newtype OccluderPolygon2D = OccluderPolygon2D Object
                              deriving newtype AsVariant

instance HasBaseClass OccluderPolygon2D where
        type BaseClass OccluderPolygon2D = Resource
        super = coerce

-- | Omnidirectional light, such as a light bulb or a candle.
--   An Omnidirectional light is a type of @Light@ that emits light in all directions. The light is attenuated by distance and this attenuation can be configured by changing its energy, radius, and attenuation parameters.
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

-- | Creates packages that can be loaded into a running project.
--   The @PCKPacker@ is used to create packages that can be loaded into a running project using @method ProjectSettings.load_resource_pack@.
--   		
--   @
--   
--   		var packer = PCKPacker.new()
--   		packer.pck_start("test.pck")
--   		packer.add_file("res://text.txt", "text.txt")
--   		packer.flush()
--   		
--   @
--   
--   		The above @PCKPacker@ creates package @test.pck@, then adds a file named @text.txt@ at the root of the package.
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

-- | Reference version of @PackedDataContainer@.
newtype PackedDataContainerRef = PackedDataContainerRef Object
                                   deriving newtype AsVariant

instance HasBaseClass PackedDataContainerRef where
        type BaseClass PackedDataContainerRef = Reference
        super = coerce

-- | An abstraction of a serialized scene.
--   A simplified interface to a scene file. Provides access to operations and checks that can be performed on the scene resource itself.
--   		Can be used to save a node to a file. When saving, the node as well as all the node it owns get saved (see @owner@ property on @Node@).
--   		__Note:__ The node doesn't need to own itself.
--   		__Example of loading a saved scene:__
--   		
--   @
--   
--   		# Use `load()` instead of `preload()` if the path isn't known at compile-time.
--   		var scene = preload("res://scene.tscn").instance()
--   		# Add the node as a child of the node the script is attached to.
--   		add_child(scene)
--   		
--   @
--   
--   		__Example of saving a node with different owners:__ The following example creates 3 objects: @Node2D@ (@node@), @RigidBody2D@ (@rigid@) and @CollisionObject2D@ (@collision@). @collision@ is a child of @rigid@ which is a child of @node@. Only @rigid@ is owned by @node@ and @pack@ will therefore only save those two nodes, but not @collision@.
--   		
--   @
--   
--   		# Create the objects.
--   		var node = Node2D.new()
--   		var rigid = RigidBody2D.new()
--   		var collision = CollisionShape2D.new()
--   
--   		# Create the object hierarchy.
--   		rigid.add_child(collision)
--   		node.add_child(rigid)
--   
--   		# Change owner of `rigid`, but not of `collision`.
--   		rigid.owner = node
--   
--   		var scene = PackedScene.new()
--   		# Only `node` and `rigid` are now packed.
--   		var result = scene.pack(node)
--   		if result == OK:
--   		    var error = ResourceSaver.save("res://path/name.scn", scene)  # Or "user://..."
--   		    if error != OK:
--   		        push_error("An error occurred while saving the scene to disk.")
--   		
--   @
newtype PackedScene = PackedScene Object
                        deriving newtype AsVariant

instance HasBaseClass PackedScene where
        type BaseClass PackedScene = Resource
        super = coerce

-- | Abstraction and base class for packet-based protocols.
--   PacketPeer is an abstraction and base class for packet-based protocols (such as UDP). It provides an API for sending and receiving packets both as raw data or variables. This makes it easy to transfer data over a protocol, without having to encode data as low-level bytes or having to worry about network ordering.
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
--    Can be used to send raw UDP packets as well as @Variant@s.
newtype PacketPeerUDP = PacketPeerUDP Object
                          deriving newtype AsVariant

instance HasBaseClass PacketPeerUDP where
        type BaseClass PacketPeerUDP = PacketPeer
        super = coerce

-- | Provides an opaque background for @Control@ children.
--   Panel is a @Control@ that displays an opaque background. It's commonly used as a parent and container for other types of @Control@ nodes.
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

-- | A type of @Sky@ used to draw a background texture.
--   A resource referenced in an @Environment@ that is used to draw a background. The Panorama sky functions similar to skyboxes in other engines, except it uses an equirectangular sky map instead of a cube map.
--   		Using an HDR panorama is strongly recommended for accurate, high-quality reflections. Godot supports the Radiance HDR (@.hdr@) and OpenEXR (@.exr@) image formats for this purpose.
--   		You can use @url=https://danilw.github.io/GLSL-howto/cubemap_to_panorama_js/cubemap_to_panorama.html@this tool@/url@ to convert a cube map to an equirectangular sky map.
newtype PanoramaSky = PanoramaSky Object
                        deriving newtype AsVariant

instance HasBaseClass PanoramaSky where
        type BaseClass PanoramaSky = Sky
        super = coerce

-- | A node used to create a parallax scrolling background.
--   A ParallaxBackground uses one or more @ParallaxLayer@ child nodes to create a parallax effect. Each @ParallaxLayer@ can move at a different speed using @ParallaxLayer.motion_offset@. This creates an illusion of depth in a 2D game. If not used with a @Camera2D@, you must manually calculate the @scroll_offset@.
newtype ParallaxBackground = ParallaxBackground Object
                               deriving newtype AsVariant

instance HasBaseClass ParallaxBackground where
        type BaseClass ParallaxBackground = CanvasLayer
        super = coerce

-- | A parallax scrolling layer to be used with @ParallaxBackground@.
--   A ParallaxLayer must be the child of a @ParallaxBackground@ node. Each ParallaxLayer can be set to move at different speeds relative to the camera movement or the @ParallaxBackground.scroll_offset@ value.
--   		This node's children will be affected by its scroll offset.
--   		__Note:__ Any changes to this node's position and scale made after it enters the scene will be ignored.
newtype ParallaxLayer = ParallaxLayer Object
                          deriving newtype AsVariant

instance HasBaseClass ParallaxLayer where
        type BaseClass ParallaxLayer = Node2D
        super = coerce

-- | 3D particle emitter.
--   3D particle node used to create a variety of particle systems and effects. @Particles@ features an emitter that generates some number of particles at a given rate.
--   		Use the @process_material@ property to add a @ParticlesMaterial@ to configure particle appearance and behavior. Alternatively, you can add a @ShaderMaterial@ which will be applied to all particles.
newtype Particles = Particles Object
                      deriving newtype AsVariant

instance HasBaseClass Particles where
        type BaseClass Particles = GeometryInstance
        super = coerce

-- | 2D particle emitter.
--   2D particle node used to create a variety of particle systems and effects. @Particles2D@ features an emitter that generates some number of particles at a given rate.
--   		Use the @process_material@ property to add a @ParticlesMaterial@ to configure particle appearance and behavior. Alternatively, you can add a @ShaderMaterial@ which will be applied to all particles.
newtype Particles2D = Particles2D Object
                        deriving newtype AsVariant

instance HasBaseClass Particles2D where
        type BaseClass Particles2D = Node2D
        super = coerce

-- | Particle properties for @Particles@ and @Particles2D@ nodes.
--   ParticlesMaterial defines particle properties and behavior. It is used in the @process_material@ of @Particles@ and @Particles2D@ emitter nodes.
--   		Some of this material's properties are applied to each particle when emitted, while others can have a @CurveTexture@ applied to vary values over the lifetime of the particle.
--   		When a randomness ratio is applied to a property it is used to scale that property by a random amount. The random ratio is used to interpolate between @1.0@ and a random number less than one, the result is multiplied by the property to obtain the randomized property. For example a random ratio of @0.4@ would scale the original property between @0.4-1.0@ of its original value.
newtype ParticlesMaterial = ParticlesMaterial Object
                              deriving newtype AsVariant

instance HasBaseClass ParticlesMaterial where
        type BaseClass ParticlesMaterial = Material
        super = coerce

-- | Contains a @Curve3D@ path for @PathFollow@ nodes to follow.
--   Can have @PathFollow@ child nodes moving along the @Curve3D@. See @PathFollow@ for more information on the usage.
--   		Note that the path is considered as relative to the moved nodes (children of @PathFollow@). As such, the curve should usually start with a zero vector @(0, 0, 0)@.
newtype Path = Path Object
                 deriving newtype AsVariant

instance HasBaseClass Path where
        type BaseClass Path = Spatial
        super = coerce

-- | Contains a @Curve2D@ path for @PathFollow2D@ nodes to follow.
--   Can have @PathFollow2D@ child nodes moving along the @Curve2D@. See @PathFollow2D@ for more information on usage.
--   		__Note:__ The path is considered as relative to the moved nodes (children of @PathFollow2D@). As such, the curve should usually start with a zero vector (@(0, 0)@).
newtype Path2D = Path2D Object
                   deriving newtype AsVariant

instance HasBaseClass Path2D where
        type BaseClass Path2D = Node2D
        super = coerce

-- | Point sampler for a @Path@.
--   This node takes its parent @Path@, and returns the coordinates of a point within it, given a distance from the first vertex.
--   		It is useful for making other nodes follow a path, without coding the movement pattern. For that, the nodes must be children of this node. The descendant nodes will then move accordingly when setting an offset in this node.
newtype PathFollow = PathFollow Object
                       deriving newtype AsVariant

instance HasBaseClass PathFollow where
        type BaseClass PathFollow = Spatial
        super = coerce

-- | Point sampler for a @Path2D@.
--   This node takes its parent @Path2D@, and returns the coordinates of a point within it, given a distance from the first vertex.
--   		It is useful for making other nodes follow a path, without coding the movement pattern. For that, the nodes must be children of this node. The descendant nodes will then move accordingly when setting an offset in this node.
newtype PathFollow2D = PathFollow2D Object
                         deriving newtype AsVariant

instance HasBaseClass PathFollow2D where
        type BaseClass PathFollow2D = Node2D
        super = coerce

-- | Exposes performance-related data.
--   This class provides access to a number of different monitors related to performance, such as memory usage, draw calls, and FPS. These are the same as the values displayed in the __Monitor__ tab in the editor's __Debugger__ panel. By using the @method get_monitor@ method of this class, you can access this data from your code.
--   		__Note:__ A few of these monitors are only available in debug mode and will always return 0 when used in a release build.
--   		__Note:__ Many of these monitors are not updated in real-time, so there may be a short delay between changes.
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

-- | Direct access object to a physics body in the @Physics2DServer@.
--   Provides direct access to a physics body in the @Physics2DServer@, allowing safe changes to physics properties. This object is passed via the direct state callback of rigid/character bodies, and is intended for changing the direct state of that body. See @method RigidBody2D._integrate_forces@.
newtype Physics2DDirectBodyState = Physics2DDirectBodyState Object
                                     deriving newtype AsVariant

instance HasBaseClass Physics2DDirectBodyState where
        type BaseClass Physics2DDirectBodyState = Object
        super = coerce

newtype Physics2DDirectBodyStateSW = Physics2DDirectBodyStateSW Object
                                       deriving newtype AsVariant

instance HasBaseClass Physics2DDirectBodyStateSW where
        type BaseClass Physics2DDirectBodyStateSW =
             Physics2DDirectBodyState
        super = coerce

-- | Direct access object to a space in the @Physics2DServer@.
--    It's used mainly to do queries against objects and areas residing in a given space.
newtype Physics2DDirectSpaceState = Physics2DDirectSpaceState Object
                                      deriving newtype AsVariant

instance HasBaseClass Physics2DDirectSpaceState where
        type BaseClass Physics2DDirectSpaceState = Object
        super = coerce

-- | Server interface for low-level 2D physics access.
--   Physics2DServer is the server responsible for all 2D physics. It can create many kinds of physics objects, but does not insert them on the node tree.
newtype Physics2DServer = Physics2DServer Object
                            deriving newtype AsVariant

instance HasBaseClass Physics2DServer where
        type BaseClass Physics2DServer = Object
        super = coerce

newtype Physics2DServerSW = Physics2DServerSW Object
                              deriving newtype AsVariant

instance HasBaseClass Physics2DServerSW where
        type BaseClass Physics2DServerSW = Physics2DServer
        super = coerce

-- | Parameters to be sent to a 2D shape physics query.
--   This class contains the shape and other parameters for 2D intersection/collision queries. See also @Physics2DShapeQueryResult@.
newtype Physics2DShapeQueryParameters = Physics2DShapeQueryParameters Object
                                          deriving newtype AsVariant

instance HasBaseClass Physics2DShapeQueryParameters where
        type BaseClass Physics2DShapeQueryParameters = Reference
        super = coerce

-- | Result of a 2D shape query in @Physics2DServer@.
--   The result of a 2D shape query in @Physics2DServer@. See also @Physics2DShapeQueryParameters@.
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

-- | Direct access object to a physics body in the @PhysicsServer@.
--   Provides direct access to a physics body in the @PhysicsServer@, allowing safe changes to physics properties. This object is passed via the direct state callback of rigid/character bodies, and is intended for changing the direct state of that body. See @method RigidBody._integrate_forces@.
newtype PhysicsDirectBodyState = PhysicsDirectBodyState Object
                                   deriving newtype AsVariant

instance HasBaseClass PhysicsDirectBodyState where
        type BaseClass PhysicsDirectBodyState = Object
        super = coerce

-- | Direct access object to a space in the @PhysicsServer@.
--    It's used mainly to do queries against objects and areas residing in a given space.
newtype PhysicsDirectSpaceState = PhysicsDirectSpaceState Object
                                    deriving newtype AsVariant

instance HasBaseClass PhysicsDirectSpaceState where
        type BaseClass PhysicsDirectSpaceState = Object
        super = coerce

-- | A material for physics properties.
--   Provides a means of modifying the collision properties of a @PhysicsBody@.
newtype PhysicsMaterial = PhysicsMaterial Object
                            deriving newtype AsVariant

instance HasBaseClass PhysicsMaterial where
        type BaseClass PhysicsMaterial = Resource
        super = coerce

-- | Server interface for low-level physics access.
--   PhysicsServer is the server responsible for all 3D physics. It can create many kinds of physics objects, but does not insert them on the node tree.
newtype PhysicsServer = PhysicsServer Object
                          deriving newtype AsVariant

instance HasBaseClass PhysicsServer where
        type BaseClass PhysicsServer = Object
        super = coerce

-- | Parameters to be sent to a 3D shape physics query.
--   This class contains the shape and other parameters for 3D intersection/collision queries. See also @PhysicsShapeQueryResult@.
newtype PhysicsShapeQueryParameters = PhysicsShapeQueryParameters Object
                                        deriving newtype AsVariant

instance HasBaseClass PhysicsShapeQueryParameters where
        type BaseClass PhysicsShapeQueryParameters = Reference
        super = coerce

-- | Result of a 3D shape query in @PhysicsServer@.
--   The result of a 3D shape query in @PhysicsServer@. See also @PhysicsShapeQueryParameters@.
newtype PhysicsShapeQueryResult = PhysicsShapeQueryResult Object
                                    deriving newtype AsVariant

instance HasBaseClass PhysicsShapeQueryResult where
        type BaseClass PhysicsShapeQueryResult = Reference
        super = coerce

-- | Pin joint for 3D shapes.
--   Pin joint for 3D rigid bodies. It pins 2 bodies (rigid or static) together.
newtype PinJoint = PinJoint Object
                     deriving newtype AsVariant

instance HasBaseClass PinJoint where
        type BaseClass PinJoint = Joint
        super = coerce

-- | Pin Joint for 2D shapes.
--   Pin Joint for 2D rigid bodies. It pins two bodies (rigid or static) together.
newtype PinJoint2D = PinJoint2D Object
                       deriving newtype AsVariant

instance HasBaseClass PinJoint2D where
        type BaseClass PinJoint2D = Joint2D
        super = coerce

-- | Class representing a planar @PrimitiveMesh@.
--    This flat mesh does not have a thickness. By default, this mesh is aligned on the X and Z axes; this default rotation isn't suited for use with billboarded materials. For billboarded materials, use @QuadMesh@ instead.
newtype PlaneMesh = PlaneMesh Object
                      deriving newtype AsVariant

instance HasBaseClass PlaneMesh where
        type BaseClass PlaneMesh = PrimitiveMesh
        super = coerce

-- | Infinite plane shape for 3D collisions.
--   An infinite plane shape for 3D collisions. Note that the @Plane@'s normal matters; anything "below" the plane will collide with it. If the @PlaneShape@ is used in a @PhysicsBody@, it will cause colliding objects placed "below" it to teleport "above" the plane.
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

-- | Mesh with a single Point primitive.
--   The PointMesh is made from a single point. Instead of relying on triangles, points are rendered as a single rectangle on the screen with a constant size. They are intended to be used with Particle systems, but can be used as a cheap way to render constant size billboarded sprites (for example in a point cloud).
--   		PointMeshes, must be used with a material that has a point size. Point size can be accessed in a shader with @POINT_SIZE@, or in a @SpatialMaterial@ by setting @SpatialMaterial.flags_use_point_size@ and the variable @SpatialMaterial.params_point_size@.
--   		When using PointMeshes, properties that normally alter vertices will be ignored, including billboard mode, grow, and cull face.
newtype PointMesh = PointMesh Object
                      deriving newtype AsVariant

instance HasBaseClass PointMesh where
        type BaseClass PointMesh = PrimitiveMesh
        super = coerce

-- | A 2D polygon.
--   A Polygon2D is defined by a set of points. Each point is connected to the next, with the final point being connected to the first, resulting in a closed polygon. Polygon2Ds can be filled with color (solid or gradient) or filled with a given texture.
--   		__Note:__ By default, Godot can only draw up to 4,096 polygon points at a time. To increase this limit, open the Project Settings and increase @ProjectSettings.rendering/limits/buffers/canvas_polygon_buffer_size_kb@ and @ProjectSettings.rendering/limits/buffers/canvas_polygon_index_buffer_size_kb@.
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
--   Popup is a base @Control@ used to show dialogs and popups. It's a subwindow and modal by default (see @Control@) and has helpers for custom popup behavior. All popup methods ensure correct placement within the viewport.
newtype Popup = Popup Object
                  deriving newtype AsVariant

instance HasBaseClass Popup where
        type BaseClass Popup = Control
        super = coerce

-- | Base class for popup dialogs.
--   PopupDialog is a base class for popup dialogs, along with @WindowDialog@.
newtype PopupDialog = PopupDialog Object
                        deriving newtype AsVariant

instance HasBaseClass PopupDialog where
        type BaseClass PopupDialog = Popup
        super = coerce

-- | PopupMenu displays a list of options.
--   @PopupMenu@ is a @Control@ that displays a list of options. They are popular in toolbars or context menus.
newtype PopupMenu = PopupMenu Object
                      deriving newtype AsVariant

instance HasBaseClass PopupMenu where
        type BaseClass PopupMenu = Popup
        super = coerce

-- | Class for displaying popups with a panel background.
--    In some cases it might be simpler to use than @Popup@, since it provides a configurable background. If you are making windows, better check @WindowDialog@.
newtype PopupPanel = PopupPanel Object
                       deriving newtype AsVariant

instance HasBaseClass PopupPanel where
        type BaseClass PopupPanel = Popup
        super = coerce

-- | Generic 2D position hint for editing.
--    It's just like a plain @Node2D@, but it displays as a cross in the 2D editor at all times. You can set cross' visual size by using the gizmo in the 2D editor while the node is selected.
newtype Position2D = Position2D Object
                       deriving newtype AsVariant

instance HasBaseClass Position2D where
        type BaseClass Position2D = Node2D
        super = coerce

-- | Generic 3D position hint for editing.
--    It's just like a plain @Spatial@, but it displays as a cross in the 3D editor at all times.
newtype Position3D = Position3D Object
                       deriving newtype AsVariant

instance HasBaseClass Position3D where
        type BaseClass Position3D = Spatial
        super = coerce

-- | Base class for all primitive meshes. Handles applying a @Material@ to a primitive mesh.
--    Examples include @CapsuleMesh@, @CubeMesh@, @CylinderMesh@, @PlaneMesh@, @PrismMesh@, @QuadMesh@, and @SphereMesh@.
newtype PrimitiveMesh = PrimitiveMesh Object
                          deriving newtype AsVariant

instance HasBaseClass PrimitiveMesh where
        type BaseClass PrimitiveMesh = Mesh
        super = coerce

-- | Class representing a prism-shaped @PrimitiveMesh@.
newtype PrismMesh = PrismMesh Object
                      deriving newtype AsVariant

instance HasBaseClass PrismMesh where
        type BaseClass PrismMesh = PrimitiveMesh
        super = coerce

-- | Type of @Sky@ that is generated procedurally based on user input parameters.
--   ProceduralSky provides a way to create an effective background quickly by defining procedural parameters for the sun, the sky and the ground. The sky and ground are very similar, they are defined by a color at the horizon, another color, and finally an easing curve to interpolate between these two colors. Similarly, the sun is described by a position in the sky, a color, and an easing curve. However, the sun also defines a minimum and maximum angle, these two values define at what distance the easing curve begins and ends from the sun, and thus end up defining the size of the sun in the sky.
--   		The ProceduralSky is updated on the CPU after the parameters change. It is stored in a texture and then displayed as a background in the scene. This makes it relatively unsuitable for real-time updates during gameplay. However, with a small enough texture size, it can still be updated relatively frequently, as it is updated on a background thread when multi-threading is available.
newtype ProceduralSky = ProceduralSky Object
                          deriving newtype AsVariant

instance HasBaseClass ProceduralSky where
        type BaseClass ProceduralSky = Sky
        super = coerce

-- | General-purpose progress bar.
--    Shows fill percentage from right to left.
newtype ProgressBar = ProgressBar Object
                        deriving newtype AsVariant

instance HasBaseClass ProgressBar where
        type BaseClass ProgressBar = Range
        super = coerce

-- | Contains global variables accessible from everywhere.
--    Use @method get_setting@, @method set_setting@ or @method has_setting@ to access them. Variables stored in @project.godot@ are also loaded into ProjectSettings, making this object very useful for reading custom game configuration options.
--   		When naming a Project Settings property, use the full path to the setting including the category. For example, @"application/config/name"@ for the project name. Category and property names can be viewed in the Project Settings dialog.
--   		__Overriding:__ Any project setting can be overridden by creating a file named @override.cfg@ in the project's root directory. This can also be used in exported projects by placing this file in the same directory as the project binary.
newtype ProjectSettings = ProjectSettings Object
                            deriving newtype AsVariant

instance HasBaseClass ProjectSettings where
        type BaseClass ProjectSettings = Object
        super = coerce

-- | General-purpose proximity detection node.
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
--   Class representing a square @PrimitiveMesh@. This flat mesh does not have a thickness. By default, this mesh is aligned on the X and Y axes; this default rotation is more suited for use with billboarded materials. Unlike @PlaneMesh@, this mesh doesn't provide subdivision options.
newtype QuadMesh = QuadMesh Object
                     deriving newtype AsVariant

instance HasBaseClass QuadMesh where
        type BaseClass QuadMesh = PrimitiveMesh
        super = coerce

-- | A class for generating pseudo-random numbers.
--   RandomNumberGenerator is a class for generating pseudo-random numbers. It currently uses @url=http://www.pcg-random.org/@PCG32@/url@.
--   		__Note:__ The underlying algorithm is an implementation detail. As a result, it should not be depended upon for reproducible random streams across Godot versions.
--   		To generate a random float number (within a given range) based on a time-dependant seed:
--   		
--   @
--   
--   		var rng = RandomNumberGenerator.new()
--   		func _ready():
--   		    rng.randomize()
--   		    var my_random_number = rng.randf_range(-10.0, 10.0)
--   		
--   @
newtype RandomNumberGenerator = RandomNumberGenerator Object
                                  deriving newtype AsVariant

instance HasBaseClass RandomNumberGenerator where
        type BaseClass RandomNumberGenerator = Reference
        super = coerce

-- | Abstract base class for range-based controls.
--   Range is a base class for @Control@ nodes that change a floating-point @i@value@/i@ between a @i@minimum@/i@ and a @i@maximum@/i@, using @i@step@/i@ and @i@page@/i@, for example a @ScrollBar@.
newtype Range = Range Object
                  deriving newtype AsVariant

instance HasBaseClass Range where
        type BaseClass Range = Control
        super = coerce

-- | Query the closest object intersecting a ray.
--   A RayCast represents a line from its origin to its destination position, @cast_to@. It is used to query the 3D space in order to find the closest object along the path of the ray.
--   		RayCast can ignore some objects by adding them to the exception list via @add_exception@ or by setting proper filtering with collision layers and masks.
--   		RayCast can be configured to report collisions with @Area@s (@collide_with_areas@) and/or @PhysicsBody@s (@collide_with_bodies@).
--   		Only enabled raycasts will be able to query the space and report collisions.
--   		RayCast calculates intersection every physics frame (see @Node@), and the result is cached so it can be used later until the next frame. If multiple queries are required between physics frames (or during the same frame), use @method force_raycast_update@ after adjusting the raycast.
newtype RayCast = RayCast Object
                    deriving newtype AsVariant

instance HasBaseClass RayCast where
        type BaseClass RayCast = Spatial
        super = coerce

-- | Query the closest object intersecting a ray.
--   A RayCast represents a line from its origin to its destination position, @cast_to@. It is used to query the 2D space in order to find the closest object along the path of the ray.
--   		RayCast2D can ignore some objects by adding them to the exception list via @add_exception@, by setting proper filtering with collision layers, or by filtering object types with type masks.
--   		RayCast2D can be configured to report collisions with @Area2D@s (@collide_with_areas@) and/or @PhysicsBody2D@s (@collide_with_bodies@).
--   		Only enabled raycasts will be able to query the space and report collisions.
--   		RayCast2D calculates intersection every physics frame (see @Node@), and the result is cached so it can be used later until the next frame. If multiple queries are required between physics frames (or during the same frame) use @method force_raycast_update@ after adjusting the raycast.
newtype RayCast2D = RayCast2D Object
                      deriving newtype AsVariant

instance HasBaseClass RayCast2D where
        type BaseClass RayCast2D = Node2D
        super = coerce

-- | Ray shape for 3D collisions.
--   Ray shape for 3D collisions, which can be set into a @PhysicsBody@ or @Area@. A ray is not really a collision body; instead, it tries to separate itself from whatever is touching its far endpoint. It's often useful for characters.
newtype RayShape = RayShape Object
                     deriving newtype AsVariant

instance HasBaseClass RayShape where
        type BaseClass RayShape = Shape
        super = coerce

-- | Ray shape for 2D collisions.
--    A ray is not really a collision body; instead, it tries to separate itself from whatever is touching its far endpoint. It's often useful for characters.
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
--   Base class for any object that keeps a reference count. @Resource@ and many other helper objects inherit this class.
--   		Unlike @Object@s, References keep an internal reference counter so that they are automatically released when no longer in use, and only then. References therefore do not need to be freed manually with @method Object.free@.
--   		In the vast majority of use cases, instantiating and using @Reference@-derived types is all you need to do. The methods provided in this class are only for advanced users, and can cause issues if misused.
newtype Reference = Reference Object
                      deriving newtype AsVariant

instance HasBaseClass Reference where
        type BaseClass Reference = Object
        super = coerce

-- | Reference frame for GUI.
--   A rectangle box that displays only a @border_color@ border color around its rectangle. @ReferenceRect@ has no fill @Color@.
newtype ReferenceRect = ReferenceRect Object
                          deriving newtype AsVariant

instance HasBaseClass ReferenceRect where
        type BaseClass ReferenceRect = Control
        super = coerce

-- | Captures its surroundings to create reflections.
--   Capture its surroundings as a dual paraboloid image, and stores versions of it with increasing levels of blur to simulate different material roughnesses.
--   		The @ReflectionProbe@ is used to create high-quality reflections at the cost of performance. It can be combined with @GIProbe@s and Screen Space Reflections to achieve high quality reflections. @ReflectionProbe@s render all objects within their @cull_mask@, so updating them can be quite expensive. It is best to update them once with the important static objects and then leave them.
--   		Note: By default Godot will only render 16 reflection probes. If you need more, increase the number of atlas subdivisions. This setting can be found in @ProjectSettings.rendering/quality/reflections/atlas_subdiv@.
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

-- | RemoteTransform pushes its own @Transform@ to another @Spatial@ derived Node in the scene.
--   RemoteTransform pushes its own @Transform@ to another @Spatial@ derived Node (called the remote node) in the scene.
--   		It can be set to update another Node's position, rotation and/or scale. It can use either global or local coordinates.
newtype RemoteTransform = RemoteTransform Object
                            deriving newtype AsVariant

instance HasBaseClass RemoteTransform where
        type BaseClass RemoteTransform = Spatial
        super = coerce

-- | RemoteTransform2D pushes its own @Transform2D@ to another @CanvasItem@ derived Node in the scene.
--   RemoteTransform2D pushes its own @Transform2D@ to another @CanvasItem@ derived Node (called the remote node) in the scene.
--   		It can be set to update another Node's position, rotation and/or scale. It can use either global or local coordinates.
newtype RemoteTransform2D = RemoteTransform2D Object
                              deriving newtype AsVariant

instance HasBaseClass RemoteTransform2D where
        type BaseClass RemoteTransform2D = Node2D
        super = coerce

-- | Base class for all resources.
--   Resource is the base class for all Godot-specific resource types, serving primarily as data containers. Unlike @Object@s, they are reference-counted and freed when no longer in use. They are also cached once loaded from disk, so that any further attempts to load a resource from a given path will return the same reference (all this in contrast to a @Node@, which is not reference-counted and can be instanced from disk as many times as desired). Resources can be saved externally on disk or bundled into another object, such as a @Node@ or another resource.
newtype Resource = Resource Object
                     deriving newtype AsVariant

instance HasBaseClass Resource where
        type BaseClass Resource = Reference
        super = coerce

-- | Loads a specific resource type from a file.
--   Godot loads resources in the editor or in exported games using ResourceFormatLoaders. They are queried automatically via the @ResourceLoader@ singleton, or when a resource with internal dependencies is loaded. Each file type may load as a different resource type, so multiple ResourceFormatLoaders are registered in the engine.
--   		Extending this class allows you to define your own loader. Be sure to respect the documented return types and values. You should give it a global class name with @class_name@ for it to be registered. Like built-in ResourceFormatLoaders, it will be called automatically when loading resources of its handled type(s). You may also implement a @ResourceFormatSaver@.
--   		__Note:__ You can also extend @EditorImportPlugin@ if the resource type you need exists but Godot is unable to load its format. Choosing one way over another depends if the format is suitable or not for the final exported game. For example, it's better to import @.png@ textures as @.stex@ (@StreamTexture@) first, so they can be loaded with better efficiency on the graphics card.
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
--   The engine can save resources when you do it from the editor, or when you use the @ResourceSaver@ singleton. This is accomplished thanks to multiple @ResourceFormatSaver@s, each handling its own format and called automatically by the engine.
--   		By default, Godot saves resources as @.tres@ (text-based), @.res@ (binary) or another built-in format, but you can choose to create your own format by extending this class. Be sure to respect the documented return types and values. You should give it a global class name with @class_name@ for it to be registered. Like built-in ResourceFormatSavers, it will be called automatically when saving resources of its recognized type(s). You may also implement a @ResourceFormatLoader@.
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

-- | Interactive @Resource@ loader.
--    This object is returned by @ResourceLoader@ when performing an interactive load. It allows loading resources with high granularity, which makes it mainly useful for displaying loading bars or percentages.
newtype ResourceInteractiveLoader = ResourceInteractiveLoader Object
                                      deriving newtype AsVariant

instance HasBaseClass ResourceInteractiveLoader where
        type BaseClass ResourceInteractiveLoader = Reference
        super = coerce

-- | Resource Preloader Node.
--   This node is used to preload sub-resources inside a scene, so when the scene is loaded, all the resources are ready to use and can be retrieved from the preloader.
--   		GDScript has a simplified @method @GDScript.preload@ built-in method which can be used in most situations, leaving the use of @ResourcePreloader@ for more advanced scenarios.
newtype ResourcePreloader = ResourcePreloader Object
                              deriving newtype AsVariant

instance HasBaseClass ResourcePreloader where
        type BaseClass ResourcePreloader = Node
        super = coerce

-- | A custom effect for use with @RichTextLabel@.
--   
--   		__Note:__ For a @RichTextEffect@ to be usable, a BBCode tag must be defined as a member variable called @bbcode@ in the script.
--   		
--   @
--   
--   		# The RichTextEffect will be usable like this: `@example@Some text@/example@`
--   		var bbcode = "example"
--   		
--   @
--   
--   		__Note:__ As soon as a @RichTextLabel@ contains at least one @RichTextEffect@, it will continuously process the effect unless the project is paused. This may impact battery life negatively.
newtype RichTextEffect = RichTextEffect Object
                           deriving newtype AsVariant

instance HasBaseClass RichTextEffect where
        type BaseClass RichTextEffect = Resource
        super = coerce

-- | Label that displays rich text.
--   Rich text can contain custom text, fonts, images and some basic formatting. The label manages these as an internal tag stack. It also adapts itself to given width/heights.
--   		__Note:__ Assignments to @bbcode_text@ clear the tag stack and reconstruct it from the property's contents. Any edits made to @bbcode_text@ will erase previous edits made from other manual sources such as @method append_bbcode@ and the @push_*@ / @method pop@ methods.
--   		__Note:__ Unlike @Label@, RichTextLabel doesn't have a @i@property@/i@ to horizontally align text to the center. Instead, enable @bbcode_enabled@ and surround the text in a @@center@@ tag as follows: @@center@Example@/center@@. There is currently no built-in way to vertically align text either, but this can be emulated by relying on anchors/containers and the @fit_content_height@ property.
newtype RichTextLabel = RichTextLabel Object
                          deriving newtype AsVariant

instance HasBaseClass RichTextLabel where
        type BaseClass RichTextLabel = Control
        super = coerce

-- | Physics Body whose position is determined through physics simulation in 3D space.
--   This is the node that implements full 3D physics. This means that you do not control a RigidBody directly. Instead, you can apply forces to it (gravity, impulses, etc.), and the physics simulation will calculate the resulting movement, collision, bouncing, rotating, etc.
--   		A RigidBody has 4 behavior @mode@s: Rigid, Static, Character, and Kinematic.
--   		__Note:__ Don't change a RigidBody's position every frame or very often. Sporadic changes work fine, but physics runs at a different granularity (fixed Hz) than usual rendering (process callback) and maybe even in a separate thread, so changing this from a process loop may result in strange behavior. If you need to directly affect the body's state, use @method _integrate_forces@, which allows you to directly access the physics state.
--   		If you need to override the default physics behavior, you can write a custom force integration function. See @custom_integrator@.
--   		With Bullet physics (the default), the center of mass is the RigidBody3D center. With GodotPhysics, the center of mass is the average of the @CollisionShape@ centers.
newtype RigidBody = RigidBody Object
                      deriving newtype AsVariant

instance HasBaseClass RigidBody where
        type BaseClass RigidBody = PhysicsBody
        super = coerce

-- | A body that is controlled by the 2D physics engine.
--   This node implements simulated 2D physics. You do not control a RigidBody2D directly. Instead you apply forces to it (gravity, impulses, etc.) and the physics simulation calculates the resulting movement based on its mass, friction, and other physical properties.
--   		A RigidBody2D has 4 behavior @mode@s: Rigid, Static, Character, and Kinematic.
--   		__Note:__ You should not change a RigidBody2D's @position@ or @linear_velocity@ every frame or even very often. If you need to directly affect the body's state, use @method _integrate_forces@, which allows you to directly access the physics state.
--   		Please also keep in mind that physics bodies manage their own transform which overwrites the ones you set. So any direct or indirect transformation (including scaling of the node or its parent) will be visible in the editor only, and immediately reset at runtime.
--   		If you need to override the default physics behavior or add a transformation at runtime, you can write a custom force integration. See @custom_integrator@.
--   		The center of mass is always located at the node's origin without taking into account the @CollisionShape2D@ centroid offsets.
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
--   		This class cannot be instantiated directly, it is retrieved for a given scene as the result of @method PackedScene.get_state@.
newtype SceneState = SceneState Object
                       deriving newtype AsVariant

instance HasBaseClass SceneState where
        type BaseClass SceneState = Reference
        super = coerce

-- | Manages the game loop via a hierarchy of nodes.
--   As one of the most important classes, the @SceneTree@ manages the hierarchy of nodes in a scene as well as scenes themselves. Nodes can be added, retrieved and removed. The whole scene tree (and thus the current scene) can be paused. Scenes can be loaded, switched and reloaded.
--   		You can also use the @SceneTree@ to organize your nodes into groups: every node can be assigned as many groups as you want to create, e.g. a "enemy" group. You can then iterate these groups or even call methods and set properties on all the group's members at once.
--   		@SceneTree@ is the default @MainLoop@ implementation used by scenes, and is thus in charge of the game loop.
newtype SceneTree = SceneTree Object
                      deriving newtype AsVariant

instance HasBaseClass SceneTree where
        type BaseClass SceneTree = MainLoop
        super = coerce

-- | One-shot timer.
--   A one-shot timer managed by the scene tree, which emits @signal timeout@ on completion. See also @method SceneTree.create_timer@.
--   		As opposed to @Timer@, it does not require the instantiation of a node. Commonly used to create a one-shot delay timer as in the following example:
--   		
--   @
--   
--   		func some_function():
--   		    print("Timer started.")
--   		    yield(get_tree().create_timer(1.0), "timeout")
--   		    print("Timer ended.")
--   		
--   @
newtype SceneTreeTimer = SceneTreeTimer Object
                           deriving newtype AsVariant

instance HasBaseClass SceneTreeTimer where
        type BaseClass SceneTreeTimer = Reference
        super = coerce

-- | A class stored as a resource.
--    A script extends the functionality of all objects that instance it.
--   		The @new@ method of a script subclass creates a new instance. @method Object.set_script@ extends an existing object, if that object's class matches one of the script's base classes.
newtype Script = Script Object
                   deriving newtype AsVariant

instance HasBaseClass Script where
        type BaseClass Script = Resource
        super = coerce

-- | The Editor's popup dialog for creating new @Script@ files.
--   The @ScriptCreateDialog@ creates script files according to a given template for a given scripting language. The standard use is to configure its fields prior to calling one of the @method Popup.popup@ methods.
--   		
--   @
--   
--   		func _ready():
--   		    dialog.config("Node", "res://new_node.gd") # For in-engine types
--   		    dialog.config("\"res://base_node.gd\"", "res://derived_node.gd") # For script types
--   		    dialog.popup_centered()
--   		
--   @
newtype ScriptCreateDialog = ScriptCreateDialog Object
                               deriving newtype AsVariant

instance HasBaseClass ScriptCreateDialog where
        type BaseClass ScriptCreateDialog = ConfirmationDialog
        super = coerce

-- | Godot editor's script editor.
--   __Note:__ This class shouldn't be instantiated directly. Instead, access the singleton using @method EditorInterface.get_script_editor@.
newtype ScriptEditor = ScriptEditor Object
                         deriving newtype AsVariant

instance HasBaseClass ScriptEditor where
        type BaseClass ScriptEditor = PanelContainer
        super = coerce

-- | Base class for scroll bars.
--   Scrollbars are a @Range@-based @Control@, that display a draggable area (the size of the page). Horizontal (@HScrollBar@) and Vertical (@VScrollBar@) versions are available.
newtype ScrollBar = ScrollBar Object
                      deriving newtype AsVariant

instance HasBaseClass ScrollBar where
        type BaseClass ScrollBar = Range
        super = coerce

-- | A helper node for displaying scrollable elements such as lists.
--   A ScrollContainer node meant to contain a @Control@ child. ScrollContainers will automatically create a scrollbar child (@HScrollBar@, @VScrollBar@, or both) when needed and will only draw the Control within the ScrollContainer area. Scrollbars will automatically be drawn at the right (for vertical) or bottom (for horizontal) and will enable dragging to move the viewable Control (and its children) within the ScrollContainer. Scrollbars will also automatically resize the grabber based on the @Control.rect_min_size@ of the Control relative to the ScrollContainer. Works great with a @Panel@ control. You can set @EXPAND@ on the children's size flags, so they will upscale to the ScrollContainer's size if it's larger (scroll is invisible for the chosen dimension).
newtype ScrollContainer = ScrollContainer Object
                            deriving newtype AsVariant

instance HasBaseClass ScrollContainer where
        type BaseClass ScrollContainer = Container
        super = coerce

-- | Segment shape for 2D collisions.
--    Consists of two points, @a@ and @b@.
newtype SegmentShape2D = SegmentShape2D Object
                           deriving newtype AsVariant

instance HasBaseClass SegmentShape2D where
        type BaseClass SegmentShape2D = Shape2D
        super = coerce

-- | Base class for separators.
--   Separator is a @Control@ used for separating other controls. It's purely a visual decoration. Horizontal (@HSeparator@) and Vertical (@VSeparator@) versions are available.
newtype Separator = Separator Object
                      deriving newtype AsVariant

instance HasBaseClass Separator where
        type BaseClass Separator = Control
        super = coerce

-- | A custom shader program.
--   This class allows you to define a custom shader program that can be used by a @ShaderMaterial@. Shaders allow you to write your own custom behavior for rendering objects or updating particle information. For a detailed explanation and usage, please see the tutorials linked below.
newtype Shader = Shader Object
                   deriving newtype AsVariant

instance HasBaseClass Shader where
        type BaseClass Shader = Resource
        super = coerce

-- | A material that uses a custom @Shader@ program.
--   A material that uses a custom @Shader@ program to render either items to screen or process particles. You can create multiple materials for the same shader but configure different values for the uniforms defined in the shader.
newtype ShaderMaterial = ShaderMaterial Object
                           deriving newtype AsVariant

instance HasBaseClass ShaderMaterial where
        type BaseClass ShaderMaterial = Material
        super = coerce

-- | Base class for all 3D shape resources.
--    Nodes that inherit from this can be used as shapes for a @PhysicsBody@ or @Area@ objects.
newtype Shape = Shape Object
                  deriving newtype AsVariant

instance HasBaseClass Shape where
        type BaseClass Shape = Resource
        super = coerce

-- | Base class for all 2D shapes.
--    All 2D shape types inherit from this.
newtype Shape2D = Shape2D Object
                    deriving newtype AsVariant

instance HasBaseClass Shape2D where
        type BaseClass Shape2D = Resource
        super = coerce

-- | A shortcut for binding input.
--   
--   		Shortcuts are commonly used for interacting with a @Control@ element from a @InputEvent@.
newtype ShortCut = ShortCut Object
                     deriving newtype AsVariant

instance HasBaseClass ShortCut where
        type BaseClass ShortCut = Resource
        super = coerce

-- | Skeleton for characters and animated objects.
--   Skeleton provides a hierarchical interface for managing bones, including pose, rest and animation (see @Animation@). It can also use ragdoll physics.
--   		The overall transform of a bone with respect to the skeleton is determined by the following hierarchical order: rest pose, custom pose and pose.
--   		Note that "global pose" below refers to the overall transform of the bone with respect to skeleton, so it not the actual global/world transform of the bone.
newtype Skeleton = Skeleton Object
                     deriving newtype AsVariant

instance HasBaseClass Skeleton where
        type BaseClass Skeleton = Spatial
        super = coerce

-- | Skeleton for 2D characters and animated objects.
--   Skeleton2D parents a hierarchy of @Bone2D@ objects. It is a requirement of @Bone2D@. Skeleton2D holds a reference to the rest pose of its children and acts as a single point of access to its bones.
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

-- | The base class for @PanoramaSky@ and @ProceduralSky@.
newtype Sky = Sky Object
                deriving newtype AsVariant

instance HasBaseClass Sky where
        type BaseClass Sky = Resource
        super = coerce

-- | Base class for GUI sliders.
--   
--   		__Note:__ The @signal Range.changed@ and @signal Range.value_changed@ signals are part of the @Range@ class which this class inherits from.
newtype Slider = Slider Object
                   deriving newtype AsVariant

instance HasBaseClass Slider where
        type BaseClass Slider = Range
        super = coerce

-- | Piston kind of slider between two bodies in 3D.
--   Slides across the X axis of the pivot object.
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

-- | Most basic 3D game object, parent of all 3D-related nodes.
--   Most basic 3D game object, with a 3D @Transform@ and visibility settings. All other 3D game objects inherit from Spatial. Use @Spatial@ as a parent node to move, scale, rotate and show/hide children in a 3D project.
--   		Affine operations (rotate, scale, translate) happen in parent's local coordinate system, unless the @Spatial@ object is set as top-level. Affine operations in this coordinate system correspond to direct affine operations on the @Spatial@'s transform. The word local below refers to this coordinate system. The coordinate system that is attached to the @Spatial@ object itself is referred to as object-local coordinate system.
--   		__Note:__ Unless otherwise specified, all methods that have angle parameters must have angles specified as @i@radians@/i@. To convert degrees to radians, use @method @GDScript.deg2rad@.
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

-- | Class representing a spherical @PrimitiveMesh@.
newtype SphereMesh = SphereMesh Object
                       deriving newtype AsVariant

instance HasBaseClass SphereMesh where
        type BaseClass SphereMesh = PrimitiveMesh
        super = coerce

-- | Sphere shape for 3D collisions.
--   Sphere shape for 3D collisions, which can be set into a @PhysicsBody@ or @Area@. This shape is useful for modeling sphere-like 3D objects.
newtype SphereShape = SphereShape Object
                        deriving newtype AsVariant

instance HasBaseClass SphereShape where
        type BaseClass SphereShape = Shape
        super = coerce

-- | Numerical input text field.
--   SpinBox is a numerical input text field. It allows entering integers and floats.
--   		__Example:__
--   		
--   @
--   
--   		var spin_box = SpinBox.new()
--   		add_child(spin_box)
--   		var line_edit = spin_box.get_line_edit()
--   		line_edit.context_menu_enabled = false
--   		spin_box.align = LineEdit.ALIGN_RIGHT
--   		
--   @
--   
--   		The above code will create a @SpinBox@, disable context menu on it and set the text alignment to right.
--   		See @Range@ class for more options over the @SpinBox@.
newtype SpinBox = SpinBox Object
                    deriving newtype AsVariant

instance HasBaseClass SpinBox where
        type BaseClass SpinBox = Range
        super = coerce

-- | Container for splitting and adjusting.
--   Container for splitting two @Control@s vertically or horizontally, with a grabber that allows adjusting the split offset or ratio.
newtype SplitContainer = SplitContainer Object
                           deriving newtype AsVariant

instance HasBaseClass SplitContainer where
        type BaseClass SplitContainer = Container
        super = coerce

-- | A spotlight, such as a reflector spotlight or a lantern.
--   A Spotlight is a type of @Light@ node that emits lights in a specific direction, in the shape of a cone. The light is attenuated through the distance. This attenuation can be configured by changing the energy, radius and attenuation parameters of @Light@.
newtype SpotLight = SpotLight Object
                      deriving newtype AsVariant

instance HasBaseClass SpotLight where
        type BaseClass SpotLight = Light
        super = coerce

-- | A helper node, mostly used in 3rd person cameras.
--   The SpringArm node is a node that casts a ray (or collision shape) along its z axis and moves all its direct children to the collision point, minus a margin.
--   		The most common use case for this is to make a 3rd person camera that reacts to collisions in the environment.
--   		The SpringArm will either cast a ray, or if a shape is given, it will cast the shape in the direction of its z axis.
--   		If you use the SpringArm as a camera controller for your player, you might need to exclude the player's collider from the SpringArm's collision check.
newtype SpringArm = SpringArm Object
                      deriving newtype AsVariant

instance HasBaseClass SpringArm where
        type BaseClass SpringArm = Spatial
        super = coerce

-- | General-purpose sprite node.
--   A node that displays a 2D texture. The texture displayed can be a region from a larger atlas texture, or a frame from a sprite sheet animation.
newtype Sprite = Sprite Object
                   deriving newtype AsVariant

instance HasBaseClass Sprite where
        type BaseClass Sprite = Node2D
        super = coerce

-- | 2D sprite node in a 3D world.
--   A node that displays a 2D texture in a 3D environment. The texture displayed can be a region from a larger atlas texture, or a frame from a sprite sheet animation.
newtype Sprite3D = Sprite3D Object
                     deriving newtype AsVariant

instance HasBaseClass Sprite3D where
        type BaseClass Sprite3D = SpriteBase3D
        super = coerce

-- | 2D sprite node in 3D environment.
--   A node that displays 2D texture information in a 3D environment.
newtype SpriteBase3D = SpriteBase3D Object
                         deriving newtype AsVariant

instance HasBaseClass SpriteBase3D where
        type BaseClass SpriteBase3D = GeometryInstance
        super = coerce

-- | Sprite frame library for AnimatedSprite.
--   Sprite frame library for @AnimatedSprite@. Contains frames and animation data for playback.
--   		__Note:__ You can associate a set of normal maps by creating additional @SpriteFrames@ resources with a @_normal@ suffix. For example, having 2 @SpriteFrames@ resources @run@ and @run_normal@ will make it so the @run@ animation uses the normal map.
newtype SpriteFrames = SpriteFrames Object
                         deriving newtype AsVariant

instance HasBaseClass SpriteFrames where
        type BaseClass SpriteFrames = Resource
        super = coerce

-- | Static body for 3D physics.
--    A static body is a simple body that is not intended to move. In contrast to @RigidBody@, they don't consume any CPU resources as long as they don't move.
--   		Additionally, a constant linear or angular velocity can be set for the static body, so even if it doesn't move, it affects other bodies as if it was moving (this is useful for simulating conveyor belts or conveyor wheels).
newtype StaticBody = StaticBody Object
                       deriving newtype AsVariant

instance HasBaseClass StaticBody where
        type BaseClass StaticBody = PhysicsBody
        super = coerce

-- | Static body for 2D physics.
--    A StaticBody2D is a body that is not intended to move. It is ideal for implementing objects in the environment, such as walls or platforms.
--   		Additionally, a constant linear or angular velocity can be set for the static body, which will affect colliding bodies as if it were moving (for example, a conveyor belt).
newtype StaticBody2D = StaticBody2D Object
                         deriving newtype AsVariant

instance HasBaseClass StaticBody2D where
        type BaseClass StaticBody2D = PhysicsBody2D
        super = coerce

-- | Abstraction and base class for stream-based protocols.
--   StreamPeer is an abstraction and base class for stream-based protocols (such as TCP or UNIX sockets). It provides an API for sending and receiving data through streams as raw data or strings.
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

-- | SSL stream peer.
--    This object can be used to connect to an SSL server or accept a single SSL client connection.
newtype StreamPeerSSL = StreamPeerSSL Object
                          deriving newtype AsVariant

instance HasBaseClass StreamPeerSSL where
        type BaseClass StreamPeerSSL = StreamPeer
        super = coerce

-- | TCP stream peer.
--    This object can be used to connect to TCP servers, or also is returned by a TCP server.
newtype StreamPeerTCP = StreamPeerTCP Object
                          deriving newtype AsVariant

instance HasBaseClass StreamPeerTCP where
        type BaseClass StreamPeerTCP = StreamPeer
        super = coerce

-- | A @.stex@ texture.
--   A texture that is loaded from a @.stex@ file.
newtype StreamTexture = StreamTexture Object
                          deriving newtype AsVariant

instance HasBaseClass StreamTexture where
        type BaseClass StreamTexture = Texture
        super = coerce

-- | Base class for drawing stylized boxes for the UI.
--   StyleBox is @Resource@ that provides an abstract base class for drawing stylized boxes for the UI. StyleBoxes are used for drawing the styles of buttons, line edit backgrounds, tree backgrounds, etc. and also for testing a transparency mask for pointer signals. If mask test fails on a StyleBox assigned as mask to a control, clicks and motion signals will go through it to the one below.
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

-- | Customizable @StyleBox@ with a given set of parameters (no texture required).
--   This @StyleBox@ can be used to achieve all kinds of looks without the need of a texture. Those properties are customizable:
--   		- Color
--   		- Border width (individual width for each border)
--   		- Rounded corners (individual radius for each corner)
--   		- Shadow (with blur and offset)
--   		Setting corner radius to high values is allowed. As soon as corners would overlap, the stylebox will switch to a relative system. Example:
--   		
--   @
--   
--   		height = 30
--   		corner_radius_top_left = 50
--   		corner_radius_bottom_left = 100
--   		
--   @
--   
--   		The relative system now would take the 1:2 ratio of the two left corners to calculate the actual corner width. Both corners added will __never__ be more than the height. Result:
--   		
--   @
--   
--   		corner_radius_top_left: 10
--   		corner_radius_bottom_left: 20
--   		
--   @
newtype StyleBoxFlat = StyleBoxFlat Object
                         deriving newtype AsVariant

instance HasBaseClass StyleBoxFlat where
        type BaseClass StyleBoxFlat = StyleBox
        super = coerce

-- | @StyleBox@ that displays a single line.
--   @StyleBox@ that displays a single line of a given color and thickness. It can be used to draw things like separators.
newtype StyleBoxLine = StyleBoxLine Object
                         deriving newtype AsVariant

instance HasBaseClass StyleBoxLine where
        type BaseClass StyleBoxLine = StyleBox
        super = coerce

-- | Texture-based nine-patch @StyleBox@.
--   Texture-based nine-patch @StyleBox@, in a way similar to @NinePatchRect@. This stylebox performs a 3×3 scaling of a texture, where only the center cell is fully stretched. This makes it possible to design bordered styles regardless of the stylebox's size.
newtype StyleBoxTexture = StyleBoxTexture Object
                            deriving newtype AsVariant

instance HasBaseClass StyleBoxTexture where
        type BaseClass StyleBoxTexture = StyleBox
        super = coerce

-- | Helper tool to create geometry.
--   The @SurfaceTool@ is used to construct a @Mesh@ by specifying vertex attributes individually. It can be used to construct a @Mesh@ from a script. All properties except indices need to be added before calling @method add_vertex@. For example, to add vertex colors and UVs:
--   		
--   @
--   
--   		var st = SurfaceTool.new()
--   		st.begin(Mesh.PRIMITIVE_TRIANGLES)
--   		st.add_color(Color(1, 0, 0))
--   		st.add_uv(Vector2(0, 0))
--   		st.add_vertex(Vector3(0, 0, 0))
--   		
--   @
--   
--   		The above @SurfaceTool@ now contains one vertex of a triangle which has a UV coordinate and a specified @Color@. If another vertex were added without calling @method add_uv@ or @method add_color@, then the last values would be used.
--   		Vertex attributes must be passed __before__ calling @method add_vertex@. Failure to do so will result in an error when committing the vertex information to a mesh.
--   		Additionally, the attributes used before the first vertex is added determine the format of the mesh. For example, if you only add UVs to the first vertex, you cannot add color to any of the subsequent vertices.
--   		See also @ArrayMesh@, @ImmediateGeometry@ and @MeshDataTool@ for procedural geometry generation.
--   		__Note:__ Godot uses clockwise @url=https://learnopengl.com/Advanced-OpenGL/Face-culling@winding order@/url@ for front faces of triangle primitive modes.
newtype SurfaceTool = SurfaceTool Object
                        deriving newtype AsVariant

instance HasBaseClass SurfaceTool where
        type BaseClass SurfaceTool = Reference
        super = coerce

-- | A TCP server.
--    Listens to connections on a port and returns a @StreamPeerTCP@ when it gets an incoming connection.
newtype TCP_Server = TCP_Server Object
                       deriving newtype AsVariant

instance HasBaseClass TCP_Server where
        type BaseClass TCP_Server = Reference
        super = coerce

-- | Tabbed container.
--   Sets the active tab's @visible@ property to the value @true@. Sets all other children's to @false@.
--   		Ignores non-@Control@ children.
--   		Individual tabs are always visible unless you use @method set_tab_disabled@ and @method set_tab_title@ to hide it.
--   		To hide only a tab's content, nest the content inside a child @Control@, so it receives the @TabContainer@'s visibility setting instead.
newtype TabContainer = TabContainer Object
                         deriving newtype AsVariant

instance HasBaseClass TabContainer where
        type BaseClass TabContainer = Container
        super = coerce

-- | Tabs control.
--   Simple tabs control, similar to @TabContainer@ but is only in charge of drawing tabs, not interact with children.
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
--   A texture works by registering an image in the video hardware, which then can be used in 3D models or 2D @Sprite@ or GUI @Control@.
--   		Textures are often created by loading them from a file. See @method @GDScript.load@.
--   		@Texture@ is a base for other resources. It cannot be used directly.
newtype Texture = Texture Object
                    deriving newtype AsVariant

instance HasBaseClass Texture where
        type BaseClass Texture = Resource
        super = coerce

-- | Texture with 3 dimensions.
--   Texture3D is a 3-dimensional texture that has a width, height, and depth.
newtype Texture3D = Texture3D Object
                      deriving newtype AsVariant

instance HasBaseClass Texture3D where
        type BaseClass Texture3D = TextureLayered
        super = coerce

-- | Array of textures stored in a single primitive.
--   @TextureArray@s store an array of images in a single @Texture@ primitive. Each layer of the texture array has its own mipmap chain. This makes it is a good alternative to texture atlases.
newtype TextureArray = TextureArray Object
                         deriving newtype AsVariant

instance HasBaseClass TextureArray where
        type BaseClass TextureArray = TextureLayered
        super = coerce

-- | Texture-based button. Supports Pressed, Hover, Disabled and Focused states.
--   @TextureButton@ has the same functionality as @Button@, except it uses sprites instead of Godot's @Theme@ resource. It is faster to create, but it doesn't support localization like more complex @Control@s.
--   		The "normal" state must contain a texture (@texture_normal@); other textures are optional.
newtype TextureButton = TextureButton Object
                          deriving newtype AsVariant

instance HasBaseClass TextureButton where
        type BaseClass TextureButton = BaseButton
        super = coerce

-- | Base class for 3D texture types.
--   Base class for @Texture3D@ and @TextureArray@. Cannot be used directly, but contains all the functions necessary for accessing and using @Texture3D@ and @TextureArray@. Data is set on a per-layer basis. For @Texture3D@s, the layer sepcifies the depth or Z-index, they can be treated as a bunch of 2D slices. Similarly, for @TextureArray@s, the layer specifies the array layer.
newtype TextureLayered = TextureLayered Object
                           deriving newtype AsVariant

instance HasBaseClass TextureLayered where
        type BaseClass TextureLayered = Resource
        super = coerce

-- | Texture-based progress bar. Useful for loading screens and life or stamina bars.
--   TextureProgress works like @ProgressBar@, but uses up to 3 textures instead of Godot's @Theme@ resource. It can be used to create horizontal, vertical and radial progress bars.
newtype TextureProgress = TextureProgress Object
                            deriving newtype AsVariant

instance HasBaseClass TextureProgress where
        type BaseClass TextureProgress = Range
        super = coerce

-- | Control for drawing textures.
--   Used to draw icons and sprites in a user interface. The texture's placement can be controlled with the @stretch_mode@ property. It can scale, tile, or stay centered inside its bounding rectangle.
--   		__Note:__ You should enable @flip_v@ when using a TextureRect to display a @ViewportTexture@. Alternatively, you can enable @Viewport.render_target_v_flip@ on the Viewport. Otherwise, the image will appear upside down.
newtype TextureRect = TextureRect Object
                        deriving newtype AsVariant

instance HasBaseClass TextureRect where
        type BaseClass TextureRect = Control
        super = coerce

-- | Theme for controls.
--   A theme for skinning controls. Controls can be skinned individually, but for complex applications, it's more practical to just create a global theme that defines everything. This theme can be applied to any @Control@; the Control and its children will automatically use it.
--   		Theme resources can alternatively be loaded by writing them in a @.theme@ file, see the documentation for more information.
newtype Theme = Theme Object
                  deriving newtype AsVariant

instance HasBaseClass Theme where
        type BaseClass Theme = Resource
        super = coerce

-- | Node for 2D tile-based maps.
--    Tilemaps use a @TileSet@ which contain a list of tiles (textures plus optional collision, navigation, and/or occluder shapes) which are used to create grid-based maps.
newtype TileMap = TileMap Object
                    deriving newtype AsVariant

instance HasBaseClass TileMap where
        type BaseClass TileMap = Node2D
        super = coerce

-- | Tile library for tilemaps.
--   A TileSet is a library of tiles for a @TileMap@. It contains a list of tiles, each consisting of a sprite and optional collision shapes.
--   		Tiles are referenced by a unique integer ID.
newtype TileSet = TileSet Object
                    deriving newtype AsVariant

instance HasBaseClass TileSet where
        type BaseClass TileSet = Resource
        super = coerce

-- | A countdown timer.
--   Counts down a specified interval and emits a signal on reaching 0. Can be set to repeat or "one-shot" mode.
--   		__Note:__ To create an one-shot timer without instantiating a node, use @method SceneTree.create_timer@.
newtype Timer = Timer Object
                  deriving newtype AsVariant

instance HasBaseClass Timer where
        type BaseClass Timer = Node
        super = coerce

-- | Flat button helper class.
--   This is a helper class to generate a flat @Button@ (see @Button.flat@), creating a @ToolButton@ is equivalent to:
--   		
--   @
--   
--   		var btn = Button.new()
--   		btn.flat = true
--   		
--   @
newtype ToolButton = ToolButton Object
                       deriving newtype AsVariant

instance HasBaseClass ToolButton where
        type BaseClass ToolButton = Button
        super = coerce

-- | Button for touch screen devices for gameplay use.
--   TouchScreenButton allows you to create on-screen buttons for touch devices. It's intended for gameplay use, such as a unit you have to touch to move.
--   		This node inherits from @Node2D@. Unlike with @Control@ nodes, you cannot set anchors on it. If you want to create menus or user interfaces, you may want to use @Button@ nodes instead. To make button nodes react to touch events, you can enable the Emulate Mouse option in the Project Settings.
--   		You can configure TouchScreenButton to be visible only on touch devices, helping you develop your game both for desktop and mobile devices.
newtype TouchScreenButton = TouchScreenButton Object
                              deriving newtype AsVariant

instance HasBaseClass TouchScreenButton where
        type BaseClass TouchScreenButton = Node2D
        super = coerce

-- | Language Translation.
--   Translations are resources that can be loaded and unloaded on demand. They map a string to another string.
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
--   		Trees are built via code, using @TreeItem@ objects to create the structure. They have a single root but multiple roots can be simulated if a dummy hidden root is added.
--   		
--   @
--   
--   		func _ready():
--   		    var tree = Tree.new()
--   		    var root = tree.create_item()
--   		    tree.set_hide_root(true)
--   		    var child1 = tree.create_item(root)
--   		    var child2 = tree.create_item(root)
--   		    var subchild1 = tree.create_item(child1)
--   		    subchild1.set_text(0, "Subchild1")
--   		
--   @
--   
--   		To iterate over all the @TreeItem@ objects in a @Tree@ object, use @method TreeItem.get_next@ and @method TreeItem.get_children@ after getting the root through @method get_root@. You can use @method Object.free@ on a @TreeItem@ to remove it from the @Tree@.
newtype Tree = Tree Object
                 deriving newtype AsVariant

instance HasBaseClass Tree where
        type BaseClass Tree = Control
        super = coerce

-- | Control for a single item inside a @Tree@.
--    May have child @TreeItem@s and be styled as well as contain buttons.
--   		You can remove a @TreeItem@ by using @method Object.free@.
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
--   Tweens are useful for animations requiring a numerical property to be interpolated over a range of values. The name @i@tween@/i@ comes from @i@in-betweening@/i@, an animation technique where you specify @i@keyframes@/i@ and the computer interpolates the frames that appear between them.
--   		@Tween@ is more suited than @AnimationPlayer@ for animations where you don't know the final values in advance. For example, interpolating a dynamically-chosen camera zoom value is best done with a @Tween@ node; it would be difficult to do the same thing with an @AnimationPlayer@ node.
--   		Here is a brief usage example that makes a 2D node move smoothly between two positions:
--   		
--   @
--   
--   		var tween = get_node("Tween")
--   		tween.interpolate_property($Node2D, "position",
--   		        Vector2(0, 0), Vector2(100, 100), 1,
--   		        Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
--   		tween.start()
--   		
--   @
--   
--   		Many methods require a property name, such as @"position"@ above. You can find the correct property name by hovering over the property in the Inspector. You can also provide the components of a property directly by using @"property:component"@ (eg. @position:x@), where it would only apply to that particular component.
--   		Many of the methods accept @trans_type@ and @ease_type@. The first accepts an @enum TransitionType@ constant, and refers to the way the timing of the animation is handled (see @url=https://easings.net/@easings.net@/url@ for some examples). The second accepts an @enum EaseType@ constant, and controls where the @trans_type@ is applied to the interpolation (in the beginning, the end, or both). If you don't know which transition and easing to pick, you can try different @enum TransitionType@ constants with @EASE_IN_OUT@, and use the one that looks best.
--   		@url=https://raw.githubusercontent.com/godotengine/godot-docs/master/img/tween_cheatsheet.png@Tween easing and transition types cheatsheet@/url@
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
--    It works by registering methods and property changes inside "actions".
--   		Common behavior is to create an action, then add do/undo calls to functions or property changes, then committing the action.
--   		Here's an example on how to add an action to the Godot editor's own @UndoRedo@, from a plugin:
--   		
--   @
--   
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
--   		
--   @
--   
--   		@method create_action@, @method add_do_method@, @method add_undo_method@, @method add_do_property@, @method add_undo_property@, and @method commit_action@ should be called one after the other, like in the example. Not doing so could lead to crashes.
--   		If you don't need to register a method, you can leave @method add_do_method@ and @method add_undo_method@ out; the same goes for properties. You can also register more than one method/property.
newtype UndoRedo = UndoRedo Object
                     deriving newtype AsVariant

instance HasBaseClass UndoRedo where
        type BaseClass UndoRedo = Object
        super = coerce

-- | Vertical box container.
--    See @BoxContainer@.
newtype VBoxContainer = VBoxContainer Object
                          deriving newtype AsVariant

instance HasBaseClass VBoxContainer where
        type BaseClass VBoxContainer = BoxContainer
        super = coerce

-- | Vertical scroll bar.
--   Vertical version of @ScrollBar@, which goes from top (min) to bottom (max).
newtype VScrollBar = VScrollBar Object
                       deriving newtype AsVariant

instance HasBaseClass VScrollBar where
        type BaseClass VScrollBar = ScrollBar
        super = coerce

-- | Vertical version of @Separator@.
--    Even though it looks vertical, it is used to separate objects horizontally.
newtype VSeparator = VSeparator Object
                       deriving newtype AsVariant

instance HasBaseClass VSeparator where
        type BaseClass VSeparator = Separator
        super = coerce

-- | Vertical slider.
--    See @Slider@. This one goes from bottom (min) to top (max).
--   		__Note:__ The @signal Range.changed@ and @signal Range.value_changed@ signals are part of the @Range@ class which this class inherits from.
newtype VSlider = VSlider Object
                    deriving newtype AsVariant

instance HasBaseClass VSlider where
        type BaseClass VSlider = Slider
        super = coerce

-- | Vertical split container.
--    See @SplitContainer@. This goes from top to bottom.
newtype VSplitContainer = VSplitContainer Object
                            deriving newtype AsVariant

instance HasBaseClass VSplitContainer where
        type BaseClass VSplitContainer = SplitContainer
        super = coerce

-- | Physics body that simulates the behavior of a car.
--   This node implements all the physics logic needed to simulate a car. It is based on the raycast vehicle system commonly found in physics engines. You will need to add a @CollisionShape@ for the main body of your vehicle and add @VehicleWheel@ nodes for the wheels. You should also add a @MeshInstance@ to this node for the 3D model of your car but this model should not include meshes for the wheels. You should control the vehicle by using the @brake@, @engine_force@, and @steering@ properties and not change the position or orientation of this node directly.
--   		__Note:__ The origin point of your VehicleBody will determine the center of gravity of your vehicle so it is better to keep this low and move the @CollisionShape@ and @MeshInstance@ upwards.
--   		__Note:__ This class has known issues and isn't designed to provide realistic 3D vehicle physics. If you want advanced vehicle physics, you will probably have to write your own physics integration using another @PhysicsBody@ class.
newtype VehicleBody = VehicleBody Object
                        deriving newtype AsVariant

instance HasBaseClass VehicleBody where
        type BaseClass VehicleBody = RigidBody
        super = coerce

-- | Physics object that simulates the behavior of a wheel.
--   This node needs to be used as a child node of @VehicleBody@ and simulates the behavior of one of its wheels. This node also acts as a collider to detect if the wheel is touching a surface.
--   		__Note:__ This class has known issues and isn't designed to provide realistic 3D vehicle physics. If you want advanced vehicle physics, you will probably have to write your own physics integration using another @PhysicsBody@ class.
newtype VehicleWheel = VehicleWheel Object
                         deriving newtype AsVariant

instance HasBaseClass VehicleWheel where
        type BaseClass VehicleWheel = Spatial
        super = coerce

-- | Control for playing video streams.
--   Control node for playing video streams using @VideoStream@ resources.
--   		Supported video formats are @url=https://www.webmproject.org/@WebM@/url@ (@VideoStreamWebm@), @url=https://www.theora.org/@Ogg Theora@/url@ (@VideoStreamTheora@), and any format exposed via a GDNative plugin using @VideoStreamGDNative@.
newtype VideoPlayer = VideoPlayer Object
                        deriving newtype AsVariant

instance HasBaseClass VideoPlayer where
        type BaseClass VideoPlayer = Control
        super = coerce

-- | Base resource for video streams.
--   Base resource type for all video streams. Classes that derive from @VideoStream@ can all be used as resource types to play back videos in @VideoPlayer@.
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
--   		If a viewport is a child of a @ViewportContainer@, it will automatically take up its size, otherwise it must be set manually.
--   		Viewports can also choose to be audio listeners, so they generate positional audio depending on a 2D or 3D camera child of it.
--   		Also, viewports can be assigned to different screens in case the devices have multiple screens.
--   		Finally, viewports can also behave as render targets, in which case they will not be visible unless the associated texture is used to draw.
newtype Viewport = Viewport Object
                     deriving newtype AsVariant

instance HasBaseClass Viewport where
        type BaseClass Viewport = Node
        super = coerce

-- | Control for holding @Viewport@s.
--   A @Container@ node that holds a @Viewport@, automatically setting its size.
--   		__Note:__ Changing a ViewportContainer's @Control.rect_scale@ will cause its contents to appear distorted. To change its visual size without causing distortion, adjust the node's margins instead (if it's not already in a container).
newtype ViewportContainer = ViewportContainer Object
                              deriving newtype AsVariant

instance HasBaseClass ViewportContainer where
        type BaseClass ViewportContainer = Container
        super = coerce

-- | Texture which displays the content of a @Viewport@.
--   Displays the content of a @Viewport@ node as a dynamic @Texture@. This can be used to mix controls, 2D, and 3D elements in the same scene.
--   		To create a ViewportTexture in code, use the @method Viewport.get_texture@ method on the target viewport.
newtype ViewportTexture = ViewportTexture Object
                            deriving newtype AsVariant

instance HasBaseClass ViewportTexture where
        type BaseClass ViewportTexture = Texture
        super = coerce

-- | Enables certain nodes only when approximately visible.
--   The VisibilityEnabler will disable @RigidBody@ and @AnimationPlayer@ nodes when they are not visible. It will only affect other nodes within the same scene as the VisibilityEnabler itself.
--   		If you just want to receive notifications, use @VisibilityNotifier@ instead.
--   		__Note:__ VisibilityEnabler uses an approximate heuristic for performance reasons. It doesn't take walls and other occlusion into account. The heuristic is an implementation detail and may change in future versions. If you need precise visibility checking, use another method such as adding an @Area@ node as a child of a @Camera@ node and/or @method Vector3.dot@.
--   		__Note:__ VisibilityEnabler will not affect nodes added after scene initialization.
newtype VisibilityEnabler = VisibilityEnabler Object
                              deriving newtype AsVariant

instance HasBaseClass VisibilityEnabler where
        type BaseClass VisibilityEnabler = VisibilityNotifier
        super = coerce

-- | Enables certain nodes only when approximately visible.
--   The VisibilityEnabler2D will disable @RigidBody2D@, @AnimationPlayer@, and other nodes when they are not visible. It will only affect nodes with the same root node as the VisibilityEnabler2D, and the root node itself.
--   		If you just want to receive notifications, use @VisibilityNotifier2D@ instead.
--   		__Note:__ For performance reasons, VisibilityEnabler2D uses an approximate heuristic with precision determined by @ProjectSettings.world/2d/cell_size@. If you need precise visibility checking, use another method such as adding an @Area2D@ node as a child of a @Camera2D@ node.
--   		__Note:__ VisibilityEnabler2D will not affect nodes added after scene initialization.
newtype VisibilityEnabler2D = VisibilityEnabler2D Object
                                deriving newtype AsVariant

instance HasBaseClass VisibilityEnabler2D where
        type BaseClass VisibilityEnabler2D = VisibilityNotifier2D
        super = coerce

-- | Detects approximately when the node is visible on screen.
--   The VisibilityNotifier detects when it is visible on the screen. It also notifies when its bounding rectangle enters or exits the screen or a @Camera@'s view.
--   		If you want nodes to be disabled automatically when they exit the screen, use @VisibilityEnabler@ instead.
--   		__Note:__ VisibilityNotifier uses an approximate heuristic for performance reasons. It does't take walls and other occlusion into account. The heuristic is an implementation detail and may change in future versions. If you need precise visibility checking, use another method such as adding an @Area@ node as a child of a @Camera@ node and/or @method Vector3.dot@.
newtype VisibilityNotifier = VisibilityNotifier Object
                               deriving newtype AsVariant

instance HasBaseClass VisibilityNotifier where
        type BaseClass VisibilityNotifier = Spatial
        super = coerce

-- | Detects approximately when the node is visible on screen.
--   The VisibilityNotifier2D detects when it is visible on the screen. It also notifies when its bounding rectangle enters or exits the screen or a viewport.
--   		If you want nodes to be disabled automatically when they exit the screen, use @VisibilityEnabler2D@ instead.
--   		__Note:__ For performance reasons, VisibilityNotifier2D uses an approximate heuristic with precision determined by @ProjectSettings.world/2d/cell_size@. If you need precise visibility checking, use another method such as adding an @Area2D@ node as a child of a @Camera2D@ node.
newtype VisibilityNotifier2D = VisibilityNotifier2D Object
                                 deriving newtype AsVariant

instance HasBaseClass VisibilityNotifier2D where
        type BaseClass VisibilityNotifier2D = Node2D
        super = coerce

-- | Parent of all visual 3D nodes.
--   The @VisualInstance@ is used to connect a resource to a visual representation. All visual 3D nodes inherit from the @VisualInstance@. In general, you should not access the @VisualInstance@ properties directly as they are accessed and managed by the nodes that inherit from @VisualInstance@. @VisualInstance@ is the node representation of the @VisualServer@ instance.
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
--   		The visual server can be used to bypass the scene system entirely.
--   		Resources are created using the @*_create@ functions.
--   		All objects are drawn to a viewport. You can use the @Viewport@ attached to the @SceneTree@ or you can create one yourself with @method viewport_create@. When using a custom scenario or canvas, the scenario or canvas needs to be attached to the viewport using @method viewport_set_scenario@ or @method viewport_attach_canvas@.
--   		In 3D, all visual objects must be associated with a scenario. The scenario is a visual representation of the world. If accessing the visual server from a running game, the scenario can be accessed from the scene tree from any @Spatial@ node with @method Spatial.get_world@. Otherwise, a scenario can be created with @method scenario_create@.
--   		Similarly in 2D, a canvas is needed to draw all canvas items.
--   		In 3D, all visible objects are comprised of a resource and an instance. A resource can be a mesh, a particle system, a light, or any other 3D object. In order to be visible resources must be attached to an instance using @method instance_set_base@. The instance must also be attached to the scenario using @method instance_set_scenario@ in order to be visible.
--   		In 2D, all visible objects are some form of canvas item. In order to be visible, a canvas item needs to be the child of a canvas attached to a viewport, or it needs to be the child of another canvas item that is eventually attached to the canvas.
newtype VisualServer = VisualServer Object
                         deriving newtype AsVariant

instance HasBaseClass VisualServer where
        type BaseClass VisualServer = Object
        super = coerce

-- | A custom shader program with a visual editor.
--   This class allows you to define a custom shader program that can be used for various materials to render objects.
--   		The visual shader editor creates the shader.
newtype VisualShader = VisualShader Object
                         deriving newtype AsVariant

instance HasBaseClass VisualShader where
        type BaseClass VisualShader = Shader
        super = coerce

-- | Base class for nodes in a visual shader graph.
newtype VisualShaderNode = VisualShaderNode Object
                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNode where
        type BaseClass VisualShaderNode = Resource
        super = coerce

-- | A boolean constant to be used within the visual shader graph.
--   Has only one output port and no inputs.
--   		Translated to @bool@ in the shader language.
newtype VisualShaderNodeBooleanConstant = VisualShaderNodeBooleanConstant Object
                                            deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeBooleanConstant where
        type BaseClass VisualShaderNodeBooleanConstant = VisualShaderNode
        super = coerce

-- | A boolean uniform to be used within the visual shader graph.
--   Translated to @uniform bool@ in the shader language.
newtype VisualShaderNodeBooleanUniform = VisualShaderNodeBooleanUniform Object
                                           deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeBooleanUniform where
        type BaseClass VisualShaderNodeBooleanUniform =
             VisualShaderNodeUniform
        super = coerce

-- | A @Color@ constant to be used within the visual shader graph.
--   Has two output ports representing RGB and alpha channels of @Color@.
--   		Translated to @vec3 rgb@ and @float alpha@ in the shader language.
newtype VisualShaderNodeColorConstant = VisualShaderNodeColorConstant Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeColorConstant where
        type BaseClass VisualShaderNodeColorConstant = VisualShaderNode
        super = coerce

-- | A @Color@ function to be used within the visual shader graph.
--   Accept a @Color@ to the input port and transform it according to @function@.
newtype VisualShaderNodeColorFunc = VisualShaderNodeColorFunc Object
                                      deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeColorFunc where
        type BaseClass VisualShaderNodeColorFunc = VisualShaderNode
        super = coerce

-- | A @Color@ operator to be used within the visual shader graph.
--   Applies @operator@ to two color inputs.
newtype VisualShaderNodeColorOp = VisualShaderNodeColorOp Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeColorOp where
        type BaseClass VisualShaderNodeColorOp = VisualShaderNode
        super = coerce

-- | A @Color@ uniform to be used within the visual shader graph.
--   Translated to @uniform vec4@ in the shader language.
newtype VisualShaderNodeColorUniform = VisualShaderNodeColorUniform Object
                                         deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeColorUniform where
        type BaseClass VisualShaderNodeColorUniform =
             VisualShaderNodeUniform
        super = coerce

-- | A comparison function for common types within the visual shader graph.
--   Compares @a@ and @b@ of @type@ by @function@. Returns a boolean scalar. Translates to @if@ instruction in shader code.
newtype VisualShaderNodeCompare = VisualShaderNodeCompare Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeCompare where
        type BaseClass VisualShaderNodeCompare = VisualShaderNode
        super = coerce

-- | A @CubeMap@ sampling node to be used within the visual shader graph.
--   Translated to @texture(cubemap, vec3)@ in the shader language. Returns a color vector and alpha channel as scalar.
newtype VisualShaderNodeCubeMap = VisualShaderNodeCubeMap Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeCubeMap where
        type BaseClass VisualShaderNodeCubeMap = VisualShaderNode
        super = coerce

-- | A @CubeMap@ uniform node to be used within the visual shader graph.
--   Translated to @uniform samplerCube@ in the shader language. The output value can be used as port for @VisualShaderNodeCubeMap@.
newtype VisualShaderNodeCubeMapUniform = VisualShaderNodeCubeMapUniform Object
                                           deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeCubeMapUniform where
        type BaseClass VisualShaderNodeCubeMapUniform =
             VisualShaderNodeTextureUniform
        super = coerce

-- | Virtual class to define custom @VisualShaderNode@s for use in the Visual Shader Editor.
--   By inheriting this class you can create a custom @VisualShader@ script addon which will be automatically added to the Visual Shader Editor. The @VisualShaderNode@'s behavior is defined by overriding the provided virtual methods.
--   		In order for the node to be registered as an editor addon, you must use the @tool@ keyword and provide a @class_name@ for your custom script. For example:
--   		
--   @
--   
--   		tool
--   		extends VisualShaderNodeCustom
--   		class_name VisualShaderNodeNoise
--   		
--   @
newtype VisualShaderNodeCustom = VisualShaderNodeCustom Object
                                   deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeCustom where
        type BaseClass VisualShaderNodeCustom = VisualShaderNode
        super = coerce

-- | Calculates the determinant of a @Transform@ within the visual shader graph.
--   Translates to @deteminant(x)@ in the shader language.
newtype VisualShaderNodeDeterminant = VisualShaderNodeDeterminant Object
                                        deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeDeterminant where
        type BaseClass VisualShaderNodeDeterminant = VisualShaderNode
        super = coerce

-- | Calculates a dot product of two vectors within the visual shader graph.
--   Translates to @dot(a, b)@ in the shader language.
newtype VisualShaderNodeDotProduct = VisualShaderNodeDotProduct Object
                                       deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeDotProduct where
        type BaseClass VisualShaderNodeDotProduct = VisualShaderNode
        super = coerce

-- | A custom visual shader graph expression written in Godot Shading Language.
--   Custom Godot Shading Language expression, with a custom amount of input and output ports.
--   		The provided code is directly injected into the graph's matching shader function (@vertex@, @fragment@, or @light@), so it cannot be used to to declare functions, varyings, uniforms, or global constants. See @VisualShaderNodeGlobalExpression@ for such global definitions.
newtype VisualShaderNodeExpression = VisualShaderNodeExpression Object
                                       deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeExpression where
        type BaseClass VisualShaderNodeExpression =
             VisualShaderNodeGroupBase
        super = coerce

-- | Returns the vector that points in the same direction as a reference vector within the visual shader graph.
--   Translates to @faceforward(N, I, Nref)@ in the shader language. The function has three vector parameters: @N@, the vector to orient, @I@, the incident vector, and @Nref@, the reference vector. If the dot product of @I@ and @Nref@ is smaller than zero the return value is @N@. Otherwise @-N@ is returned.
newtype VisualShaderNodeFaceForward = VisualShaderNodeFaceForward Object
                                        deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeFaceForward where
        type BaseClass VisualShaderNodeFaceForward = VisualShaderNode
        super = coerce

-- | A Fresnel effect to be used within the visual shader graph.
--   Returns falloff based on the dot product of surface normal and view direction of camera (pass associated inputs to it).
newtype VisualShaderNodeFresnel = VisualShaderNodeFresnel Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeFresnel where
        type BaseClass VisualShaderNodeFresnel = VisualShaderNode
        super = coerce

-- | A custom global visual shader graph expression written in Godot Shading Language.
--   Custom Godot Shader Language expression, which is placed on top of the generated shader. You can place various function definitions inside to call later in @VisualShaderNodeExpression@s (which are injected in the main shader functions). You can also declare varyings, uniforms and global constants.
newtype VisualShaderNodeGlobalExpression = VisualShaderNodeGlobalExpression Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeGlobalExpression where
        type BaseClass VisualShaderNodeGlobalExpression =
             VisualShaderNodeExpression
        super = coerce

-- | Base class for a family of nodes with variable amount of input and output ports within the visual shader graph.
--   Currently, has no direct usage, use the derived classes instead.
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

-- | A boolean comparison operator to be used within the visual shader graph.
--   Returns the boolean result of the comparison between @INF@ or @NaN@ and a scalar parameter.
newtype VisualShaderNodeIs = VisualShaderNodeIs Object
                               deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeIs where
        type BaseClass VisualShaderNodeIs = VisualShaderNode
        super = coerce

-- | Calculates an outer product of two vectors within the visual shader graph.
--   @OuterProduct@ treats the first parameter @c@ as a column vector (matrix with one column) and the second parameter @r@ as a row vector (matrix with one row) and does a linear algebraic matrix multiply @c * r@, yielding a matrix whose number of rows is the number of components in @c@ and whose number of columns is the number of components in @r@.
newtype VisualShaderNodeOuterProduct = VisualShaderNodeOuterProduct Object
                                         deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeOuterProduct where
        type BaseClass VisualShaderNodeOuterProduct = VisualShaderNode
        super = coerce

-- | Represents the output shader parameters within the visual shader graph.
--   This visual shader node is present in all shader graphs in form of "Output" block with mutliple output value ports.
newtype VisualShaderNodeOutput = VisualShaderNodeOutput Object
                                   deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeOutput where
        type BaseClass VisualShaderNodeOutput = VisualShaderNode
        super = coerce

-- | Clamps a scalar value within the visual shader graph.
--   Constrains a value to lie between @min@ and @max@ values.
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

-- | Calculates a scalar derivative within the visual shader graph.
--   This node is only available in @Fragment@ and @Light@ visual shaders.
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

-- | Linearly interpolates between two scalars within the visual shader graph.
--   Translates to @mix(a, b, weight)@ in the shader language.
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

-- | Calculates a scalar SmoothStep function within the visual shader graph.
--   Translates to @smoothstep(edge0, edge1, x)@ in the shader language.
--   		Returns @0.0@ if @x@ is smaller than @edge0@ and @1.0@ if @x@ is larger than @edge1@. Otherwise the return value is interpolated between @0.0@ and @1.0@ using Hermite polynomials.
newtype VisualShaderNodeScalarSmoothStep = VisualShaderNodeScalarSmoothStep Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeScalarSmoothStep where
        type BaseClass VisualShaderNodeScalarSmoothStep = VisualShaderNode
        super = coerce

-- | A boolean/scalar function for use within the visual shader graph.
--   Returns an associated scalar if the provided boolean value is @true@ or @false@.
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

-- | A boolean/vector function for use within the visual shader graph.
--   Returns an associated vector if the provided boolean value is @true@ or @false@.
newtype VisualShaderNodeSwitch = VisualShaderNodeSwitch Object
                                   deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeSwitch where
        type BaseClass VisualShaderNodeSwitch = VisualShaderNode
        super = coerce

-- | Performs a texture lookup within the visual shader graph.
--   Performs a lookup operation on the provided texture, with support for multiple texture sources to choose from.
newtype VisualShaderNodeTexture = VisualShaderNodeTexture Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTexture where
        type BaseClass VisualShaderNodeTexture = VisualShaderNode
        super = coerce

-- | Performs a uniform texture lookup within the visual shader graph.
--   Performs a lookup operation on the texture provided as a uniform for the shader.
newtype VisualShaderNodeTextureUniform = VisualShaderNodeTextureUniform Object
                                           deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTextureUniform where
        type BaseClass VisualShaderNodeTextureUniform =
             VisualShaderNodeUniform
        super = coerce

-- | Performs a uniform texture lookup with triplanar within the visual shader graph.
--   Performs a lookup operation on the texture provided as a uniform for the shader, with support for triplanar mapping.
newtype VisualShaderNodeTextureUniformTriplanar = VisualShaderNodeTextureUniformTriplanar Object
                                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTextureUniformTriplanar where
        type BaseClass VisualShaderNodeTextureUniformTriplanar =
             VisualShaderNodeTextureUniform
        super = coerce

-- | Composes a @Transform@ from four @Vector3@s within the visual shader graph.
--   Creates a 4x4 transform matrix using four vectors of type @vec3@. Each vector is one row in the matrix and the last column is a @vec4(0, 0, 0, 1)@.
newtype VisualShaderNodeTransformCompose = VisualShaderNodeTransformCompose Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformCompose where
        type BaseClass VisualShaderNodeTransformCompose = VisualShaderNode
        super = coerce

-- | A @Transform@ constant for use within the visual shader graph.
--   A constant @Transform@, which can be used as an input node.
newtype VisualShaderNodeTransformConstant = VisualShaderNodeTransformConstant Object
                                              deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformConstant where
        type BaseClass VisualShaderNodeTransformConstant = VisualShaderNode
        super = coerce

-- | Decomposes a @Transform@ into four @Vector3@s within the visual shader graph.
--   Takes a 4x4 transform matrix and decomposes it into four @vec3@ values, one from each row of the matrix.
newtype VisualShaderNodeTransformDecompose = VisualShaderNodeTransformDecompose Object
                                               deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformDecompose where
        type BaseClass VisualShaderNodeTransformDecompose =
             VisualShaderNode
        super = coerce

-- | Computes a @Transform@ function within the visual shader graph.
--   Computes an inverse or transpose function on the provided @Transform@.
newtype VisualShaderNodeTransformFunc = VisualShaderNodeTransformFunc Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformFunc where
        type BaseClass VisualShaderNodeTransformFunc = VisualShaderNode
        super = coerce

-- | Multiplies @Transform@ by @Transform@ within the visual shader graph.
--   A multiplication operation on two transforms (4x4 matrices), with support for different multiplication operators.
newtype VisualShaderNodeTransformMult = VisualShaderNodeTransformMult Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformMult where
        type BaseClass VisualShaderNodeTransformMult = VisualShaderNode
        super = coerce

-- | A @Transform@ uniform for use within the visual shader graph.
--   Translated to @uniform mat4@ in the shader language.
newtype VisualShaderNodeTransformUniform = VisualShaderNodeTransformUniform Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformUniform where
        type BaseClass VisualShaderNodeTransformUniform =
             VisualShaderNodeUniform
        super = coerce

-- | Multiplies a @Transform@ and a @Vector3@ within the visual shader graph.
--   A multiplication operation on a transform (4x4 matrix) and a vector, with support for different multiplication operators.
newtype VisualShaderNodeTransformVecMult = VisualShaderNodeTransformVecMult Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeTransformVecMult where
        type BaseClass VisualShaderNodeTransformVecMult = VisualShaderNode
        super = coerce

-- | A base type for the uniforms within the visual shader graph.
--   A uniform represents a variable in the shader which is set externally, i.e. from the @ShaderMaterial@. Uniforms are exposed as properties in the @ShaderMaterial@ and can be assigned from the inspector or from a script.
newtype VisualShaderNodeUniform = VisualShaderNodeUniform Object
                                    deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeUniform where
        type BaseClass VisualShaderNodeUniform = VisualShaderNode
        super = coerce

-- | A @Vector3@ constant to be used within the visual shader graph.
--   A constant @Vector3@, which can be used as an input node.
newtype VisualShaderNodeVec3Constant = VisualShaderNodeVec3Constant Object
                                         deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVec3Constant where
        type BaseClass VisualShaderNodeVec3Constant = VisualShaderNode
        super = coerce

-- | A @Vector3@ uniform to be used within the visual shader graph.
--   Translated to @uniform vec3@ in the shader language.
newtype VisualShaderNodeVec3Uniform = VisualShaderNodeVec3Uniform Object
                                        deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVec3Uniform where
        type BaseClass VisualShaderNodeVec3Uniform =
             VisualShaderNodeUniform
        super = coerce

-- | Clamps a vector value within the visual shader graph.
--   Constrains a value to lie between @min@ and @max@ values. The operation is performed on each component of the vector individually.
newtype VisualShaderNodeVectorClamp = VisualShaderNodeVectorClamp Object
                                        deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorClamp where
        type BaseClass VisualShaderNodeVectorClamp = VisualShaderNode
        super = coerce

-- | Composes a @Vector3@ from three scalars within the visual shader graph.
--   Creates a @vec3@ using three scalar values that can be provided from separate inputs.
newtype VisualShaderNodeVectorCompose = VisualShaderNodeVectorCompose Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorCompose where
        type BaseClass VisualShaderNodeVectorCompose = VisualShaderNode
        super = coerce

-- | Decomposes a @Vector3@ into three scalars within the visual shader graph.
--   Takes a @vec3@ and decomposes it into three scalar values that can be used as separate inputs.
newtype VisualShaderNodeVectorDecompose = VisualShaderNodeVectorDecompose Object
                                            deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorDecompose where
        type BaseClass VisualShaderNodeVectorDecompose = VisualShaderNode
        super = coerce

-- | Calculates a vector derivative within the visual shader graph.
--   This node is only available in @Fragment@ and @Light@ visual shaders.
newtype VisualShaderNodeVectorDerivativeFunc = VisualShaderNodeVectorDerivativeFunc Object
                                                 deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorDerivativeFunc where
        type BaseClass VisualShaderNodeVectorDerivativeFunc =
             VisualShaderNode
        super = coerce

-- | Returns the distance between two points. To be used within the visual shader graph.
--   Calculates distance from point represented by vector @p0@ to vector @p1@.
--   		Translated to @distance(p0, p1)@ in the shader language.
newtype VisualShaderNodeVectorDistance = VisualShaderNodeVectorDistance Object
                                           deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorDistance where
        type BaseClass VisualShaderNodeVectorDistance = VisualShaderNode
        super = coerce

-- | A vector function to be used within the visual shader graph.
--   A visual shader node able to perform different functions using vectors.
newtype VisualShaderNodeVectorFunc = VisualShaderNodeVectorFunc Object
                                       deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorFunc where
        type BaseClass VisualShaderNodeVectorFunc = VisualShaderNode
        super = coerce

-- | Linearly interpolates between two vectors within the visual shader graph.
--   Translates to @mix(a, b, weight)@ in the shader language, where @weight@ is a @Vector3@ with weights for each component.
newtype VisualShaderNodeVectorInterp = VisualShaderNodeVectorInterp Object
                                         deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorInterp where
        type BaseClass VisualShaderNodeVectorInterp = VisualShaderNode
        super = coerce

-- | Returns the length of a @Vector3@ within the visual shader graph.
--   Translated to @length(p0)@ in the shader language.
newtype VisualShaderNodeVectorLen = VisualShaderNodeVectorLen Object
                                      deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorLen where
        type BaseClass VisualShaderNodeVectorLen = VisualShaderNode
        super = coerce

-- | A vector operator to be used within the visual shader graph.
--   A visual shader node for use of vector operators. Operates on vector @a@ and vector @b@.
newtype VisualShaderNodeVectorOp = VisualShaderNodeVectorOp Object
                                     deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorOp where
        type BaseClass VisualShaderNodeVectorOp = VisualShaderNode
        super = coerce

-- | Returns the @Vector3@ that points in the direction of refraction. For use within the visual shader graph.
--   Translated to @refract(I, N, eta)@ in the shader language, where @I@ is the incident vector, @N@ is the normal vector and @eta@ is the ratio of the indicies of the refraction.
newtype VisualShaderNodeVectorRefract = VisualShaderNodeVectorRefract Object
                                          deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorRefract where
        type BaseClass VisualShaderNodeVectorRefract = VisualShaderNode
        super = coerce

-- | Linearly interpolates between two vectors using a scalar. For use within the visual shader graph.
--   Translates to @mix(a, b, weight)@ in the shader language, where @a@ and @b@ are vectors and @weight@ is a scalar.
newtype VisualShaderNodeVectorScalarMix = VisualShaderNodeVectorScalarMix Object
                                            deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorScalarMix where
        type BaseClass VisualShaderNodeVectorScalarMix = VisualShaderNode
        super = coerce

-- | Calculates a vector SmoothStep function using scalar within the visual shader graph.
--   Translates to @smoothstep(edge0, edge1, x)@ in the shader language, where @x@ is a scalar.
--   		Returns @0.0@ if @x@ is smaller than @edge0@ and @1.0@ if @x@ is larger than @edge1@. Otherwise the return value is interpolated between @0.0@ and @1.0@ using Hermite polynomials.
newtype VisualShaderNodeVectorScalarSmoothStep = VisualShaderNodeVectorScalarSmoothStep Object
                                                   deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorScalarSmoothStep where
        type BaseClass VisualShaderNodeVectorScalarSmoothStep =
             VisualShaderNode
        super = coerce

-- | Calculates a vector Step function within the visual shader graph.
--   Translates to @step(edge, x)@ in the shader language.
--   		Returns @0.0@ if @x@ is smaller than @edge@ and @1.0@ otherwise.
newtype VisualShaderNodeVectorScalarStep = VisualShaderNodeVectorScalarStep Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorScalarStep where
        type BaseClass VisualShaderNodeVectorScalarStep = VisualShaderNode
        super = coerce

-- | Calculates a vector SmoothStep function within the visual shader graph.
--   Translates to @smoothstep(edge0, edge1, x)@ in the shader language, where @x@ is a vector.
--   		Returns @0.0@ if @x@ is smaller than @edge0@ and @1.0@ if @x@ is larger than @edge1@. Otherwise the return value is interpolated between @0.0@ and @1.0@ using Hermite polynomials.
newtype VisualShaderNodeVectorSmoothStep = VisualShaderNodeVectorSmoothStep Object
                                             deriving newtype AsVariant

instance HasBaseClass VisualShaderNodeVectorSmoothStep where
        type BaseClass VisualShaderNodeVectorSmoothStep = VisualShaderNode
        super = coerce

-- | Holds an @Object@, but does not contribute to the reference count if the object is a reference.
--   A weakref can hold a @Reference@, without contributing to the reference counter. A weakref can be created from an @Object@ using @method @GDScript.weakref@. If this object is not a reference, weakref still works, however, it does not have any effect on the object. Weakrefs are useful in cases where multiple classes have variables that refer to each other. Without weakrefs, using these classes could lead to memory leaks, since both references keep each other from being released. Making part of the variables a weakref can prevent this cyclic dependency, and allows the references to be released.
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
--   Windowdialog is the base class for all window-based dialogs. It's a by-default toplevel @Control@ that draws a window decoration and allows motion and resizing.
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
--   The @WorldEnvironment@ node is used to configure the default @Environment@ for the scene.
--   		The parameters defined in the @WorldEnvironment@ can be overridden by an @Environment@ node set on the current @Camera@. Additionally, only one @WorldEnvironment@ may be instanced in a given scene at a time.
--   		The @WorldEnvironment@ allows the user to specify default lighting parameters (e.g. ambient lighting), various post-processing effects (e.g. SSAO, DOF, Tonemapping), and how to draw the background (e.g. solid color, skybox). Usually, these are added in order to improve the realism/color balance of the scene.
newtype WorldEnvironment = WorldEnvironment Object
                             deriving newtype AsVariant

instance HasBaseClass WorldEnvironment where
        type BaseClass WorldEnvironment = Node
        super = coerce

-- | An X509 certificate (e.g. for SSL).
--   The X509Certificate class represents an X509 certificate. Certificates can be loaded and saved like any other @Resource@.
--   		They can be used as the server certificate in @method StreamPeerSSL.accept_stream@ (along with the proper @CryptoKey@), and to specify the only certificate that should be accepted when connecting to an SSL server via @method StreamPeerSSL.connect_to_stream@.
--   		__Note:__ Not available in HTML5 exports.
newtype X509Certificate = X509Certificate Object
                            deriving newtype AsVariant

instance HasBaseClass X509Certificate where
        type BaseClass X509Certificate = Resource
        super = coerce

-- | Low-level class for creating parsers for @url=https://en.wikipedia.org/wiki/XML@XML@/url@ files.
--   This class can serve as base to make custom XML parsers. Since XML is a very flexible standard, this interface is low-level so it can be applied to any possible schema.
newtype XMLParser = XMLParser Object
                      deriving newtype AsVariant

instance HasBaseClass XMLParser where
        type BaseClass XMLParser = Reference
        super = coerce

-- | Sort all child nodes based on their Y positions.
--    The child node must inherit from @CanvasItem@ for it to be sorted. Nodes that have a higher Y position will be drawn later, so they will appear on top of nodes that have a lower Y position.
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
--   		When creating a new @Directory@, its default opened directory will be @res://@. This may change in the future, so it is advised to always use @method open@ to initialize your @Directory@ where you want to operate, with explicit error checking.
--   		Here is an example on how to iterate through the files of a directory:
--   		
--   @
--   
--   		func dir_contents(path):
--   		    var dir = Directory.new()
--   		    if dir.open(path) == OK:
--   		        dir.list_dir_begin()
--   		        var file_name = dir.get_next()
--   		        while file_name != "":
--   		            if dir.current_is_dir():
--   		                print("Found directory: " + file_name)
--   		            else:
--   		                print("Found file: " + file_name)
--   		            file_name = dir.get_next()
--   		    else:
--   		        print("An error occurred when trying to access the path.")
--   		
--   @
newtype Directory = Directory Object
                      deriving newtype AsVariant

instance HasBaseClass Directory where
        type BaseClass Directory = Reference
        super = coerce

-- | Access to engine properties.
--   The @Engine@ singleton allows you to query and modify the project's run-time parameters, such as frames per second, time scale, and others.
newtype Engine = Engine Object
                   deriving newtype AsVariant

instance HasBaseClass Engine where
        type BaseClass Engine = Object
        super = coerce

-- | Type to handle file reading and writing operations.
--   File type. This is used to permanently store data into the user device's file system and to read from it. This can be used to store game save data or player configuration files, for example.
--   		Here's a sample on how to write and read from a file:
--   		
--   @
--   
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
--   		
--   @
--   
--   		In the example above, the file will be saved in the user data folder as specified in the @url=https://docs.godotengine.org/en/latest/tutorials/io/data_paths.html@Data paths@/url@ documentation.
newtype File = File Object
                 deriving newtype AsVariant

instance HasBaseClass File where
        type BaseClass File = Reference
        super = coerce

-- | Helper node to calculate generic geometry operations.
--   Geometry provides users with a set of helper functions to create geometric shapes, compute intersections between shapes, and process various other geometric operations.
newtype Geometry = Geometry Object
                     deriving newtype AsVariant

instance HasBaseClass Geometry where
        type BaseClass Geometry = Object
        super = coerce

-- | Helper class for parsing JSON data.
--    For usage example and other important hints, see @JSONParseResult@.
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

-- | A synchronization mutex (mutual exclusion).
--    This is used to synchronize multiple @Thread@s, and is equivalent to a binary @Semaphore@. It guarantees that only one thread can ever acquire the lock at a time. A mutex can be used to protect a critical section; however, be careful to avoid deadlocks.
newtype Mutex = Mutex Object
                  deriving newtype AsVariant

instance HasBaseClass Mutex where
        type BaseClass Mutex = Reference
        super = coerce

-- | Operating System functions.
--    OS wraps the most common functionality to communicate with the host operating system, such as the clipboard, video driver, date and time, timers, environment variables, execution of binaries, command line, etc.
newtype OS = OS Object
               deriving newtype AsVariant

instance HasBaseClass OS where
        type BaseClass OS = Object
        super = coerce

-- | Singleton used to load resource files.
--   Singleton used to load resource files from the filesystem.
--   		It uses the many @ResourceFormatLoader@ classes registered in the engine (either built-in or from a plugin) to load files into memory and convert them to a format that can be used by the engine.
--   		GDScript has a simplified @method @GDScript.load@ built-in method which can be used in most situations, leaving the use of @ResourceLoader@ for more advanced scenarios.
newtype ResourceLoader = ResourceLoader Object
                           deriving newtype AsVariant

instance HasBaseClass ResourceLoader where
        type BaseClass ResourceLoader = Object
        super = coerce

-- | Singleton for saving Godot-specific resource types.
--   Singleton for saving Godot-specific resource types to the filesystem.
--   		It uses the many @ResourceFormatSaver@ classes registered in the engine (either built-in or from a plugin) to save engine-specific resource data to text-based (e.g. @.tres@ or @.tscn@) or binary files (e.g. @.res@ or @.scn@).
newtype ResourceSaver = ResourceSaver Object
                          deriving newtype AsVariant

instance HasBaseClass ResourceSaver where
        type BaseClass ResourceSaver = Object
        super = coerce

-- | A synchronization semaphore.
--   A synchronization semaphore which can be used to synchronize multiple @Thread@s. Initialized to zero on creation. Be careful to avoid deadlocks. For a binary version, see @Mutex@.
newtype Semaphore = Semaphore Object
                      deriving newtype AsVariant

instance HasBaseClass Semaphore where
        type BaseClass Semaphore = Reference
        super = coerce

-- | A unit of execution in a process.
--    Can run methods on @Object@s simultaneously. The use of synchronization via @Mutex@ or @Semaphore@ is advised if working with shared objects.
--   		__Note:__ Breakpoints won't break on code if it's running in a thread. This is a current limitation of the GDScript debugger.
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

deriveBase ''GlobalConstants

deriveBase ''ARVRAnchor

deriveBase ''ARVRCamera

deriveBase ''ARVRController

deriveBase ''ARVRInterface

deriveBase ''ARVRInterfaceGDNative

deriveBase ''ARVROrigin

deriveBase ''ARVRPositionalTracker

deriveBase ''ARVRServer

deriveBase ''AStar

deriveBase ''AStar2D

deriveBase ''AcceptDialog

deriveBase ''AnimatedSprite

deriveBase ''AnimatedSprite3D

deriveBase ''AnimatedTexture

deriveBase ''Animation

deriveBase ''AnimationNode

deriveBase ''AnimationNodeAdd2

deriveBase ''AnimationNodeAdd3

deriveBase ''AnimationNodeAnimation

deriveBase ''AnimationNodeBlend2

deriveBase ''AnimationNodeBlend3

deriveBase ''AnimationNodeBlendSpace1D

deriveBase ''AnimationNodeBlendSpace2D

deriveBase ''AnimationNodeBlendTree

deriveBase ''AnimationNodeOneShot

deriveBase ''AnimationNodeOutput

deriveBase ''AnimationNodeStateMachine

deriveBase ''AnimationNodeStateMachinePlayback

deriveBase ''AnimationNodeStateMachineTransition

deriveBase ''AnimationNodeTimeScale

deriveBase ''AnimationNodeTimeSeek

deriveBase ''AnimationNodeTransition

deriveBase ''AnimationPlayer

deriveBase ''AnimationRootNode

deriveBase ''AnimationTrackEditPlugin

deriveBase ''AnimationTree

deriveBase ''AnimationTreePlayer

deriveBase ''Area

deriveBase ''Area2D

deriveBase ''ArrayMesh

deriveBase ''AtlasTexture

deriveBase ''AudioBusLayout

deriveBase ''AudioEffect

deriveBase ''AudioEffectAmplify

deriveBase ''AudioEffectBandLimitFilter

deriveBase ''AudioEffectBandPassFilter

deriveBase ''AudioEffectChorus

deriveBase ''AudioEffectCompressor

deriveBase ''AudioEffectDelay

deriveBase ''AudioEffectDistortion

deriveBase ''AudioEffectEQ

deriveBase ''AudioEffectEQ10

deriveBase ''AudioEffectEQ21

deriveBase ''AudioEffectEQ6

deriveBase ''AudioEffectFilter

deriveBase ''AudioEffectHighPassFilter

deriveBase ''AudioEffectHighShelfFilter

deriveBase ''AudioEffectInstance

deriveBase ''AudioEffectLimiter

deriveBase ''AudioEffectLowPassFilter

deriveBase ''AudioEffectLowShelfFilter

deriveBase ''AudioEffectNotchFilter

deriveBase ''AudioEffectPanner

deriveBase ''AudioEffectPhaser

deriveBase ''AudioEffectPitchShift

deriveBase ''AudioEffectRecord

deriveBase ''AudioEffectReverb

deriveBase ''AudioEffectSpectrumAnalyzer

deriveBase ''AudioEffectSpectrumAnalyzerInstance

deriveBase ''AudioEffectStereoEnhance

deriveBase ''AudioServer

deriveBase ''AudioStream

deriveBase ''AudioStreamGenerator

deriveBase ''AudioStreamGeneratorPlayback

deriveBase ''AudioStreamMicrophone

deriveBase ''AudioStreamOGGVorbis

deriveBase ''AudioStreamPlayback

deriveBase ''AudioStreamPlaybackResampled

deriveBase ''AudioStreamPlayer

deriveBase ''AudioStreamPlayer2D

deriveBase ''AudioStreamPlayer3D

deriveBase ''AudioStreamRandomPitch

deriveBase ''AudioStreamSample

deriveBase ''BackBufferCopy

deriveBase ''BakedLightmap

deriveBase ''BakedLightmapData

deriveBase ''BaseButton

deriveBase ''BitMap

deriveBase ''BitmapFont

deriveBase ''Bone2D

deriveBase ''BoneAttachment

deriveBase ''BoxContainer

deriveBase ''BoxShape

deriveBase ''BulletPhysicsDirectBodyState

deriveBase ''BulletPhysicsServer

deriveBase ''Button

deriveBase ''ButtonGroup

deriveBase ''CPUParticles

deriveBase ''CPUParticles2D

deriveBase ''CSGBox

deriveBase ''CSGCombiner

deriveBase ''CSGCylinder

deriveBase ''CSGMesh

deriveBase ''CSGPolygon

deriveBase ''CSGPrimitive

deriveBase ''CSGShape

deriveBase ''CSGSphere

deriveBase ''CSGTorus

deriveBase ''Camera

deriveBase ''Camera2D

deriveBase ''CameraFeed

deriveBase ''CameraServer

deriveBase ''CameraTexture

deriveBase ''CanvasItem

deriveBase ''CanvasItemMaterial

deriveBase ''CanvasLayer

deriveBase ''CanvasModulate

deriveBase ''CapsuleMesh

deriveBase ''CapsuleShape

deriveBase ''CapsuleShape2D

deriveBase ''CenterContainer

deriveBase ''CharFXTransform

deriveBase ''CheckBox

deriveBase ''CheckButton

deriveBase ''CircleShape2D

deriveBase ''ClippedCamera

deriveBase ''CollisionObject

deriveBase ''CollisionObject2D

deriveBase ''CollisionPolygon

deriveBase ''CollisionPolygon2D

deriveBase ''CollisionShape

deriveBase ''CollisionShape2D

deriveBase ''ColorPicker

deriveBase ''ColorPickerButton

deriveBase ''ColorRect

deriveBase ''ConcavePolygonShape

deriveBase ''ConcavePolygonShape2D

deriveBase ''ConeTwistJoint

deriveBase ''ConfigFile

deriveBase ''ConfirmationDialog

deriveBase ''Container

deriveBase ''Control

deriveBase ''ConvexPolygonShape

deriveBase ''ConvexPolygonShape2D

deriveBase ''Crypto

deriveBase ''CryptoKey

deriveBase ''CubeMap

deriveBase ''CubeMesh

deriveBase ''Curve

deriveBase ''Curve2D

deriveBase ''Curve3D

deriveBase ''CurveTexture

deriveBase ''CylinderMesh

deriveBase ''CylinderShape

deriveBase ''DampedSpringJoint2D

deriveBase ''DirectionalLight

deriveBase ''DynamicFont

deriveBase ''DynamicFontData

deriveBase ''EditorExportPlugin

deriveBase ''EditorFeatureProfile

deriveBase ''EditorFileDialog

deriveBase ''EditorFileSystem

deriveBase ''EditorFileSystemDirectory

deriveBase ''EditorImportPlugin

deriveBase ''EditorInspector

deriveBase ''EditorInspectorPlugin

deriveBase ''EditorInterface

deriveBase ''EditorNavigationMeshGenerator

deriveBase ''EditorPlugin

deriveBase ''EditorProperty

deriveBase ''EditorResourceConversionPlugin

deriveBase ''EditorResourcePreview

deriveBase ''EditorResourcePreviewGenerator

deriveBase ''EditorSceneImporter

deriveBase ''EditorSceneImporterAssimp

deriveBase ''EditorScenePostImport

deriveBase ''EditorScript

deriveBase ''EditorSelection

deriveBase ''EditorSettings

deriveBase ''EditorSpatialGizmo

deriveBase ''EditorSpatialGizmoPlugin

deriveBase ''EditorSpinSlider

deriveBase ''EditorVCSInterface

deriveBase ''EncodedObjectAsID

deriveBase ''Environment

deriveBase ''Expression

deriveBase ''FileDialog

deriveBase ''Font

deriveBase ''FuncRef

deriveBase ''GDNative

deriveBase ''GDNativeLibrary

deriveBase ''GDScript

deriveBase ''GDScriptFunctionState

deriveBase ''GIProbe

deriveBase ''GIProbeData

deriveBase ''Generic6DOFJoint

deriveBase ''GeometryInstance

deriveBase ''Gradient

deriveBase ''GradientTexture

deriveBase ''GraphEdit

deriveBase ''GraphNode

deriveBase ''GridContainer

deriveBase ''GridMap

deriveBase ''GrooveJoint2D

deriveBase ''HBoxContainer

deriveBase ''HScrollBar

deriveBase ''HSeparator

deriveBase ''HSlider

deriveBase ''HSplitContainer

deriveBase ''HTTPClient

deriveBase ''HTTPRequest

deriveBase ''HashingContext

deriveBase ''HeightMapShape

deriveBase ''HingeJoint

deriveBase ''IP

deriveBase ''IP_Unix

deriveBase ''Image

deriveBase ''ImageTexture

deriveBase ''ImmediateGeometry

deriveBase ''Input

deriveBase ''InputDefault

deriveBase ''InputEvent

deriveBase ''InputEventAction

deriveBase ''InputEventGesture

deriveBase ''InputEventJoypadButton

deriveBase ''InputEventJoypadMotion

deriveBase ''InputEventKey

deriveBase ''InputEventMIDI

deriveBase ''InputEventMagnifyGesture

deriveBase ''InputEventMouse

deriveBase ''InputEventMouseButton

deriveBase ''InputEventMouseMotion

deriveBase ''InputEventPanGesture

deriveBase ''InputEventScreenDrag

deriveBase ''InputEventScreenTouch

deriveBase ''InputEventWithModifiers

deriveBase ''InputMap

deriveBase ''InstancePlaceholder

deriveBase ''InterpolatedCamera

deriveBase ''ItemList

deriveBase ''JSONParseResult

deriveBase ''JSONRPC

deriveBase ''JavaClass

deriveBase ''JavaClassWrapper

deriveBase ''JavaScript

deriveBase ''Joint

deriveBase ''Joint2D

deriveBase ''KinematicBody

deriveBase ''KinematicBody2D

deriveBase ''KinematicCollision

deriveBase ''KinematicCollision2D

deriveBase ''Label

deriveBase ''LargeTexture

deriveBase ''Light

deriveBase ''Light2D

deriveBase ''LightOccluder2D

deriveBase ''Line2D

deriveBase ''LineEdit

deriveBase ''LineShape2D

deriveBase ''LinkButton

deriveBase ''Listener

deriveBase ''MainLoop

deriveBase ''MarginContainer

deriveBase ''Material

deriveBase ''MenuButton

deriveBase ''Mesh

deriveBase ''MeshDataTool

deriveBase ''MeshInstance

deriveBase ''MeshInstance2D

deriveBase ''MeshLibrary

deriveBase ''MeshTexture

deriveBase ''MobileVRInterface

deriveBase ''MultiMesh

deriveBase ''MultiMeshInstance

deriveBase ''MultiMeshInstance2D

deriveBase ''MultiplayerAPI

deriveBase ''MultiplayerPeerGDNative

deriveBase ''NativeScript

deriveBase ''Navigation

deriveBase ''Navigation2D

deriveBase ''NavigationMesh

deriveBase ''NavigationMeshInstance

deriveBase ''NavigationPolygon

deriveBase ''NavigationPolygonInstance

deriveBase ''NetworkedMultiplayerENet

deriveBase ''NetworkedMultiplayerPeer

deriveBase ''NinePatchRect

deriveBase ''Node

deriveBase ''Node2D

deriveBase ''NoiseTexture

deriveBase ''OccluderPolygon2D

deriveBase ''OmniLight

deriveBase ''OpenSimplexNoise

deriveBase ''OptionButton

deriveBase ''PCKPacker

deriveBase ''PHashTranslation

deriveBase ''PackedDataContainer

deriveBase ''PackedDataContainerRef

deriveBase ''PackedScene

deriveBase ''PacketPeer

deriveBase ''PacketPeerGDNative

deriveBase ''PacketPeerStream

deriveBase ''PacketPeerUDP

deriveBase ''Panel

deriveBase ''PanelContainer

deriveBase ''PanoramaSky

deriveBase ''ParallaxBackground

deriveBase ''ParallaxLayer

deriveBase ''Particles

deriveBase ''Particles2D

deriveBase ''ParticlesMaterial

deriveBase ''Path

deriveBase ''Path2D

deriveBase ''PathFollow

deriveBase ''PathFollow2D

deriveBase ''Performance

deriveBase ''PhysicalBone

deriveBase ''Physics2DDirectBodyState

deriveBase ''Physics2DDirectBodyStateSW

deriveBase ''Physics2DDirectSpaceState

deriveBase ''Physics2DServer

deriveBase ''Physics2DServerSW

deriveBase ''Physics2DShapeQueryParameters

deriveBase ''Physics2DShapeQueryResult

deriveBase ''Physics2DTestMotionResult

deriveBase ''PhysicsBody

deriveBase ''PhysicsBody2D

deriveBase ''PhysicsDirectBodyState

deriveBase ''PhysicsDirectSpaceState

deriveBase ''PhysicsMaterial

deriveBase ''PhysicsServer

deriveBase ''PhysicsShapeQueryParameters

deriveBase ''PhysicsShapeQueryResult

deriveBase ''PinJoint

deriveBase ''PinJoint2D

deriveBase ''PlaneMesh

deriveBase ''PlaneShape

deriveBase ''PluginScript

deriveBase ''PointMesh

deriveBase ''Polygon2D

deriveBase ''PolygonPathFinder

deriveBase ''Popup

deriveBase ''PopupDialog

deriveBase ''PopupMenu

deriveBase ''PopupPanel

deriveBase ''Position2D

deriveBase ''Position3D

deriveBase ''PrimitiveMesh

deriveBase ''PrismMesh

deriveBase ''ProceduralSky

deriveBase ''ProgressBar

deriveBase ''ProjectSettings

deriveBase ''ProximityGroup

deriveBase ''ProxyTexture

deriveBase ''QuadMesh

deriveBase ''RandomNumberGenerator

deriveBase ''Range

deriveBase ''RayCast

deriveBase ''RayCast2D

deriveBase ''RayShape

deriveBase ''RayShape2D

deriveBase ''RectangleShape2D

deriveBase ''Reference

deriveBase ''ReferenceRect

deriveBase ''ReflectionProbe

deriveBase ''RegEx

deriveBase ''RegExMatch

deriveBase ''RemoteTransform

deriveBase ''RemoteTransform2D

deriveBase ''Resource

deriveBase ''ResourceFormatLoader

deriveBase ''ResourceFormatLoaderCrypto

deriveBase ''ResourceFormatSaver

deriveBase ''ResourceFormatSaverCrypto

deriveBase ''ResourceImporter

deriveBase ''ResourceInteractiveLoader

deriveBase ''ResourcePreloader

deriveBase ''RichTextEffect

deriveBase ''RichTextLabel

deriveBase ''RigidBody

deriveBase ''RigidBody2D

deriveBase ''RootMotionView

deriveBase ''SceneState

deriveBase ''SceneTree

deriveBase ''SceneTreeTimer

deriveBase ''Script

deriveBase ''ScriptCreateDialog

deriveBase ''ScriptEditor

deriveBase ''ScrollBar

deriveBase ''ScrollContainer

deriveBase ''SegmentShape2D

deriveBase ''Separator

deriveBase ''Shader

deriveBase ''ShaderMaterial

deriveBase ''Shape

deriveBase ''Shape2D

deriveBase ''ShortCut

deriveBase ''Skeleton

deriveBase ''Skeleton2D

deriveBase ''SkeletonIK

deriveBase ''Skin

deriveBase ''SkinReference

deriveBase ''Sky

deriveBase ''Slider

deriveBase ''SliderJoint

deriveBase ''SoftBody

deriveBase ''Spatial

deriveBase ''SpatialGizmo

deriveBase ''SpatialMaterial

deriveBase ''SpatialVelocityTracker

deriveBase ''SphereMesh

deriveBase ''SphereShape

deriveBase ''SpinBox

deriveBase ''SplitContainer

deriveBase ''SpotLight

deriveBase ''SpringArm

deriveBase ''Sprite

deriveBase ''Sprite3D

deriveBase ''SpriteBase3D

deriveBase ''SpriteFrames

deriveBase ''StaticBody

deriveBase ''StaticBody2D

deriveBase ''StreamPeer

deriveBase ''StreamPeerBuffer

deriveBase ''StreamPeerGDNative

deriveBase ''StreamPeerSSL

deriveBase ''StreamPeerTCP

deriveBase ''StreamTexture

deriveBase ''StyleBox

deriveBase ''StyleBoxEmpty

deriveBase ''StyleBoxFlat

deriveBase ''StyleBoxLine

deriveBase ''StyleBoxTexture

deriveBase ''SurfaceTool

deriveBase ''TCP_Server

deriveBase ''TabContainer

deriveBase ''Tabs

deriveBase ''TextEdit

deriveBase ''TextFile

deriveBase ''Texture

deriveBase ''Texture3D

deriveBase ''TextureArray

deriveBase ''TextureButton

deriveBase ''TextureLayered

deriveBase ''TextureProgress

deriveBase ''TextureRect

deriveBase ''Theme

deriveBase ''TileMap

deriveBase ''TileSet

deriveBase ''Timer

deriveBase ''ToolButton

deriveBase ''TouchScreenButton

deriveBase ''Translation

deriveBase ''TranslationServer

deriveBase ''Tree

deriveBase ''TreeItem

deriveBase ''TriangleMesh

deriveBase ''Tween

deriveBase ''UPNP

deriveBase ''UPNPDevice

deriveBase ''UndoRedo

deriveBase ''VBoxContainer

deriveBase ''VScrollBar

deriveBase ''VSeparator

deriveBase ''VSlider

deriveBase ''VSplitContainer

deriveBase ''VehicleBody

deriveBase ''VehicleWheel

deriveBase ''VideoPlayer

deriveBase ''VideoStream

deriveBase ''VideoStreamGDNative

deriveBase ''VideoStreamTheora

deriveBase ''VideoStreamWebm

deriveBase ''Viewport

deriveBase ''ViewportContainer

deriveBase ''ViewportTexture

deriveBase ''VisibilityEnabler

deriveBase ''VisibilityEnabler2D

deriveBase ''VisibilityNotifier

deriveBase ''VisibilityNotifier2D

deriveBase ''VisualInstance

deriveBase ''VisualScript

deriveBase ''VisualScriptBasicTypeConstant

deriveBase ''VisualScriptBuiltinFunc

deriveBase ''VisualScriptClassConstant

deriveBase ''VisualScriptComment

deriveBase ''VisualScriptComposeArray

deriveBase ''VisualScriptCondition

deriveBase ''VisualScriptConstant

deriveBase ''VisualScriptConstructor

deriveBase ''VisualScriptCustomNode

deriveBase ''VisualScriptDeconstruct

deriveBase ''VisualScriptEmitSignal

deriveBase ''VisualScriptEngineSingleton

deriveBase ''VisualScriptExpression

deriveBase ''VisualScriptFunction

deriveBase ''VisualScriptFunctionCall

deriveBase ''VisualScriptFunctionState

deriveBase ''VisualScriptGlobalConstant

deriveBase ''VisualScriptIndexGet

deriveBase ''VisualScriptIndexSet

deriveBase ''VisualScriptInputAction

deriveBase ''VisualScriptIterator

deriveBase ''VisualScriptLists

deriveBase ''VisualScriptLocalVar

deriveBase ''VisualScriptLocalVarSet

deriveBase ''VisualScriptMathConstant

deriveBase ''VisualScriptNode

deriveBase ''VisualScriptOperator

deriveBase ''VisualScriptPreload

deriveBase ''VisualScriptPropertyGet

deriveBase ''VisualScriptPropertySet

deriveBase ''VisualScriptResourcePath

deriveBase ''VisualScriptReturn

deriveBase ''VisualScriptSceneNode

deriveBase ''VisualScriptSceneTree

deriveBase ''VisualScriptSelect

deriveBase ''VisualScriptSelf

deriveBase ''VisualScriptSequence

deriveBase ''VisualScriptSubCall

deriveBase ''VisualScriptSwitch

deriveBase ''VisualScriptTypeCast

deriveBase ''VisualScriptVariableGet

deriveBase ''VisualScriptVariableSet

deriveBase ''VisualScriptWhile

deriveBase ''VisualScriptYield

deriveBase ''VisualScriptYieldSignal

deriveBase ''VisualServer

deriveBase ''VisualShader

deriveBase ''VisualShaderNode

deriveBase ''VisualShaderNodeBooleanConstant

deriveBase ''VisualShaderNodeBooleanUniform

deriveBase ''VisualShaderNodeColorConstant

deriveBase ''VisualShaderNodeColorFunc

deriveBase ''VisualShaderNodeColorOp

deriveBase ''VisualShaderNodeColorUniform

deriveBase ''VisualShaderNodeCompare

deriveBase ''VisualShaderNodeCubeMap

deriveBase ''VisualShaderNodeCubeMapUniform

deriveBase ''VisualShaderNodeCustom

deriveBase ''VisualShaderNodeDeterminant

deriveBase ''VisualShaderNodeDotProduct

deriveBase ''VisualShaderNodeExpression

deriveBase ''VisualShaderNodeFaceForward

deriveBase ''VisualShaderNodeFresnel

deriveBase ''VisualShaderNodeGlobalExpression

deriveBase ''VisualShaderNodeGroupBase

deriveBase ''VisualShaderNodeIf

deriveBase ''VisualShaderNodeInput

deriveBase ''VisualShaderNodeIs

deriveBase ''VisualShaderNodeOuterProduct

deriveBase ''VisualShaderNodeOutput

deriveBase ''VisualShaderNodeScalarClamp

deriveBase ''VisualShaderNodeScalarConstant

deriveBase ''VisualShaderNodeScalarDerivativeFunc

deriveBase ''VisualShaderNodeScalarFunc

deriveBase ''VisualShaderNodeScalarInterp

deriveBase ''VisualShaderNodeScalarOp

deriveBase ''VisualShaderNodeScalarSmoothStep

deriveBase ''VisualShaderNodeScalarSwitch

deriveBase ''VisualShaderNodeScalarUniform

deriveBase ''VisualShaderNodeSwitch

deriveBase ''VisualShaderNodeTexture

deriveBase ''VisualShaderNodeTextureUniform

deriveBase ''VisualShaderNodeTextureUniformTriplanar

deriveBase ''VisualShaderNodeTransformCompose

deriveBase ''VisualShaderNodeTransformConstant

deriveBase ''VisualShaderNodeTransformDecompose

deriveBase ''VisualShaderNodeTransformFunc

deriveBase ''VisualShaderNodeTransformMult

deriveBase ''VisualShaderNodeTransformUniform

deriveBase ''VisualShaderNodeTransformVecMult

deriveBase ''VisualShaderNodeUniform

deriveBase ''VisualShaderNodeVec3Constant

deriveBase ''VisualShaderNodeVec3Uniform

deriveBase ''VisualShaderNodeVectorClamp

deriveBase ''VisualShaderNodeVectorCompose

deriveBase ''VisualShaderNodeVectorDecompose

deriveBase ''VisualShaderNodeVectorDerivativeFunc

deriveBase ''VisualShaderNodeVectorDistance

deriveBase ''VisualShaderNodeVectorFunc

deriveBase ''VisualShaderNodeVectorInterp

deriveBase ''VisualShaderNodeVectorLen

deriveBase ''VisualShaderNodeVectorOp

deriveBase ''VisualShaderNodeVectorRefract

deriveBase ''VisualShaderNodeVectorScalarMix

deriveBase ''VisualShaderNodeVectorScalarSmoothStep

deriveBase ''VisualShaderNodeVectorScalarStep

deriveBase ''VisualShaderNodeVectorSmoothStep

deriveBase ''WeakRef

deriveBase ''WebRTCDataChannel

deriveBase ''WebRTCDataChannelGDNative

deriveBase ''WebRTCMultiplayer

deriveBase ''WebRTCPeerConnection

deriveBase ''WebRTCPeerConnectionGDNative

deriveBase ''WebSocketClient

deriveBase ''WebSocketMultiplayerPeer

deriveBase ''WebSocketPeer

deriveBase ''WebSocketServer

deriveBase ''WindowDialog

deriveBase ''World

deriveBase ''World2D

deriveBase ''WorldEnvironment

deriveBase ''X509Certificate

deriveBase ''XMLParser

deriveBase ''YSort

deriveBase ''ClassDB

deriveBase ''Directory

deriveBase ''Engine

deriveBase ''File

deriveBase ''Geometry

deriveBase ''JSON

deriveBase ''Marshalls

deriveBase ''Mutex

deriveBase ''OS

deriveBase ''ResourceLoader

deriveBase ''ResourceSaver

deriveBase ''Semaphore

deriveBase ''Thread

deriveBase ''VisualScriptEditor