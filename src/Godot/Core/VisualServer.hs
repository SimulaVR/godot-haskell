{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds #-}
module Godot.Core.VisualServer
       (Godot.Core.VisualServer._ARRAY_COMPRESS_WEIGHTS,
        Godot.Core.VisualServer._ARRAY_FLAG_USE_16_BIT_BONES,
        Godot.Core.VisualServer._VIEWPORT_UPDATE_ALWAYS,
        Godot.Core.VisualServer._ARRAY_FORMAT_INDEX,
        Godot.Core.VisualServer._INFO_SURFACE_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._VIEWPORT_DEBUG_DRAW_OVERDRAW,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_MATERIAL_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._ARRAY_COMPRESS_TANGENT,
        Godot.Core.VisualServer._INSTANCE_MULTIMESH,
        Godot.Core.VisualServer._VIEWPORT_CLEAR_ALWAYS,
        Godot.Core.VisualServer._SHADER_SPATIAL,
        Godot.Core.VisualServer._SHADOW_CASTING_SETTING_SHADOWS_ONLY,
        Godot.Core.VisualServer._ARRAY_COMPRESS_NORMAL,
        Godot.Core.VisualServer._ARRAY_FORMAT_COLOR,
        Godot.Core.VisualServer._VIEWPORT_CLEAR_NEVER,
        Godot.Core.VisualServer._TEXTURE_TYPE_2D_ARRAY,
        Godot.Core.VisualServer._INSTANCE_GEOMETRY_MASK,
        Godot.Core.VisualServer._VIEWPORT_USAGE_2D,
        Godot.Core.VisualServer._INSTANCE_LIGHTMAP_CAPTURE,
        Godot.Core.VisualServer._MULTIMESH_COLOR_FLOAT,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL_SHADOW_PARALLEL_2_SPLITS,
        Godot.Core.VisualServer._INSTANCE_IMMEDIATE,
        Godot.Core.VisualServer._CANVAS_OCCLUDER_POLYGON_CULL_CLOCKWISE,
        Godot.Core.VisualServer._ARRAY_FORMAT_TEX_UV,
        Godot.Core.VisualServer._CANVAS_OCCLUDER_POLYGON_CULL_DISABLED,
        Godot.Core.VisualServer._ARRAY_COMPRESS_VERTEX,
        Godot.Core.VisualServer._SCENARIO_DEBUG_DISABLED,
        Godot.Core.VisualServer._ENV_DOF_BLUR_QUALITY_HIGH,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL_SHADOW_ORTHOGONAL,
        Godot.Core.VisualServer._ARRAY_FORMAT_VERTEX,
        Godot.Core.VisualServer._SHADER_MAX,
        Godot.Core.VisualServer._VIEWPORT_DEBUG_DRAW_DISABLED,
        Godot.Core.VisualServer._CANVAS_ITEM_Z_MIN,
        Godot.Core.VisualServer._VIEWPORT_MSAA_8X,
        Godot.Core.VisualServer._INFO_MATERIAL_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._MAX_GLOW_LEVELS,
        Godot.Core.VisualServer._LIGHT_OMNI_SHADOW_DETAIL_HORIZONTAL,
        Godot.Core.VisualServer._TEXTURE_TYPE_CUBEMAP,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_SURFACE_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._ARRAY_COMPRESS_TEX_UV,
        Godot.Core.VisualServer._ARRAY_COMPRESS_BONES,
        Godot.Core.VisualServer._REFLECTION_PROBE_UPDATE_ALWAYS,
        Godot.Core.VisualServer._VIEWPORT_MSAA_DISABLED,
        Godot.Core.VisualServer._CUBEMAP_RIGHT,
        Godot.Core.VisualServer._ARRAY_MAX,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_SPLIT_2_OFFSET,
        Godot.Core.VisualServer._ENV_TONE_MAPPER_FILMIC,
        Godot.Core.VisualServer._PARTICLES_DRAW_ORDER_LIFETIME,
        Godot.Core.VisualServer._NINE_PATCH_STRETCH,
        Godot.Core.VisualServer._INFO_USAGE_VIDEO_MEM_TOTAL,
        Godot.Core.VisualServer._ARRAY_NORMAL,
        Godot.Core.VisualServer._MULTIMESH_COLOR_NONE,
        Godot.Core.VisualServer._ARRAY_FORMAT_TEX_UV2,
        Godot.Core.VisualServer._ENV_SSAO_QUALITY_LOW,
        Godot.Core.VisualServer._INSTANCE_MESH,
        Godot.Core.VisualServer._MATERIAL_RENDER_PRIORITY_MAX,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_MAX_DISTANCE,
        Godot.Core.VisualServer._VIEWPORT_MSAA_2X,
        Godot.Core.VisualServer._PARTICLES_DRAW_ORDER_INDEX,
        Godot.Core.VisualServer._ENV_DOF_BLUR_QUALITY_LOW,
        Godot.Core.VisualServer._INFO_SHADER_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._GLOW_BLEND_MODE_ADDITIVE,
        Godot.Core.VisualServer._ENV_BG_CANVAS,
        Godot.Core.VisualServer._LIGHT_OMNI_SHADOW_DUAL_PARABOLOID,
        Godot.Core.VisualServer._ARRAY_INDEX,
        Godot.Core.VisualServer._LIGHT_PARAM_ENERGY,
        Godot.Core.VisualServer._ARRAY_COLOR,
        Godot.Core.VisualServer._LIGHT_OMNI_SHADOW_CUBE,
        Godot.Core.VisualServer._PRIMITIVE_TRIANGLE_STRIP,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_MAX,
        Godot.Core.VisualServer._PRIMITIVE_TRIANGLES,
        Godot.Core.VisualServer._TEXTURE_FLAGS_DEFAULT,
        Godot.Core.VisualServer._VIEWPORT_USAGE_3D_NO_EFFECTS,
        Godot.Core.VisualServer._ARRAY_TEX_UV,
        Godot.Core.VisualServer._VIEWPORT_CLEAR_ONLY_NEXT_FRAME,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_PCF7,
        Godot.Core.VisualServer._BLEND_SHAPE_MODE_NORMALIZED,
        Godot.Core.VisualServer._ENV_BG_COLOR_SKY,
        Godot.Core.VisualServer._PRIMITIVE_LINE_LOOP,
        Godot.Core.VisualServer._LIGHT_PARAM_SPECULAR,
        Godot.Core.VisualServer._VIEWPORT_MSAA_EXT_2X,
        Godot.Core.VisualServer._CANVAS_LIGHT_MODE_SUB,
        Godot.Core.VisualServer._VIEWPORT_USAGE_3D,
        Godot.Core.VisualServer._GLOW_BLEND_MODE_SOFTLIGHT,
        Godot.Core.VisualServer._PRIMITIVE_TRIANGLE_FAN,
        Godot.Core.VisualServer._VIEWPORT_DEBUG_DRAW_UNSHADED,
        Godot.Core.VisualServer._MATERIAL_RENDER_PRIORITY_MIN,
        Godot.Core.VisualServer._LIGHT_OMNI_SHADOW_DETAIL_VERTICAL,
        Godot.Core.VisualServer._INSTANCE_FLAG_MAX,
        Godot.Core.VisualServer._MULTIMESH_TRANSFORM_3D,
        Godot.Core.VisualServer._SCENARIO_DEBUG_OVERDRAW,
        Godot.Core.VisualServer._ARRAY_FORMAT_NORMAL,
        Godot.Core.VisualServer._MULTIMESH_CUSTOM_DATA_8BIT,
        Godot.Core.VisualServer._ARRAY_TEX_UV2,
        Godot.Core.VisualServer._ENV_DOF_BLUR_QUALITY_MEDIUM,
        Godot.Core.VisualServer._TEXTURE_TYPE_2D,
        Godot.Core.VisualServer._ENV_BG_SKY,
        Godot.Core.VisualServer._FEATURE_SHADERS,
        Godot.Core.VisualServer._CUBEMAP_TOP,
        Godot.Core.VisualServer._PARTICLES_DRAW_ORDER_VIEW_DEPTH,
        Godot.Core.VisualServer._CUBEMAP_BACK,
        Godot.Core.VisualServer._LIGHT_SPOT,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL_SHADOW_PARALLEL_4_SPLITS,
        Godot.Core.VisualServer._INSTANCE_PARTICLES,
        Godot.Core.VisualServer._TEXTURE_FLAG_REPEAT,
        Godot.Core.VisualServer._LIGHT_PARAM_SPOT_ATTENUATION,
        Godot.Core.VisualServer._REFLECTION_PROBE_UPDATE_ONCE,
        Godot.Core.VisualServer._ARRAY_COMPRESS_DEFAULT,
        Godot.Core.VisualServer._CANVAS_OCCLUDER_POLYGON_CULL_COUNTER_CLOCKWISE,
        Godot.Core.VisualServer._CANVAS_ITEM_Z_MAX,
        Godot.Core.VisualServer._ENV_TONE_MAPPER_LINEAR,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_SPLIT_3_OFFSET,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_VERTICES_IN_FRAME,
        Godot.Core.VisualServer._MULTIMESH_CUSTOM_DATA_NONE,
        Godot.Core.VisualServer._LIGHT_OMNI,
        Godot.Core.VisualServer._ENV_BG_MAX,
        Godot.Core.VisualServer._INSTANCE_REFLECTION_PROBE,
        Godot.Core.VisualServer._INFO_TEXTURE_MEM_USED,
        Godot.Core.VisualServer._INSTANCE_NONE,
        Godot.Core.VisualServer._SHADER_CANVAS_ITEM,
        Godot.Core.VisualServer._ENV_SSAO_QUALITY_MEDIUM,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_PCF3,
        Godot.Core.VisualServer._ARRAY_FORMAT_BONES,
        Godot.Core.VisualServer._LIGHT_PARAM_SPOT_ANGLE,
        Godot.Core.VisualServer._ARRAY_WEIGHTS_SIZE,
        Godot.Core.VisualServer._SHADOW_CASTING_SETTING_DOUBLE_SIDED,
        Godot.Core.VisualServer._ENV_SSAO_QUALITY_HIGH,
        Godot.Core.VisualServer._INFO_VERTICES_IN_FRAME,
        Godot.Core.VisualServer._INFO_VIDEO_MEM_USED,
        Godot.Core.VisualServer._GLOW_BLEND_MODE_REPLACE,
        Godot.Core.VisualServer._NINE_PATCH_TILE_FIT,
        Godot.Core.VisualServer._VIEWPORT_UPDATE_ONCE,
        Godot.Core.VisualServer._ARRAY_COMPRESS_COLOR,
        Godot.Core.VisualServer._GLOW_BLEND_MODE_SCREEN,
        Godot.Core.VisualServer._MAX_CURSORS,
        Godot.Core.VisualServer._TEXTURE_FLAG_CONVERT_TO_LINEAR,
        Godot.Core.VisualServer._PRIMITIVE_MAX,
        Godot.Core.VisualServer._LIGHT_PARAM_CONTACT_SHADOW_SIZE,
        Godot.Core.VisualServer._INSTANCE_MAX,
        Godot.Core.VisualServer._ENV_SSAO_BLUR_3x3,
        Godot.Core.VisualServer._ARRAY_WEIGHTS,
        Godot.Core.VisualServer._LIGHT_PARAM_MAX,
        Godot.Core.VisualServer._CUBEMAP_BOTTOM,
        Godot.Core.VisualServer._ARRAY_TANGENT,
        Godot.Core.VisualServer._SCENARIO_DEBUG_SHADELESS,
        Godot.Core.VisualServer._INFO_OBJECTS_IN_FRAME,
        Godot.Core.VisualServer._INSTANCE_GI_PROBE,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_NORMAL_BIAS,
        Godot.Core.VisualServer._VIEWPORT_USAGE_2D_NO_SAMPLING,
        Godot.Core.VisualServer._ENV_SSAO_BLUR_2x2,
        Godot.Core.VisualServer._VIEWPORT_UPDATE_DISABLED,
        Godot.Core.VisualServer._SHADOW_CASTING_SETTING_OFF,
        Godot.Core.VisualServer._VIEWPORT_MSAA_16X,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_PCF9,
        Godot.Core.VisualServer._ENV_SSAO_BLUR_DISABLED,
        Godot.Core.VisualServer._TEXTURE_FLAG_ANISOTROPIC_FILTER,
        Godot.Core.VisualServer._FEATURE_MULTITHREADED,
        Godot.Core.VisualServer._ENV_SSAO_BLUR_1x1,
        Godot.Core.VisualServer._INFO_DRAW_CALLS_IN_FRAME,
        Godot.Core.VisualServer._ENV_BG_COLOR,
        Godot.Core.VisualServer._ENV_TONE_MAPPER_ACES,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_STABLE,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_OPTIMIZED,
        Godot.Core.VisualServer._ARRAY_COMPRESS_TEX_UV2,
        Godot.Core.VisualServer._MULTIMESH_COLOR_8BIT,
        Godot.Core.VisualServer._MULTIMESH_TRANSFORM_2D,
        Godot.Core.VisualServer._VIEWPORT_UPDATE_WHEN_VISIBLE,
        Godot.Core.VisualServer._VIEWPORT_MSAA_EXT_4X,
        Godot.Core.VisualServer._INSTANCE_LIGHT,
        Godot.Core.VisualServer._TEXTURE_TYPE_3D,
        Godot.Core.VisualServer._TEXTURE_FLAG_MIPMAPS,
        Godot.Core.VisualServer._PRIMITIVE_LINE_STRIP,
        Godot.Core.VisualServer._TEXTURE_FLAG_FILTER,
        Godot.Core.VisualServer._ENV_BG_KEEP,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_NONE,
        Godot.Core.VisualServer._CUBEMAP_FRONT,
        Godot.Core.VisualServer._TEXTURE_FLAG_USED_FOR_STREAMING,
        Godot.Core.VisualServer._INFO_VERTEX_MEM_USED,
        Godot.Core.VisualServer._TEXTURE_FLAG_MIRRORED_REPEAT,
        Godot.Core.VisualServer._PRIMITIVE_LINES,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_OBJECTS_IN_FRAME,
        Godot.Core.VisualServer._ENV_BG_CLEAR_COLOR,
        Godot.Core.VisualServer._SHADOW_CASTING_SETTING_ON,
        Godot.Core.VisualServer._SCENARIO_DEBUG_WIREFRAME,
        Godot.Core.VisualServer._CANVAS_LIGHT_MODE_ADD,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_BIAS_SPLIT_SCALE,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_DRAW_CALLS_IN_FRAME,
        Godot.Core.VisualServer._ARRAY_BONES,
        Godot.Core.VisualServer._LIGHT_PARAM_ATTENUATION,
        Godot.Core.VisualServer._VIEWPORT_DEBUG_DRAW_WIREFRAME,
        Godot.Core.VisualServer._CANVAS_LIGHT_MODE_MIX,
        Godot.Core.VisualServer._NINE_PATCH_TILE,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_SHADER_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._INSTANCE_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE,
        Godot.Core.VisualServer._CANVAS_LIGHT_MODE_MASK,
        Godot.Core.VisualServer._LIGHT_PARAM_RANGE,
        Godot.Core.VisualServer._BLEND_SHAPE_MODE_RELATIVE,
        Godot.Core.VisualServer._VIEWPORT_MSAA_4X,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_SPLIT_1_OFFSET,
        Godot.Core.VisualServer._ENV_TONE_MAPPER_REINHARD,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_PCF13,
        Godot.Core.VisualServer._MULTIMESH_CUSTOM_DATA_FLOAT,
        Godot.Core.VisualServer._NO_INDEX_ARRAY,
        Godot.Core.VisualServer._ARRAY_VERTEX,
        Godot.Core.VisualServer._ARRAY_FLAG_USE_2D_VERTICES,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_PCF5,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL,
        Godot.Core.VisualServer._ARRAY_COMPRESS_INDEX,
        Godot.Core.VisualServer._INSTANCE_FLAG_USE_BAKED_LIGHT,
        Godot.Core.VisualServer._CUBEMAP_LEFT,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_BIAS,
        Godot.Core.VisualServer._ARRAY_FORMAT_WEIGHTS,
        Godot.Core.VisualServer._SHADER_PARTICLES,
        Godot.Core.VisualServer._ARRAY_FORMAT_TANGENT,
        Godot.Core.VisualServer._PRIMITIVE_POINTS,
        Godot.Core.VisualServer.sig_frame_post_draw,
        Godot.Core.VisualServer.sig_frame_pre_draw,
        Godot.Core.VisualServer.black_bars_set_images,
        Godot.Core.VisualServer.black_bars_set_margins,
        Godot.Core.VisualServer.camera_create,
        Godot.Core.VisualServer.camera_set_cull_mask,
        Godot.Core.VisualServer.camera_set_environment,
        Godot.Core.VisualServer.camera_set_frustum,
        Godot.Core.VisualServer.camera_set_orthogonal,
        Godot.Core.VisualServer.camera_set_perspective,
        Godot.Core.VisualServer.camera_set_transform,
        Godot.Core.VisualServer.camera_set_use_vertical_aspect,
        Godot.Core.VisualServer.canvas_create,
        Godot.Core.VisualServer.canvas_item_add_circle,
        Godot.Core.VisualServer.canvas_item_add_clip_ignore,
        Godot.Core.VisualServer.canvas_item_add_line,
        Godot.Core.VisualServer.canvas_item_add_mesh,
        Godot.Core.VisualServer.canvas_item_add_multimesh,
        Godot.Core.VisualServer.canvas_item_add_nine_patch,
        Godot.Core.VisualServer.canvas_item_add_particles,
        Godot.Core.VisualServer.canvas_item_add_polygon,
        Godot.Core.VisualServer.canvas_item_add_polyline,
        Godot.Core.VisualServer.canvas_item_add_primitive,
        Godot.Core.VisualServer.canvas_item_add_rect,
        Godot.Core.VisualServer.canvas_item_add_set_transform,
        Godot.Core.VisualServer.canvas_item_add_texture_rect,
        Godot.Core.VisualServer.canvas_item_add_texture_rect_region,
        Godot.Core.VisualServer.canvas_item_add_triangle_array,
        Godot.Core.VisualServer.canvas_item_clear,
        Godot.Core.VisualServer.canvas_item_create,
        Godot.Core.VisualServer.canvas_item_set_clip,
        Godot.Core.VisualServer.canvas_item_set_copy_to_backbuffer,
        Godot.Core.VisualServer.canvas_item_set_custom_rect,
        Godot.Core.VisualServer.canvas_item_set_distance_field_mode,
        Godot.Core.VisualServer.canvas_item_set_draw_behind_parent,
        Godot.Core.VisualServer.canvas_item_set_draw_index,
        Godot.Core.VisualServer.canvas_item_set_light_mask,
        Godot.Core.VisualServer.canvas_item_set_material,
        Godot.Core.VisualServer.canvas_item_set_modulate,
        Godot.Core.VisualServer.canvas_item_set_parent,
        Godot.Core.VisualServer.canvas_item_set_self_modulate,
        Godot.Core.VisualServer.canvas_item_set_sort_children_by_y,
        Godot.Core.VisualServer.canvas_item_set_transform,
        Godot.Core.VisualServer.canvas_item_set_use_parent_material,
        Godot.Core.VisualServer.canvas_item_set_visible,
        Godot.Core.VisualServer.canvas_item_set_z_as_relative_to_parent,
        Godot.Core.VisualServer.canvas_item_set_z_index,
        Godot.Core.VisualServer.canvas_light_attach_to_canvas,
        Godot.Core.VisualServer.canvas_light_create,
        Godot.Core.VisualServer.canvas_light_occluder_attach_to_canvas,
        Godot.Core.VisualServer.canvas_light_occluder_create,
        Godot.Core.VisualServer.canvas_light_occluder_set_enabled,
        Godot.Core.VisualServer.canvas_light_occluder_set_light_mask,
        Godot.Core.VisualServer.canvas_light_occluder_set_polygon,
        Godot.Core.VisualServer.canvas_light_occluder_set_transform,
        Godot.Core.VisualServer.canvas_light_set_color,
        Godot.Core.VisualServer.canvas_light_set_enabled,
        Godot.Core.VisualServer.canvas_light_set_energy,
        Godot.Core.VisualServer.canvas_light_set_height,
        Godot.Core.VisualServer.canvas_light_set_item_cull_mask,
        Godot.Core.VisualServer.canvas_light_set_item_shadow_cull_mask,
        Godot.Core.VisualServer.canvas_light_set_layer_range,
        Godot.Core.VisualServer.canvas_light_set_mode,
        Godot.Core.VisualServer.canvas_light_set_scale,
        Godot.Core.VisualServer.canvas_light_set_shadow_buffer_size,
        Godot.Core.VisualServer.canvas_light_set_shadow_color,
        Godot.Core.VisualServer.canvas_light_set_shadow_enabled,
        Godot.Core.VisualServer.canvas_light_set_shadow_filter,
        Godot.Core.VisualServer.canvas_light_set_shadow_gradient_length,
        Godot.Core.VisualServer.canvas_light_set_shadow_smooth,
        Godot.Core.VisualServer.canvas_light_set_texture,
        Godot.Core.VisualServer.canvas_light_set_texture_offset,
        Godot.Core.VisualServer.canvas_light_set_transform,
        Godot.Core.VisualServer.canvas_light_set_z_range,
        Godot.Core.VisualServer.canvas_occluder_polygon_create,
        Godot.Core.VisualServer.canvas_occluder_polygon_set_cull_mode,
        Godot.Core.VisualServer.canvas_occluder_polygon_set_shape,
        Godot.Core.VisualServer.canvas_occluder_polygon_set_shape_as_lines,
        Godot.Core.VisualServer.canvas_set_item_mirroring,
        Godot.Core.VisualServer.canvas_set_modulate,
        Godot.Core.VisualServer.directional_light_create,
        Godot.Core.VisualServer.draw,
        Godot.Core.VisualServer.environment_create,
        Godot.Core.VisualServer.environment_set_adjustment,
        Godot.Core.VisualServer.environment_set_ambient_light,
        Godot.Core.VisualServer.environment_set_background,
        Godot.Core.VisualServer.environment_set_bg_color,
        Godot.Core.VisualServer.environment_set_bg_energy,
        Godot.Core.VisualServer.environment_set_canvas_max_layer,
        Godot.Core.VisualServer.environment_set_dof_blur_far,
        Godot.Core.VisualServer.environment_set_dof_blur_near,
        Godot.Core.VisualServer.environment_set_fog,
        Godot.Core.VisualServer.environment_set_fog_depth,
        Godot.Core.VisualServer.environment_set_fog_height,
        Godot.Core.VisualServer.environment_set_glow,
        Godot.Core.VisualServer.environment_set_sky,
        Godot.Core.VisualServer.environment_set_sky_custom_fov,
        Godot.Core.VisualServer.environment_set_sky_orientation,
        Godot.Core.VisualServer.environment_set_ssao,
        Godot.Core.VisualServer.environment_set_ssr,
        Godot.Core.VisualServer.environment_set_tonemap,
        Godot.Core.VisualServer.finish, Godot.Core.VisualServer.force_draw,
        Godot.Core.VisualServer.force_sync,
        Godot.Core.VisualServer.free_rid,
        Godot.Core.VisualServer.get_render_info,
        Godot.Core.VisualServer.get_test_cube,
        Godot.Core.VisualServer.get_test_texture,
        Godot.Core.VisualServer.get_video_adapter_name,
        Godot.Core.VisualServer.get_video_adapter_vendor,
        Godot.Core.VisualServer.get_white_texture,
        Godot.Core.VisualServer.gi_probe_create,
        Godot.Core.VisualServer.gi_probe_get_bias,
        Godot.Core.VisualServer.gi_probe_get_bounds,
        Godot.Core.VisualServer.gi_probe_get_cell_size,
        Godot.Core.VisualServer.gi_probe_get_dynamic_data,
        Godot.Core.VisualServer.gi_probe_get_dynamic_range,
        Godot.Core.VisualServer.gi_probe_get_energy,
        Godot.Core.VisualServer.gi_probe_get_normal_bias,
        Godot.Core.VisualServer.gi_probe_get_propagation,
        Godot.Core.VisualServer.gi_probe_get_to_cell_xform,
        Godot.Core.VisualServer.gi_probe_is_compressed,
        Godot.Core.VisualServer.gi_probe_is_interior,
        Godot.Core.VisualServer.gi_probe_set_bias,
        Godot.Core.VisualServer.gi_probe_set_bounds,
        Godot.Core.VisualServer.gi_probe_set_cell_size,
        Godot.Core.VisualServer.gi_probe_set_compress,
        Godot.Core.VisualServer.gi_probe_set_dynamic_data,
        Godot.Core.VisualServer.gi_probe_set_dynamic_range,
        Godot.Core.VisualServer.gi_probe_set_energy,
        Godot.Core.VisualServer.gi_probe_set_interior,
        Godot.Core.VisualServer.gi_probe_set_normal_bias,
        Godot.Core.VisualServer.gi_probe_set_propagation,
        Godot.Core.VisualServer.gi_probe_set_to_cell_xform,
        Godot.Core.VisualServer.has_changed,
        Godot.Core.VisualServer.has_feature,
        Godot.Core.VisualServer.has_os_feature,
        Godot.Core.VisualServer.immediate_begin,
        Godot.Core.VisualServer.immediate_clear,
        Godot.Core.VisualServer.immediate_color,
        Godot.Core.VisualServer.immediate_create,
        Godot.Core.VisualServer.immediate_end,
        Godot.Core.VisualServer.immediate_get_material,
        Godot.Core.VisualServer.immediate_normal,
        Godot.Core.VisualServer.immediate_set_material,
        Godot.Core.VisualServer.immediate_tangent,
        Godot.Core.VisualServer.immediate_uv,
        Godot.Core.VisualServer.immediate_uv2,
        Godot.Core.VisualServer.immediate_vertex,
        Godot.Core.VisualServer.immediate_vertex_2d,
        Godot.Core.VisualServer.init,
        Godot.Core.VisualServer.instance_attach_object_instance_id,
        Godot.Core.VisualServer.instance_attach_skeleton,
        Godot.Core.VisualServer.instance_create,
        Godot.Core.VisualServer.instance_create2,
        Godot.Core.VisualServer.instance_geometry_set_as_instance_lod,
        Godot.Core.VisualServer.instance_geometry_set_cast_shadows_setting,
        Godot.Core.VisualServer.instance_geometry_set_draw_range,
        Godot.Core.VisualServer.instance_geometry_set_flag,
        Godot.Core.VisualServer.instance_geometry_set_material_override,
        Godot.Core.VisualServer.instance_set_base,
        Godot.Core.VisualServer.instance_set_blend_shape_weight,
        Godot.Core.VisualServer.instance_set_custom_aabb,
        Godot.Core.VisualServer.instance_set_exterior,
        Godot.Core.VisualServer.instance_set_extra_visibility_margin,
        Godot.Core.VisualServer.instance_set_layer_mask,
        Godot.Core.VisualServer.instance_set_scenario,
        Godot.Core.VisualServer.instance_set_surface_material,
        Godot.Core.VisualServer.instance_set_transform,
        Godot.Core.VisualServer.instance_set_use_lightmap,
        Godot.Core.VisualServer.instance_set_visible,
        Godot.Core.VisualServer.instances_cull_aabb,
        Godot.Core.VisualServer.instances_cull_convex,
        Godot.Core.VisualServer.instances_cull_ray,
        Godot.Core.VisualServer.light_directional_set_blend_splits,
        Godot.Core.VisualServer.light_directional_set_shadow_depth_range_mode,
        Godot.Core.VisualServer.light_directional_set_shadow_mode,
        Godot.Core.VisualServer.light_omni_set_shadow_detail,
        Godot.Core.VisualServer.light_omni_set_shadow_mode,
        Godot.Core.VisualServer.light_set_color,
        Godot.Core.VisualServer.light_set_cull_mask,
        Godot.Core.VisualServer.light_set_negative,
        Godot.Core.VisualServer.light_set_param,
        Godot.Core.VisualServer.light_set_projector,
        Godot.Core.VisualServer.light_set_reverse_cull_face_mode,
        Godot.Core.VisualServer.light_set_shadow,
        Godot.Core.VisualServer.light_set_shadow_color,
        Godot.Core.VisualServer.light_set_use_gi,
        Godot.Core.VisualServer.lightmap_capture_create,
        Godot.Core.VisualServer.lightmap_capture_get_bounds,
        Godot.Core.VisualServer.lightmap_capture_get_energy,
        Godot.Core.VisualServer.lightmap_capture_get_octree,
        Godot.Core.VisualServer.lightmap_capture_get_octree_cell_subdiv,
        Godot.Core.VisualServer.lightmap_capture_get_octree_cell_transform,
        Godot.Core.VisualServer.lightmap_capture_set_bounds,
        Godot.Core.VisualServer.lightmap_capture_set_energy,
        Godot.Core.VisualServer.lightmap_capture_set_octree,
        Godot.Core.VisualServer.lightmap_capture_set_octree_cell_subdiv,
        Godot.Core.VisualServer.lightmap_capture_set_octree_cell_transform,
        Godot.Core.VisualServer.make_sphere_mesh,
        Godot.Core.VisualServer.material_create,
        Godot.Core.VisualServer.material_get_param,
        Godot.Core.VisualServer.material_get_param_default,
        Godot.Core.VisualServer.material_get_shader,
        Godot.Core.VisualServer.material_set_line_width,
        Godot.Core.VisualServer.material_set_next_pass,
        Godot.Core.VisualServer.material_set_param,
        Godot.Core.VisualServer.material_set_render_priority,
        Godot.Core.VisualServer.material_set_shader,
        Godot.Core.VisualServer.mesh_add_surface_from_arrays,
        Godot.Core.VisualServer.mesh_clear,
        Godot.Core.VisualServer.mesh_create,
        Godot.Core.VisualServer.mesh_get_blend_shape_count,
        Godot.Core.VisualServer.mesh_get_blend_shape_mode,
        Godot.Core.VisualServer.mesh_get_custom_aabb,
        Godot.Core.VisualServer.mesh_get_surface_count,
        Godot.Core.VisualServer.mesh_remove_surface,
        Godot.Core.VisualServer.mesh_set_blend_shape_count,
        Godot.Core.VisualServer.mesh_set_blend_shape_mode,
        Godot.Core.VisualServer.mesh_set_custom_aabb,
        Godot.Core.VisualServer.mesh_surface_get_aabb,
        Godot.Core.VisualServer.mesh_surface_get_array,
        Godot.Core.VisualServer.mesh_surface_get_array_index_len,
        Godot.Core.VisualServer.mesh_surface_get_array_len,
        Godot.Core.VisualServer.mesh_surface_get_arrays,
        Godot.Core.VisualServer.mesh_surface_get_blend_shape_arrays,
        Godot.Core.VisualServer.mesh_surface_get_format,
        Godot.Core.VisualServer.mesh_surface_get_format_offset,
        Godot.Core.VisualServer.mesh_surface_get_format_stride,
        Godot.Core.VisualServer.mesh_surface_get_index_array,
        Godot.Core.VisualServer.mesh_surface_get_material,
        Godot.Core.VisualServer.mesh_surface_get_primitive_type,
        Godot.Core.VisualServer.mesh_surface_get_skeleton_aabb,
        Godot.Core.VisualServer.mesh_surface_set_material,
        Godot.Core.VisualServer.mesh_surface_update_region,
        Godot.Core.VisualServer.multimesh_allocate,
        Godot.Core.VisualServer.multimesh_create,
        Godot.Core.VisualServer.multimesh_get_aabb,
        Godot.Core.VisualServer.multimesh_get_instance_count,
        Godot.Core.VisualServer.multimesh_get_mesh,
        Godot.Core.VisualServer.multimesh_get_visible_instances,
        Godot.Core.VisualServer.multimesh_instance_get_color,
        Godot.Core.VisualServer.multimesh_instance_get_custom_data,
        Godot.Core.VisualServer.multimesh_instance_get_transform,
        Godot.Core.VisualServer.multimesh_instance_get_transform_2d,
        Godot.Core.VisualServer.multimesh_instance_set_color,
        Godot.Core.VisualServer.multimesh_instance_set_custom_data,
        Godot.Core.VisualServer.multimesh_instance_set_transform,
        Godot.Core.VisualServer.multimesh_instance_set_transform_2d,
        Godot.Core.VisualServer.multimesh_set_as_bulk_array,
        Godot.Core.VisualServer.multimesh_set_mesh,
        Godot.Core.VisualServer.multimesh_set_visible_instances,
        Godot.Core.VisualServer.omni_light_create,
        Godot.Core.VisualServer.particles_create,
        Godot.Core.VisualServer.particles_get_current_aabb,
        Godot.Core.VisualServer.particles_get_emitting,
        Godot.Core.VisualServer.particles_is_inactive,
        Godot.Core.VisualServer.particles_request_process,
        Godot.Core.VisualServer.particles_restart,
        Godot.Core.VisualServer.particles_set_amount,
        Godot.Core.VisualServer.particles_set_custom_aabb,
        Godot.Core.VisualServer.particles_set_draw_order,
        Godot.Core.VisualServer.particles_set_draw_pass_mesh,
        Godot.Core.VisualServer.particles_set_draw_passes,
        Godot.Core.VisualServer.particles_set_emission_transform,
        Godot.Core.VisualServer.particles_set_emitting,
        Godot.Core.VisualServer.particles_set_explosiveness_ratio,
        Godot.Core.VisualServer.particles_set_fixed_fps,
        Godot.Core.VisualServer.particles_set_fractional_delta,
        Godot.Core.VisualServer.particles_set_lifetime,
        Godot.Core.VisualServer.particles_set_one_shot,
        Godot.Core.VisualServer.particles_set_pre_process_time,
        Godot.Core.VisualServer.particles_set_process_material,
        Godot.Core.VisualServer.particles_set_randomness_ratio,
        Godot.Core.VisualServer.particles_set_speed_scale,
        Godot.Core.VisualServer.particles_set_use_local_coordinates,
        Godot.Core.VisualServer.reflection_probe_create,
        Godot.Core.VisualServer.reflection_probe_set_as_interior,
        Godot.Core.VisualServer.reflection_probe_set_cull_mask,
        Godot.Core.VisualServer.reflection_probe_set_enable_box_projection,
        Godot.Core.VisualServer.reflection_probe_set_enable_shadows,
        Godot.Core.VisualServer.reflection_probe_set_extents,
        Godot.Core.VisualServer.reflection_probe_set_intensity,
        Godot.Core.VisualServer.reflection_probe_set_interior_ambient,
        Godot.Core.VisualServer.reflection_probe_set_interior_ambient_energy,
        Godot.Core.VisualServer.reflection_probe_set_interior_ambient_probe_contribution,
        Godot.Core.VisualServer.reflection_probe_set_max_distance,
        Godot.Core.VisualServer.reflection_probe_set_origin_offset,
        Godot.Core.VisualServer.reflection_probe_set_update_mode,
        Godot.Core.VisualServer.request_frame_drawn_callback,
        Godot.Core.VisualServer.scenario_create,
        Godot.Core.VisualServer.scenario_set_debug,
        Godot.Core.VisualServer.scenario_set_environment,
        Godot.Core.VisualServer.scenario_set_fallback_environment,
        Godot.Core.VisualServer.scenario_set_reflection_atlas_size,
        Godot.Core.VisualServer.set_boot_image,
        Godot.Core.VisualServer.set_debug_generate_wireframes,
        Godot.Core.VisualServer.set_default_clear_color,
        Godot.Core.VisualServer.shader_create,
        Godot.Core.VisualServer.shader_get_code,
        Godot.Core.VisualServer.shader_get_default_texture_param,
        Godot.Core.VisualServer.shader_get_param_list,
        Godot.Core.VisualServer.shader_set_code,
        Godot.Core.VisualServer.shader_set_default_texture_param,
        Godot.Core.VisualServer.skeleton_allocate,
        Godot.Core.VisualServer.skeleton_bone_get_transform,
        Godot.Core.VisualServer.skeleton_bone_get_transform_2d,
        Godot.Core.VisualServer.skeleton_bone_set_transform,
        Godot.Core.VisualServer.skeleton_bone_set_transform_2d,
        Godot.Core.VisualServer.skeleton_create,
        Godot.Core.VisualServer.skeleton_get_bone_count,
        Godot.Core.VisualServer.sky_create,
        Godot.Core.VisualServer.sky_set_texture,
        Godot.Core.VisualServer.spot_light_create,
        Godot.Core.VisualServer.sync,
        Godot.Core.VisualServer.texture_allocate,
        Godot.Core.VisualServer.texture_bind,
        Godot.Core.VisualServer.texture_create,
        Godot.Core.VisualServer.texture_create_from_image,
        Godot.Core.VisualServer.texture_debug_usage,
        Godot.Core.VisualServer.texture_get_data,
        Godot.Core.VisualServer.texture_get_depth,
        Godot.Core.VisualServer.texture_get_flags,
        Godot.Core.VisualServer.texture_get_format,
        Godot.Core.VisualServer.texture_get_height,
        Godot.Core.VisualServer.texture_get_path,
        Godot.Core.VisualServer.texture_get_texid,
        Godot.Core.VisualServer.texture_get_type,
        Godot.Core.VisualServer.texture_get_width,
        Godot.Core.VisualServer.texture_set_data,
        Godot.Core.VisualServer.texture_set_data_partial,
        Godot.Core.VisualServer.texture_set_flags,
        Godot.Core.VisualServer.texture_set_path,
        Godot.Core.VisualServer.texture_set_shrink_all_x2_on_set_data,
        Godot.Core.VisualServer.texture_set_size_override,
        Godot.Core.VisualServer.textures_keep_original,
        Godot.Core.VisualServer.viewport_attach_camera,
        Godot.Core.VisualServer.viewport_attach_canvas,
        Godot.Core.VisualServer.viewport_attach_to_screen,
        Godot.Core.VisualServer.viewport_create,
        Godot.Core.VisualServer.viewport_detach,
        Godot.Core.VisualServer.viewport_get_render_info,
        Godot.Core.VisualServer.viewport_get_texture,
        Godot.Core.VisualServer.viewport_remove_canvas,
        Godot.Core.VisualServer.viewport_set_active,
        Godot.Core.VisualServer.viewport_set_canvas_stacking,
        Godot.Core.VisualServer.viewport_set_canvas_transform,
        Godot.Core.VisualServer.viewport_set_clear_mode,
        Godot.Core.VisualServer.viewport_set_debug_draw,
        Godot.Core.VisualServer.viewport_set_disable_3d,
        Godot.Core.VisualServer.viewport_set_disable_environment,
        Godot.Core.VisualServer.viewport_set_global_canvas_transform,
        Godot.Core.VisualServer.viewport_set_hdr,
        Godot.Core.VisualServer.viewport_set_hide_canvas,
        Godot.Core.VisualServer.viewport_set_hide_scenario,
        Godot.Core.VisualServer.viewport_set_msaa,
        Godot.Core.VisualServer.viewport_set_parent_viewport,
        Godot.Core.VisualServer.viewport_set_render_direct_to_screen,
        Godot.Core.VisualServer.viewport_set_scenario,
        Godot.Core.VisualServer.viewport_set_shadow_atlas_quadrant_subdivision,
        Godot.Core.VisualServer.viewport_set_shadow_atlas_size,
        Godot.Core.VisualServer.viewport_set_size,
        Godot.Core.VisualServer.viewport_set_transparent_background,
        Godot.Core.VisualServer.viewport_set_update_mode,
        Godot.Core.VisualServer.viewport_set_usage,
        Godot.Core.VisualServer.viewport_set_use_arvr,
        Godot.Core.VisualServer.viewport_set_vflip)
       where
import Data.Coerce
import Foreign.C
import Godot.Internal.Dispatch
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types

_ARRAY_COMPRESS_WEIGHTS :: Int
_ARRAY_COMPRESS_WEIGHTS = 65536

_ARRAY_FLAG_USE_16_BIT_BONES :: Int
_ARRAY_FLAG_USE_16_BIT_BONES = 524288

_VIEWPORT_UPDATE_ALWAYS :: Int
_VIEWPORT_UPDATE_ALWAYS = 3

_ARRAY_FORMAT_INDEX :: Int
_ARRAY_FORMAT_INDEX = 256

_INFO_SURFACE_CHANGES_IN_FRAME :: Int
_INFO_SURFACE_CHANGES_IN_FRAME = 4

_VIEWPORT_DEBUG_DRAW_OVERDRAW :: Int
_VIEWPORT_DEBUG_DRAW_OVERDRAW = 2

_VIEWPORT_RENDER_INFO_MATERIAL_CHANGES_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_MATERIAL_CHANGES_IN_FRAME = 2

_ARRAY_COMPRESS_TANGENT :: Int
_ARRAY_COMPRESS_TANGENT = 2048

_INSTANCE_MULTIMESH :: Int
_INSTANCE_MULTIMESH = 2

_VIEWPORT_CLEAR_ALWAYS :: Int
_VIEWPORT_CLEAR_ALWAYS = 0

_SHADER_SPATIAL :: Int
_SHADER_SPATIAL = 0

_SHADOW_CASTING_SETTING_SHADOWS_ONLY :: Int
_SHADOW_CASTING_SETTING_SHADOWS_ONLY = 3

_ARRAY_COMPRESS_NORMAL :: Int
_ARRAY_COMPRESS_NORMAL = 1024

_ARRAY_FORMAT_COLOR :: Int
_ARRAY_FORMAT_COLOR = 8

_VIEWPORT_CLEAR_NEVER :: Int
_VIEWPORT_CLEAR_NEVER = 1

_TEXTURE_TYPE_2D_ARRAY :: Int
_TEXTURE_TYPE_2D_ARRAY = 2

_INSTANCE_GEOMETRY_MASK :: Int
_INSTANCE_GEOMETRY_MASK = 30

_VIEWPORT_USAGE_2D :: Int
_VIEWPORT_USAGE_2D = 0

_INSTANCE_LIGHTMAP_CAPTURE :: Int
_INSTANCE_LIGHTMAP_CAPTURE = 8

_MULTIMESH_COLOR_FLOAT :: Int
_MULTIMESH_COLOR_FLOAT = 2

_LIGHT_DIRECTIONAL_SHADOW_PARALLEL_2_SPLITS :: Int
_LIGHT_DIRECTIONAL_SHADOW_PARALLEL_2_SPLITS = 1

_INSTANCE_IMMEDIATE :: Int
_INSTANCE_IMMEDIATE = 3

_CANVAS_OCCLUDER_POLYGON_CULL_CLOCKWISE :: Int
_CANVAS_OCCLUDER_POLYGON_CULL_CLOCKWISE = 1

_ARRAY_FORMAT_TEX_UV :: Int
_ARRAY_FORMAT_TEX_UV = 16

_CANVAS_OCCLUDER_POLYGON_CULL_DISABLED :: Int
_CANVAS_OCCLUDER_POLYGON_CULL_DISABLED = 0

_ARRAY_COMPRESS_VERTEX :: Int
_ARRAY_COMPRESS_VERTEX = 512

_SCENARIO_DEBUG_DISABLED :: Int
_SCENARIO_DEBUG_DISABLED = 0

_ENV_DOF_BLUR_QUALITY_HIGH :: Int
_ENV_DOF_BLUR_QUALITY_HIGH = 2

_LIGHT_DIRECTIONAL_SHADOW_ORTHOGONAL :: Int
_LIGHT_DIRECTIONAL_SHADOW_ORTHOGONAL = 0

_ARRAY_FORMAT_VERTEX :: Int
_ARRAY_FORMAT_VERTEX = 1

_SHADER_MAX :: Int
_SHADER_MAX = 3

_VIEWPORT_DEBUG_DRAW_DISABLED :: Int
_VIEWPORT_DEBUG_DRAW_DISABLED = 0

_CANVAS_ITEM_Z_MIN :: Int
_CANVAS_ITEM_Z_MIN = -4096

_VIEWPORT_MSAA_8X :: Int
_VIEWPORT_MSAA_8X = 3

_INFO_MATERIAL_CHANGES_IN_FRAME :: Int
_INFO_MATERIAL_CHANGES_IN_FRAME = 2

_MAX_GLOW_LEVELS :: Int
_MAX_GLOW_LEVELS = 7

_LIGHT_OMNI_SHADOW_DETAIL_HORIZONTAL :: Int
_LIGHT_OMNI_SHADOW_DETAIL_HORIZONTAL = 1

_TEXTURE_TYPE_CUBEMAP :: Int
_TEXTURE_TYPE_CUBEMAP = 1

_VIEWPORT_RENDER_INFO_SURFACE_CHANGES_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_SURFACE_CHANGES_IN_FRAME = 4

_ARRAY_COMPRESS_TEX_UV :: Int
_ARRAY_COMPRESS_TEX_UV = 8192

_ARRAY_COMPRESS_BONES :: Int
_ARRAY_COMPRESS_BONES = 32768

_REFLECTION_PROBE_UPDATE_ALWAYS :: Int
_REFLECTION_PROBE_UPDATE_ALWAYS = 1

_VIEWPORT_MSAA_DISABLED :: Int
_VIEWPORT_MSAA_DISABLED = 0

_CUBEMAP_RIGHT :: Int
_CUBEMAP_RIGHT = 1

_ARRAY_MAX :: Int
_ARRAY_MAX = 9

_LIGHT_PARAM_SHADOW_SPLIT_2_OFFSET :: Int
_LIGHT_PARAM_SHADOW_SPLIT_2_OFFSET = 10

_ENV_TONE_MAPPER_FILMIC :: Int
_ENV_TONE_MAPPER_FILMIC = 2

_PARTICLES_DRAW_ORDER_LIFETIME :: Int
_PARTICLES_DRAW_ORDER_LIFETIME = 1

_NINE_PATCH_STRETCH :: Int
_NINE_PATCH_STRETCH = 0

_INFO_USAGE_VIDEO_MEM_TOTAL :: Int
_INFO_USAGE_VIDEO_MEM_TOTAL = 6

_ARRAY_NORMAL :: Int
_ARRAY_NORMAL = 1

_MULTIMESH_COLOR_NONE :: Int
_MULTIMESH_COLOR_NONE = 0

_ARRAY_FORMAT_TEX_UV2 :: Int
_ARRAY_FORMAT_TEX_UV2 = 32

_ENV_SSAO_QUALITY_LOW :: Int
_ENV_SSAO_QUALITY_LOW = 0

_INSTANCE_MESH :: Int
_INSTANCE_MESH = 1

_MATERIAL_RENDER_PRIORITY_MAX :: Int
_MATERIAL_RENDER_PRIORITY_MAX = 127

_LIGHT_PARAM_SHADOW_MAX_DISTANCE :: Int
_LIGHT_PARAM_SHADOW_MAX_DISTANCE = 8

_VIEWPORT_MSAA_2X :: Int
_VIEWPORT_MSAA_2X = 1

_PARTICLES_DRAW_ORDER_INDEX :: Int
_PARTICLES_DRAW_ORDER_INDEX = 0

_ENV_DOF_BLUR_QUALITY_LOW :: Int
_ENV_DOF_BLUR_QUALITY_LOW = 0

_INFO_SHADER_CHANGES_IN_FRAME :: Int
_INFO_SHADER_CHANGES_IN_FRAME = 3

_GLOW_BLEND_MODE_ADDITIVE :: Int
_GLOW_BLEND_MODE_ADDITIVE = 0

_ENV_BG_CANVAS :: Int
_ENV_BG_CANVAS = 4

_LIGHT_OMNI_SHADOW_DUAL_PARABOLOID :: Int
_LIGHT_OMNI_SHADOW_DUAL_PARABOLOID = 0

_ARRAY_INDEX :: Int
_ARRAY_INDEX = 8

_LIGHT_PARAM_ENERGY :: Int
_LIGHT_PARAM_ENERGY = 0

_ARRAY_COLOR :: Int
_ARRAY_COLOR = 3

_LIGHT_OMNI_SHADOW_CUBE :: Int
_LIGHT_OMNI_SHADOW_CUBE = 1

_PRIMITIVE_TRIANGLE_STRIP :: Int
_PRIMITIVE_TRIANGLE_STRIP = 5

_VIEWPORT_RENDER_INFO_MAX :: Int
_VIEWPORT_RENDER_INFO_MAX = 6

_PRIMITIVE_TRIANGLES :: Int
_PRIMITIVE_TRIANGLES = 4

_TEXTURE_FLAGS_DEFAULT :: Int
_TEXTURE_FLAGS_DEFAULT = 7

_VIEWPORT_USAGE_3D_NO_EFFECTS :: Int
_VIEWPORT_USAGE_3D_NO_EFFECTS = 3

_ARRAY_TEX_UV :: Int
_ARRAY_TEX_UV = 4

_VIEWPORT_CLEAR_ONLY_NEXT_FRAME :: Int
_VIEWPORT_CLEAR_ONLY_NEXT_FRAME = 2

_CANVAS_LIGHT_FILTER_PCF7 :: Int
_CANVAS_LIGHT_FILTER_PCF7 = 3

_BLEND_SHAPE_MODE_NORMALIZED :: Int
_BLEND_SHAPE_MODE_NORMALIZED = 0

_ENV_BG_COLOR_SKY :: Int
_ENV_BG_COLOR_SKY = 3

_PRIMITIVE_LINE_LOOP :: Int
_PRIMITIVE_LINE_LOOP = 3

_LIGHT_PARAM_SPECULAR :: Int
_LIGHT_PARAM_SPECULAR = 2

_VIEWPORT_MSAA_EXT_2X :: Int
_VIEWPORT_MSAA_EXT_2X = 5

_CANVAS_LIGHT_MODE_SUB :: Int
_CANVAS_LIGHT_MODE_SUB = 1

_VIEWPORT_USAGE_3D :: Int
_VIEWPORT_USAGE_3D = 2

_GLOW_BLEND_MODE_SOFTLIGHT :: Int
_GLOW_BLEND_MODE_SOFTLIGHT = 2

_PRIMITIVE_TRIANGLE_FAN :: Int
_PRIMITIVE_TRIANGLE_FAN = 6

_VIEWPORT_DEBUG_DRAW_UNSHADED :: Int
_VIEWPORT_DEBUG_DRAW_UNSHADED = 1

_MATERIAL_RENDER_PRIORITY_MIN :: Int
_MATERIAL_RENDER_PRIORITY_MIN = -128

_LIGHT_OMNI_SHADOW_DETAIL_VERTICAL :: Int
_LIGHT_OMNI_SHADOW_DETAIL_VERTICAL = 0

_INSTANCE_FLAG_MAX :: Int
_INSTANCE_FLAG_MAX = 2

_MULTIMESH_TRANSFORM_3D :: Int
_MULTIMESH_TRANSFORM_3D = 1

_SCENARIO_DEBUG_OVERDRAW :: Int
_SCENARIO_DEBUG_OVERDRAW = 2

_ARRAY_FORMAT_NORMAL :: Int
_ARRAY_FORMAT_NORMAL = 2

_MULTIMESH_CUSTOM_DATA_8BIT :: Int
_MULTIMESH_CUSTOM_DATA_8BIT = 1

_ARRAY_TEX_UV2 :: Int
_ARRAY_TEX_UV2 = 5

_ENV_DOF_BLUR_QUALITY_MEDIUM :: Int
_ENV_DOF_BLUR_QUALITY_MEDIUM = 1

_TEXTURE_TYPE_2D :: Int
_TEXTURE_TYPE_2D = 0

_ENV_BG_SKY :: Int
_ENV_BG_SKY = 2

_FEATURE_SHADERS :: Int
_FEATURE_SHADERS = 0

_CUBEMAP_TOP :: Int
_CUBEMAP_TOP = 3

_PARTICLES_DRAW_ORDER_VIEW_DEPTH :: Int
_PARTICLES_DRAW_ORDER_VIEW_DEPTH = 2

_CUBEMAP_BACK :: Int
_CUBEMAP_BACK = 5

_LIGHT_SPOT :: Int
_LIGHT_SPOT = 2

_LIGHT_DIRECTIONAL_SHADOW_PARALLEL_4_SPLITS :: Int
_LIGHT_DIRECTIONAL_SHADOW_PARALLEL_4_SPLITS = 2

_INSTANCE_PARTICLES :: Int
_INSTANCE_PARTICLES = 4

_TEXTURE_FLAG_REPEAT :: Int
_TEXTURE_FLAG_REPEAT = 2

_LIGHT_PARAM_SPOT_ATTENUATION :: Int
_LIGHT_PARAM_SPOT_ATTENUATION = 6

_REFLECTION_PROBE_UPDATE_ONCE :: Int
_REFLECTION_PROBE_UPDATE_ONCE = 0

_ARRAY_COMPRESS_DEFAULT :: Int
_ARRAY_COMPRESS_DEFAULT = 97280

_CANVAS_OCCLUDER_POLYGON_CULL_COUNTER_CLOCKWISE :: Int
_CANVAS_OCCLUDER_POLYGON_CULL_COUNTER_CLOCKWISE = 2

_CANVAS_ITEM_Z_MAX :: Int
_CANVAS_ITEM_Z_MAX = 4096

_ENV_TONE_MAPPER_LINEAR :: Int
_ENV_TONE_MAPPER_LINEAR = 0

_LIGHT_PARAM_SHADOW_SPLIT_3_OFFSET :: Int
_LIGHT_PARAM_SHADOW_SPLIT_3_OFFSET = 11

_VIEWPORT_RENDER_INFO_VERTICES_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_VERTICES_IN_FRAME = 1

_MULTIMESH_CUSTOM_DATA_NONE :: Int
_MULTIMESH_CUSTOM_DATA_NONE = 0

_LIGHT_OMNI :: Int
_LIGHT_OMNI = 1

_ENV_BG_MAX :: Int
_ENV_BG_MAX = 7

_INSTANCE_REFLECTION_PROBE :: Int
_INSTANCE_REFLECTION_PROBE = 6

_INFO_TEXTURE_MEM_USED :: Int
_INFO_TEXTURE_MEM_USED = 8

_INSTANCE_NONE :: Int
_INSTANCE_NONE = 0

_SHADER_CANVAS_ITEM :: Int
_SHADER_CANVAS_ITEM = 1

_ENV_SSAO_QUALITY_MEDIUM :: Int
_ENV_SSAO_QUALITY_MEDIUM = 1

_CANVAS_LIGHT_FILTER_PCF3 :: Int
_CANVAS_LIGHT_FILTER_PCF3 = 1

_ARRAY_FORMAT_BONES :: Int
_ARRAY_FORMAT_BONES = 64

_LIGHT_PARAM_SPOT_ANGLE :: Int
_LIGHT_PARAM_SPOT_ANGLE = 5

_ARRAY_WEIGHTS_SIZE :: Int
_ARRAY_WEIGHTS_SIZE = 4

_SHADOW_CASTING_SETTING_DOUBLE_SIDED :: Int
_SHADOW_CASTING_SETTING_DOUBLE_SIDED = 2

_ENV_SSAO_QUALITY_HIGH :: Int
_ENV_SSAO_QUALITY_HIGH = 2

_INFO_VERTICES_IN_FRAME :: Int
_INFO_VERTICES_IN_FRAME = 1

_INFO_VIDEO_MEM_USED :: Int
_INFO_VIDEO_MEM_USED = 7

_GLOW_BLEND_MODE_REPLACE :: Int
_GLOW_BLEND_MODE_REPLACE = 3

_NINE_PATCH_TILE_FIT :: Int
_NINE_PATCH_TILE_FIT = 2

_VIEWPORT_UPDATE_ONCE :: Int
_VIEWPORT_UPDATE_ONCE = 1

_ARRAY_COMPRESS_COLOR :: Int
_ARRAY_COMPRESS_COLOR = 4096

_GLOW_BLEND_MODE_SCREEN :: Int
_GLOW_BLEND_MODE_SCREEN = 1

_MAX_CURSORS :: Int
_MAX_CURSORS = 8

_TEXTURE_FLAG_CONVERT_TO_LINEAR :: Int
_TEXTURE_FLAG_CONVERT_TO_LINEAR = 16

_PRIMITIVE_MAX :: Int
_PRIMITIVE_MAX = 7

_LIGHT_PARAM_CONTACT_SHADOW_SIZE :: Int
_LIGHT_PARAM_CONTACT_SHADOW_SIZE = 7

_INSTANCE_MAX :: Int
_INSTANCE_MAX = 9

_ENV_SSAO_BLUR_3x3 :: Int
_ENV_SSAO_BLUR_3x3 = 3

_ARRAY_WEIGHTS :: Int
_ARRAY_WEIGHTS = 7

_LIGHT_PARAM_MAX :: Int
_LIGHT_PARAM_MAX = 15

_CUBEMAP_BOTTOM :: Int
_CUBEMAP_BOTTOM = 2

_ARRAY_TANGENT :: Int
_ARRAY_TANGENT = 2

_SCENARIO_DEBUG_SHADELESS :: Int
_SCENARIO_DEBUG_SHADELESS = 3

_INFO_OBJECTS_IN_FRAME :: Int
_INFO_OBJECTS_IN_FRAME = 0

_INSTANCE_GI_PROBE :: Int
_INSTANCE_GI_PROBE = 7

_LIGHT_PARAM_SHADOW_NORMAL_BIAS :: Int
_LIGHT_PARAM_SHADOW_NORMAL_BIAS = 12

_VIEWPORT_USAGE_2D_NO_SAMPLING :: Int
_VIEWPORT_USAGE_2D_NO_SAMPLING = 1

_ENV_SSAO_BLUR_2x2 :: Int
_ENV_SSAO_BLUR_2x2 = 2

_VIEWPORT_UPDATE_DISABLED :: Int
_VIEWPORT_UPDATE_DISABLED = 0

_SHADOW_CASTING_SETTING_OFF :: Int
_SHADOW_CASTING_SETTING_OFF = 0

_VIEWPORT_MSAA_16X :: Int
_VIEWPORT_MSAA_16X = 4

_CANVAS_LIGHT_FILTER_PCF9 :: Int
_CANVAS_LIGHT_FILTER_PCF9 = 4

_ENV_SSAO_BLUR_DISABLED :: Int
_ENV_SSAO_BLUR_DISABLED = 0

_TEXTURE_FLAG_ANISOTROPIC_FILTER :: Int
_TEXTURE_FLAG_ANISOTROPIC_FILTER = 8

_FEATURE_MULTITHREADED :: Int
_FEATURE_MULTITHREADED = 1

_ENV_SSAO_BLUR_1x1 :: Int
_ENV_SSAO_BLUR_1x1 = 1

_INFO_DRAW_CALLS_IN_FRAME :: Int
_INFO_DRAW_CALLS_IN_FRAME = 5

_ENV_BG_COLOR :: Int
_ENV_BG_COLOR = 1

_ENV_TONE_MAPPER_ACES :: Int
_ENV_TONE_MAPPER_ACES = 3

_LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_STABLE :: Int
_LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_STABLE = 0

_LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_OPTIMIZED :: Int
_LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_OPTIMIZED = 1

_ARRAY_COMPRESS_TEX_UV2 :: Int
_ARRAY_COMPRESS_TEX_UV2 = 16384

_MULTIMESH_COLOR_8BIT :: Int
_MULTIMESH_COLOR_8BIT = 1

_MULTIMESH_TRANSFORM_2D :: Int
_MULTIMESH_TRANSFORM_2D = 0

_VIEWPORT_UPDATE_WHEN_VISIBLE :: Int
_VIEWPORT_UPDATE_WHEN_VISIBLE = 2

_VIEWPORT_MSAA_EXT_4X :: Int
_VIEWPORT_MSAA_EXT_4X = 6

_INSTANCE_LIGHT :: Int
_INSTANCE_LIGHT = 5

_TEXTURE_TYPE_3D :: Int
_TEXTURE_TYPE_3D = 3

_TEXTURE_FLAG_MIPMAPS :: Int
_TEXTURE_FLAG_MIPMAPS = 1

_PRIMITIVE_LINE_STRIP :: Int
_PRIMITIVE_LINE_STRIP = 2

_TEXTURE_FLAG_FILTER :: Int
_TEXTURE_FLAG_FILTER = 4

_ENV_BG_KEEP :: Int
_ENV_BG_KEEP = 5

_CANVAS_LIGHT_FILTER_NONE :: Int
_CANVAS_LIGHT_FILTER_NONE = 0

_CUBEMAP_FRONT :: Int
_CUBEMAP_FRONT = 4

_TEXTURE_FLAG_USED_FOR_STREAMING :: Int
_TEXTURE_FLAG_USED_FOR_STREAMING = 2048

_INFO_VERTEX_MEM_USED :: Int
_INFO_VERTEX_MEM_USED = 9

_TEXTURE_FLAG_MIRRORED_REPEAT :: Int
_TEXTURE_FLAG_MIRRORED_REPEAT = 32

_PRIMITIVE_LINES :: Int
_PRIMITIVE_LINES = 1

_VIEWPORT_RENDER_INFO_OBJECTS_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_OBJECTS_IN_FRAME = 0

_ENV_BG_CLEAR_COLOR :: Int
_ENV_BG_CLEAR_COLOR = 0

_SHADOW_CASTING_SETTING_ON :: Int
_SHADOW_CASTING_SETTING_ON = 1

_SCENARIO_DEBUG_WIREFRAME :: Int
_SCENARIO_DEBUG_WIREFRAME = 1

_CANVAS_LIGHT_MODE_ADD :: Int
_CANVAS_LIGHT_MODE_ADD = 0

_LIGHT_PARAM_SHADOW_BIAS_SPLIT_SCALE :: Int
_LIGHT_PARAM_SHADOW_BIAS_SPLIT_SCALE = 14

_VIEWPORT_RENDER_INFO_DRAW_CALLS_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_DRAW_CALLS_IN_FRAME = 5

_ARRAY_BONES :: Int
_ARRAY_BONES = 6

_LIGHT_PARAM_ATTENUATION :: Int
_LIGHT_PARAM_ATTENUATION = 4

_VIEWPORT_DEBUG_DRAW_WIREFRAME :: Int
_VIEWPORT_DEBUG_DRAW_WIREFRAME = 3

_CANVAS_LIGHT_MODE_MIX :: Int
_CANVAS_LIGHT_MODE_MIX = 2

_NINE_PATCH_TILE :: Int
_NINE_PATCH_TILE = 1

_VIEWPORT_RENDER_INFO_SHADER_CHANGES_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_SHADER_CHANGES_IN_FRAME = 3

_INSTANCE_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE :: Int
_INSTANCE_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE = 1

_CANVAS_LIGHT_MODE_MASK :: Int
_CANVAS_LIGHT_MODE_MASK = 3

_LIGHT_PARAM_RANGE :: Int
_LIGHT_PARAM_RANGE = 3

_BLEND_SHAPE_MODE_RELATIVE :: Int
_BLEND_SHAPE_MODE_RELATIVE = 1

_VIEWPORT_MSAA_4X :: Int
_VIEWPORT_MSAA_4X = 2

_LIGHT_PARAM_SHADOW_SPLIT_1_OFFSET :: Int
_LIGHT_PARAM_SHADOW_SPLIT_1_OFFSET = 9

_ENV_TONE_MAPPER_REINHARD :: Int
_ENV_TONE_MAPPER_REINHARD = 1

_CANVAS_LIGHT_FILTER_PCF13 :: Int
_CANVAS_LIGHT_FILTER_PCF13 = 5

_MULTIMESH_CUSTOM_DATA_FLOAT :: Int
_MULTIMESH_CUSTOM_DATA_FLOAT = 2

_NO_INDEX_ARRAY :: Int
_NO_INDEX_ARRAY = -1

_ARRAY_VERTEX :: Int
_ARRAY_VERTEX = 0

_ARRAY_FLAG_USE_2D_VERTICES :: Int
_ARRAY_FLAG_USE_2D_VERTICES = 262144

_CANVAS_LIGHT_FILTER_PCF5 :: Int
_CANVAS_LIGHT_FILTER_PCF5 = 2

_LIGHT_DIRECTIONAL :: Int
_LIGHT_DIRECTIONAL = 0

_ARRAY_COMPRESS_INDEX :: Int
_ARRAY_COMPRESS_INDEX = 131072

_INSTANCE_FLAG_USE_BAKED_LIGHT :: Int
_INSTANCE_FLAG_USE_BAKED_LIGHT = 0

_CUBEMAP_LEFT :: Int
_CUBEMAP_LEFT = 0

_LIGHT_PARAM_SHADOW_BIAS :: Int
_LIGHT_PARAM_SHADOW_BIAS = 13

_ARRAY_FORMAT_WEIGHTS :: Int
_ARRAY_FORMAT_WEIGHTS = 128

_SHADER_PARTICLES :: Int
_SHADER_PARTICLES = 2

_ARRAY_FORMAT_TANGENT :: Int
_ARRAY_FORMAT_TANGENT = 4

_PRIMITIVE_POINTS :: Int
_PRIMITIVE_POINTS = 0

sig_frame_post_draw :: Godot.Internal.Dispatch.Signal VisualServer
sig_frame_post_draw
  = Godot.Internal.Dispatch.Signal "frame_post_draw"

sig_frame_pre_draw :: Godot.Internal.Dispatch.Signal VisualServer
sig_frame_pre_draw
  = Godot.Internal.Dispatch.Signal "frame_pre_draw"

{-# NOINLINE bindVisualServer_black_bars_set_images #-}

-- | Sets images to be rendered in the window margin.
bindVisualServer_black_bars_set_images :: MethodBind
bindVisualServer_black_bars_set_images
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "black_bars_set_images" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets images to be rendered in the window margin.
black_bars_set_images ::
                        (VisualServer :< cls, Object :< cls) =>
                        cls -> Rid -> Rid -> Rid -> Rid -> IO ()
black_bars_set_images cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_black_bars_set_images
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_black_bars_set_margins #-}

-- | Sets margin size, where black bars (or images, if [method black_bars_set_images] was used) are rendered.
bindVisualServer_black_bars_set_margins :: MethodBind
bindVisualServer_black_bars_set_margins
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "black_bars_set_margins" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets margin size, where black bars (or images, if [method black_bars_set_images] was used) are rendered.
black_bars_set_margins ::
                         (VisualServer :< cls, Object :< cls) =>
                         cls -> Int -> Int -> Int -> Int -> IO ()
black_bars_set_margins cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_black_bars_set_margins
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_camera_create #-}

bindVisualServer_camera_create :: MethodBind
bindVisualServer_camera_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

camera_create ::
                (VisualServer :< cls, Object :< cls) => cls -> IO Rid
camera_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_camera_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_camera_set_cull_mask #-}

bindVisualServer_camera_set_cull_mask :: MethodBind
bindVisualServer_camera_set_cull_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

camera_set_cull_mask ::
                       (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
camera_set_cull_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_camera_set_cull_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_camera_set_environment #-}

bindVisualServer_camera_set_environment :: MethodBind
bindVisualServer_camera_set_environment
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

camera_set_environment ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
camera_set_environment cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_camera_set_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_camera_set_frustum #-}

bindVisualServer_camera_set_frustum :: MethodBind
bindVisualServer_camera_set_frustum
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_frustum" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

camera_set_frustum ::
                     (VisualServer :< cls, Object :< cls) =>
                     cls -> Rid -> Float -> Vector2 -> Float -> Float -> IO ()
camera_set_frustum cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_camera_set_frustum
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_camera_set_orthogonal #-}

bindVisualServer_camera_set_orthogonal :: MethodBind
bindVisualServer_camera_set_orthogonal
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_orthogonal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

camera_set_orthogonal ::
                        (VisualServer :< cls, Object :< cls) =>
                        cls -> Rid -> Float -> Float -> Float -> IO ()
camera_set_orthogonal cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_camera_set_orthogonal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_camera_set_perspective #-}

bindVisualServer_camera_set_perspective :: MethodBind
bindVisualServer_camera_set_perspective
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_perspective" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

camera_set_perspective ::
                         (VisualServer :< cls, Object :< cls) =>
                         cls -> Rid -> Float -> Float -> Float -> IO ()
camera_set_perspective cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_camera_set_perspective
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_camera_set_transform #-}

bindVisualServer_camera_set_transform :: MethodBind
bindVisualServer_camera_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

camera_set_transform ::
                       (VisualServer :< cls, Object :< cls) =>
                       cls -> Rid -> Transform -> IO ()
camera_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_camera_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_camera_set_use_vertical_aspect #-}

bindVisualServer_camera_set_use_vertical_aspect :: MethodBind
bindVisualServer_camera_set_use_vertical_aspect
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_use_vertical_aspect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

camera_set_use_vertical_aspect ::
                                 (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
camera_set_use_vertical_aspect cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_camera_set_use_vertical_aspect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_create #-}

-- | Creates a canvas and returns the assigned [RID].
bindVisualServer_canvas_create :: MethodBind
bindVisualServer_canvas_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a canvas and returns the assigned [RID].
canvas_create ::
                (VisualServer :< cls, Object :< cls) => cls -> IO Rid
canvas_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_circle #-}

-- | Adds a circle command to the [CanvasItem]'s draw commands.
bindVisualServer_canvas_item_add_circle :: MethodBind
bindVisualServer_canvas_item_add_circle
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_circle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a circle command to the [CanvasItem]'s draw commands.
canvas_item_add_circle ::
                         (VisualServer :< cls, Object :< cls) =>
                         cls -> Rid -> Vector2 -> Float -> Color -> IO ()
canvas_item_add_circle cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_circle
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_clip_ignore #-}

-- | If ignore is [code]true[/code], the VisualServer does not perform clipping.
bindVisualServer_canvas_item_add_clip_ignore :: MethodBind
bindVisualServer_canvas_item_add_clip_ignore
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_clip_ignore" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If ignore is [code]true[/code], the VisualServer does not perform clipping.
canvas_item_add_clip_ignore ::
                              (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
canvas_item_add_clip_ignore cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_clip_ignore
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_line #-}

-- | Adds a line command to the [CanvasItem]'s draw commands.
bindVisualServer_canvas_item_add_line :: MethodBind
bindVisualServer_canvas_item_add_line
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a line command to the [CanvasItem]'s draw commands.
canvas_item_add_line ::
                       (VisualServer :< cls, Object :< cls) =>
                       cls -> Rid -> Vector2 -> Vector2 -> Color -> Float -> Bool -> IO ()
canvas_item_add_line cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_line
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_mesh #-}

-- | Adds a [Mesh] to the [CanvasItem]'s draw commands. Only affects its aabb at the moment.
bindVisualServer_canvas_item_add_mesh :: MethodBind
bindVisualServer_canvas_item_add_mesh
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a [Mesh] to the [CanvasItem]'s draw commands. Only affects its aabb at the moment.
canvas_item_add_mesh ::
                       (VisualServer :< cls, Object :< cls) =>
                       cls -> Rid -> Rid -> Transform2d -> Color -> Rid -> Rid -> IO ()
canvas_item_add_mesh cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_multimesh #-}

-- | Adds a [MultiMesh] to the [CanvasItem]'s draw commands. Only affects its aabb at the moment.
bindVisualServer_canvas_item_add_multimesh :: MethodBind
bindVisualServer_canvas_item_add_multimesh
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a [MultiMesh] to the [CanvasItem]'s draw commands. Only affects its aabb at the moment.
canvas_item_add_multimesh ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Rid -> Rid -> Rid -> IO ()
canvas_item_add_multimesh cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_multimesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_nine_patch #-}

-- | Adds a nine patch image to the [CanvasItem]'s draw commands.
--   				See [NinePatchRect] for more explanation.
bindVisualServer_canvas_item_add_nine_patch :: MethodBind
bindVisualServer_canvas_item_add_nine_patch
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_nine_patch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a nine patch image to the [CanvasItem]'s draw commands.
--   				See [NinePatchRect] for more explanation.
canvas_item_add_nine_patch ::
                             (VisualServer :< cls, Object :< cls) =>
                             cls ->
                               Rid ->
                                 Rect2 ->
                                   Rect2 ->
                                     Rid ->
                                       Vector2 ->
                                         Vector2 -> Int -> Int -> Bool -> Color -> Rid -> IO ()
canvas_item_add_nine_patch cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  arg8 arg9 arg10 arg11
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9, toVariant arg10, toVariant arg11]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_nine_patch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_particles #-}

-- | Adds a particles system to the [CanvasItem]'s draw commands.
bindVisualServer_canvas_item_add_particles :: MethodBind
bindVisualServer_canvas_item_add_particles
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_particles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a particles system to the [CanvasItem]'s draw commands.
canvas_item_add_particles ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Rid -> Rid -> Rid -> IO ()
canvas_item_add_particles cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_particles
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_polygon #-}

-- | Adds a polygon to the [CanvasItem]'s draw commands.
bindVisualServer_canvas_item_add_polygon :: MethodBind
bindVisualServer_canvas_item_add_polygon
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a polygon to the [CanvasItem]'s draw commands.
canvas_item_add_polygon ::
                          (VisualServer :< cls, Object :< cls) =>
                          cls ->
                            Rid ->
                              PoolVector2Array ->
                                PoolColorArray -> PoolVector2Array -> Rid -> Rid -> Bool -> IO ()
canvas_item_add_polygon cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_polyline #-}

-- | Adds a polyline, which is a line from multiple points with a width, to the [CanvasItem]'s draw commands.
bindVisualServer_canvas_item_add_polyline :: MethodBind
bindVisualServer_canvas_item_add_polyline
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_polyline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a polyline, which is a line from multiple points with a width, to the [CanvasItem]'s draw commands.
canvas_item_add_polyline ::
                           (VisualServer :< cls, Object :< cls) =>
                           cls ->
                             Rid -> PoolVector2Array -> PoolColorArray -> Float -> Bool -> IO ()
canvas_item_add_polyline cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_polyline
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_primitive #-}

-- | Adds a primitive to the [CanvasItem]'s draw commands.
bindVisualServer_canvas_item_add_primitive :: MethodBind
bindVisualServer_canvas_item_add_primitive
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_primitive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a primitive to the [CanvasItem]'s draw commands.
canvas_item_add_primitive ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls ->
                              Rid ->
                                PoolVector2Array ->
                                  PoolColorArray -> PoolVector2Array -> Rid -> Float -> Rid -> IO ()
canvas_item_add_primitive cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_primitive
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_rect #-}

-- | Adds a rectangle to the [CanvasItem]'s draw commands.
bindVisualServer_canvas_item_add_rect :: MethodBind
bindVisualServer_canvas_item_add_rect
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a rectangle to the [CanvasItem]'s draw commands.
canvas_item_add_rect ::
                       (VisualServer :< cls, Object :< cls) =>
                       cls -> Rid -> Rect2 -> Color -> IO ()
canvas_item_add_rect cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_set_transform #-}

-- | Adds a [Transform2D] command to the [CanvasItem]'s draw commands.
--   				This sets the extra_matrix uniform when executed. This affects the later commands of the canvas item.
bindVisualServer_canvas_item_add_set_transform :: MethodBind
bindVisualServer_canvas_item_add_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a [Transform2D] command to the [CanvasItem]'s draw commands.
--   				This sets the extra_matrix uniform when executed. This affects the later commands of the canvas item.
canvas_item_add_set_transform ::
                                (VisualServer :< cls, Object :< cls) =>
                                cls -> Rid -> Transform2d -> IO ()
canvas_item_add_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_add_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_texture_rect #-}

-- | Adds a textured rect to the [CanvasItem]'s draw commands.
bindVisualServer_canvas_item_add_texture_rect :: MethodBind
bindVisualServer_canvas_item_add_texture_rect
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_texture_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a textured rect to the [CanvasItem]'s draw commands.
canvas_item_add_texture_rect ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Rid -> Rect2 -> Rid -> Bool -> Color -> Bool -> Rid -> IO ()
canvas_item_add_texture_rect cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_add_texture_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_texture_rect_region
             #-}

-- | Adds a texture rect with region setting to the [CanvasItem]'s draw commands.
bindVisualServer_canvas_item_add_texture_rect_region :: MethodBind
bindVisualServer_canvas_item_add_texture_rect_region
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_texture_rect_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a texture rect with region setting to the [CanvasItem]'s draw commands.
canvas_item_add_texture_rect_region ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls ->
                                        Rid ->
                                          Rect2 ->
                                            Rid -> Rect2 -> Color -> Bool -> Rid -> Bool -> IO ()
canvas_item_add_texture_rect_region cls arg1 arg2 arg3 arg4 arg5
  arg6 arg7 arg8
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_add_texture_rect_region
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_add_triangle_array #-}

bindVisualServer_canvas_item_add_triangle_array :: MethodBind
bindVisualServer_canvas_item_add_triangle_array
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_triangle_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

canvas_item_add_triangle_array ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls ->
                                   Rid ->
                                     PoolIntArray ->
                                       PoolVector2Array ->
                                         PoolColorArray ->
                                           PoolVector2Array ->
                                             PoolIntArray ->
                                               PoolRealArray ->
                                                 Rid -> Int -> Rid -> Bool -> Bool -> IO ()
canvas_item_add_triangle_array cls arg1 arg2 arg3 arg4 arg5 arg6
  arg7 arg8 arg9 arg10 arg11 arg12
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9, toVariant arg10, toVariant arg11, toVariant arg12]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_add_triangle_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_clear #-}

-- | Clears the [CanvasItem] and removes all commands in it.
bindVisualServer_canvas_item_clear :: MethodBind
bindVisualServer_canvas_item_clear
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the [CanvasItem] and removes all commands in it.
canvas_item_clear ::
                    (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO ()
canvas_item_clear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_clear
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_create #-}

-- | Creates a new [CanvasItem] and returns its [RID].
bindVisualServer_canvas_item_create :: MethodBind
bindVisualServer_canvas_item_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new [CanvasItem] and returns its [RID].
canvas_item_create ::
                     (VisualServer :< cls, Object :< cls) => cls -> IO Rid
canvas_item_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_clip #-}

-- | Sets clipping for the [CanvasItem].
bindVisualServer_canvas_item_set_clip :: MethodBind
bindVisualServer_canvas_item_set_clip
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_clip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets clipping for the [CanvasItem].
canvas_item_set_clip ::
                       (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
canvas_item_set_clip cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_set_clip
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_copy_to_backbuffer
             #-}

-- | Sets the [CanvasItem] to copy a rect to the backbuffer.
bindVisualServer_canvas_item_set_copy_to_backbuffer :: MethodBind
bindVisualServer_canvas_item_set_copy_to_backbuffer
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_copy_to_backbuffer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [CanvasItem] to copy a rect to the backbuffer.
canvas_item_set_copy_to_backbuffer ::
                                     (VisualServer :< cls, Object :< cls) =>
                                     cls -> Rid -> Bool -> Rect2 -> IO ()
canvas_item_set_copy_to_backbuffer cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_set_copy_to_backbuffer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_custom_rect #-}

-- | Defines a custom drawing rectangle for the [CanvasItem].
bindVisualServer_canvas_item_set_custom_rect :: MethodBind
bindVisualServer_canvas_item_set_custom_rect
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_custom_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines a custom drawing rectangle for the [CanvasItem].
canvas_item_set_custom_rect ::
                              (VisualServer :< cls, Object :< cls) =>
                              cls -> Rid -> Bool -> Rect2 -> IO ()
canvas_item_set_custom_rect cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_set_custom_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_distance_field_mode
             #-}

bindVisualServer_canvas_item_set_distance_field_mode :: MethodBind
bindVisualServer_canvas_item_set_distance_field_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_distance_field_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

canvas_item_set_distance_field_mode ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Bool -> IO ()
canvas_item_set_distance_field_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_set_distance_field_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_draw_behind_parent
             #-}

-- | Sets [CanvasItem] to be drawn behind its parent.
bindVisualServer_canvas_item_set_draw_behind_parent :: MethodBind
bindVisualServer_canvas_item_set_draw_behind_parent
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_draw_behind_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets [CanvasItem] to be drawn behind its parent.
canvas_item_set_draw_behind_parent ::
                                     (VisualServer :< cls, Object :< cls) =>
                                     cls -> Rid -> Bool -> IO ()
canvas_item_set_draw_behind_parent cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_set_draw_behind_parent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_draw_index #-}

-- | Sets the index for the [CanvasItem].
bindVisualServer_canvas_item_set_draw_index :: MethodBind
bindVisualServer_canvas_item_set_draw_index
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_draw_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the index for the [CanvasItem].
canvas_item_set_draw_index ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
canvas_item_set_draw_index cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_set_draw_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_light_mask #-}

-- | The light mask. See [LightOccluder2D] for more information on light masks.
bindVisualServer_canvas_item_set_light_mask :: MethodBind
bindVisualServer_canvas_item_set_light_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light mask. See [LightOccluder2D] for more information on light masks.
canvas_item_set_light_mask ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
canvas_item_set_light_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_set_light_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_material #-}

-- | Sets a new material to the [CanvasItem].
bindVisualServer_canvas_item_set_material :: MethodBind
bindVisualServer_canvas_item_set_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a new material to the [CanvasItem].
canvas_item_set_material ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
canvas_item_set_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_set_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_modulate #-}

-- | Sets the color that modulates the [CanvasItem] and its children.
bindVisualServer_canvas_item_set_modulate :: MethodBind
bindVisualServer_canvas_item_set_modulate
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color that modulates the [CanvasItem] and its children.
canvas_item_set_modulate ::
                           (VisualServer :< cls, Object :< cls) =>
                           cls -> Rid -> Color -> IO ()
canvas_item_set_modulate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_set_modulate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_parent #-}

-- | Sets the parent for the [CanvasItem].
bindVisualServer_canvas_item_set_parent :: MethodBind
bindVisualServer_canvas_item_set_parent
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the parent for the [CanvasItem].
canvas_item_set_parent ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
canvas_item_set_parent cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_set_parent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_self_modulate #-}

-- | Sets the color that modulates the [CanvasItem] without children.
bindVisualServer_canvas_item_set_self_modulate :: MethodBind
bindVisualServer_canvas_item_set_self_modulate
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_self_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color that modulates the [CanvasItem] without children.
canvas_item_set_self_modulate ::
                                (VisualServer :< cls, Object :< cls) =>
                                cls -> Rid -> Color -> IO ()
canvas_item_set_self_modulate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_set_self_modulate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_sort_children_by_y
             #-}

-- | Sets if [CanvasItem]'s children should be sorted by y-position.
bindVisualServer_canvas_item_set_sort_children_by_y :: MethodBind
bindVisualServer_canvas_item_set_sort_children_by_y
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_sort_children_by_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets if [CanvasItem]'s children should be sorted by y-position.
canvas_item_set_sort_children_by_y ::
                                     (VisualServer :< cls, Object :< cls) =>
                                     cls -> Rid -> Bool -> IO ()
canvas_item_set_sort_children_by_y cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_set_sort_children_by_y
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_transform #-}

-- | Sets the [CanvasItem]'s [Transform2D].
bindVisualServer_canvas_item_set_transform :: MethodBind
bindVisualServer_canvas_item_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [CanvasItem]'s [Transform2D].
canvas_item_set_transform ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Transform2d -> IO ()
canvas_item_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_use_parent_material
             #-}

-- | Sets if the [CanvasItem] uses its parent's material.
bindVisualServer_canvas_item_set_use_parent_material :: MethodBind
bindVisualServer_canvas_item_set_use_parent_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_use_parent_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets if the [CanvasItem] uses its parent's material.
canvas_item_set_use_parent_material ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Bool -> IO ()
canvas_item_set_use_parent_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_set_use_parent_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_visible #-}

-- | Sets if the canvas item (including its children) is visible.
bindVisualServer_canvas_item_set_visible :: MethodBind
bindVisualServer_canvas_item_set_visible
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets if the canvas item (including its children) is visible.
canvas_item_set_visible ::
                          (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
canvas_item_set_visible cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_set_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_z_as_relative_to_parent
             #-}

-- | If this is enabled, the z-index of the parent will be added to the children's z-index.
bindVisualServer_canvas_item_set_z_as_relative_to_parent ::
                                                         MethodBind
bindVisualServer_canvas_item_set_z_as_relative_to_parent
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_z_as_relative_to_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If this is enabled, the z-index of the parent will be added to the children's z-index.
canvas_item_set_z_as_relative_to_parent ::
                                          (VisualServer :< cls, Object :< cls) =>
                                          cls -> Rid -> Bool -> IO ()
canvas_item_set_z_as_relative_to_parent cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_set_z_as_relative_to_parent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_item_set_z_index #-}

-- | Sets the [CanvasItem]'s z-index, i.e. its draw order (lower indexes are drawn first).
bindVisualServer_canvas_item_set_z_index :: MethodBind
bindVisualServer_canvas_item_set_z_index
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the [CanvasItem]'s z-index, i.e. its draw order (lower indexes are drawn first).
canvas_item_set_z_index ::
                          (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
canvas_item_set_z_index cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_set_z_index
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_attach_to_canvas #-}

-- | Attaches the canvas light to the canvas. Removes it from its previous canvas.
bindVisualServer_canvas_light_attach_to_canvas :: MethodBind
bindVisualServer_canvas_light_attach_to_canvas
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_attach_to_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Attaches the canvas light to the canvas. Removes it from its previous canvas.
canvas_light_attach_to_canvas ::
                                (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
canvas_light_attach_to_canvas cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_attach_to_canvas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_create #-}

-- | Creates a canvas light.
bindVisualServer_canvas_light_create :: MethodBind
bindVisualServer_canvas_light_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a canvas light.
canvas_light_create ::
                      (VisualServer :< cls, Object :< cls) => cls -> IO Rid
canvas_light_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_light_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_occluder_attach_to_canvas
             #-}

-- | Attaches a light occluder to the canvas. Removes it from its previous canvas.
bindVisualServer_canvas_light_occluder_attach_to_canvas ::
                                                        MethodBind
bindVisualServer_canvas_light_occluder_attach_to_canvas
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_occluder_attach_to_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Attaches a light occluder to the canvas. Removes it from its previous canvas.
canvas_light_occluder_attach_to_canvas ::
                                         (VisualServer :< cls, Object :< cls) =>
                                         cls -> Rid -> Rid -> IO ()
canvas_light_occluder_attach_to_canvas cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_occluder_attach_to_canvas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_occluder_create #-}

-- | Creates a light occluder.
bindVisualServer_canvas_light_occluder_create :: MethodBind
bindVisualServer_canvas_light_occluder_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_occluder_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a light occluder.
canvas_light_occluder_create ::
                               (VisualServer :< cls, Object :< cls) => cls -> IO Rid
canvas_light_occluder_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_occluder_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_occluder_set_enabled #-}

-- | Enables or disables light occluder.
bindVisualServer_canvas_light_occluder_set_enabled :: MethodBind
bindVisualServer_canvas_light_occluder_set_enabled
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_occluder_set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables or disables light occluder.
canvas_light_occluder_set_enabled ::
                                    (VisualServer :< cls, Object :< cls) =>
                                    cls -> Rid -> Bool -> IO ()
canvas_light_occluder_set_enabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_occluder_set_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_occluder_set_light_mask
             #-}

-- | The light mask. See [LightOccluder2D] for more information on light masks
bindVisualServer_canvas_light_occluder_set_light_mask :: MethodBind
bindVisualServer_canvas_light_occluder_set_light_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_occluder_set_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light mask. See [LightOccluder2D] for more information on light masks
canvas_light_occluder_set_light_mask ::
                                       (VisualServer :< cls, Object :< cls) =>
                                       cls -> Rid -> Int -> IO ()
canvas_light_occluder_set_light_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_occluder_set_light_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_occluder_set_polygon #-}

-- | Sets a light occluder's polygon.
bindVisualServer_canvas_light_occluder_set_polygon :: MethodBind
bindVisualServer_canvas_light_occluder_set_polygon
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_occluder_set_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a light occluder's polygon.
canvas_light_occluder_set_polygon ::
                                    (VisualServer :< cls, Object :< cls) =>
                                    cls -> Rid -> Rid -> IO ()
canvas_light_occluder_set_polygon cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_occluder_set_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_occluder_set_transform
             #-}

-- | Sets a light occluder's [Transform2D].
bindVisualServer_canvas_light_occluder_set_transform :: MethodBind
bindVisualServer_canvas_light_occluder_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_occluder_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a light occluder's [Transform2D].
canvas_light_occluder_set_transform ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Transform2d -> IO ()
canvas_light_occluder_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_occluder_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_color #-}

-- | Sets the color for a light.
bindVisualServer_canvas_light_set_color :: MethodBind
bindVisualServer_canvas_light_set_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color for a light.
canvas_light_set_color ::
                         (VisualServer :< cls, Object :< cls) =>
                         cls -> Rid -> Color -> IO ()
canvas_light_set_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_light_set_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_enabled #-}

-- | Enables or disables a canvas light.
bindVisualServer_canvas_light_set_enabled :: MethodBind
bindVisualServer_canvas_light_set_enabled
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables or disables a canvas light.
canvas_light_set_enabled ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
canvas_light_set_enabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_light_set_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_energy #-}

-- | Sets a canvas light's energy.
bindVisualServer_canvas_light_set_energy :: MethodBind
bindVisualServer_canvas_light_set_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a canvas light's energy.
canvas_light_set_energy ::
                          (VisualServer :< cls, Object :< cls) =>
                          cls -> Rid -> Float -> IO ()
canvas_light_set_energy cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_light_set_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_height #-}

-- | Sets a canvas light's height.
bindVisualServer_canvas_light_set_height :: MethodBind
bindVisualServer_canvas_light_set_height
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a canvas light's height.
canvas_light_set_height ::
                          (VisualServer :< cls, Object :< cls) =>
                          cls -> Rid -> Float -> IO ()
canvas_light_set_height cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_light_set_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_item_cull_mask #-}

-- | The light mask. See [LightOccluder2D] for more information on light masks
bindVisualServer_canvas_light_set_item_cull_mask :: MethodBind
bindVisualServer_canvas_light_set_item_cull_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_item_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light mask. See [LightOccluder2D] for more information on light masks
canvas_light_set_item_cull_mask ::
                                  (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
canvas_light_set_item_cull_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_set_item_cull_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_item_shadow_cull_mask
             #-}

-- | The shadow mask. binary about which layers this canvas light affects which canvas item's shadows. See [LightOccluder2D] for more information on light masks.
bindVisualServer_canvas_light_set_item_shadow_cull_mask ::
                                                        MethodBind
bindVisualServer_canvas_light_set_item_shadow_cull_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_item_shadow_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The shadow mask. binary about which layers this canvas light affects which canvas item's shadows. See [LightOccluder2D] for more information on light masks.
canvas_light_set_item_shadow_cull_mask ::
                                         (VisualServer :< cls, Object :< cls) =>
                                         cls -> Rid -> Int -> IO ()
canvas_light_set_item_shadow_cull_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_set_item_shadow_cull_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_layer_range #-}

-- | The layer range that gets rendered with this light.
bindVisualServer_canvas_light_set_layer_range :: MethodBind
bindVisualServer_canvas_light_set_layer_range
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_layer_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The layer range that gets rendered with this light.
canvas_light_set_layer_range ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> Int -> IO ()
canvas_light_set_layer_range cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_set_layer_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_mode #-}

-- | The mode of the light, see CANVAS_LIGHT_MODE_* constants.
bindVisualServer_canvas_light_set_mode :: MethodBind
bindVisualServer_canvas_light_set_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mode of the light, see CANVAS_LIGHT_MODE_* constants.
canvas_light_set_mode ::
                        (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
canvas_light_set_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_light_set_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_scale #-}

bindVisualServer_canvas_light_set_scale :: MethodBind
bindVisualServer_canvas_light_set_scale
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

canvas_light_set_scale ::
                         (VisualServer :< cls, Object :< cls) =>
                         cls -> Rid -> Float -> IO ()
canvas_light_set_scale cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_light_set_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_shadow_buffer_size
             #-}

-- | Sets the width of the shadow buffer, size gets scaled to the next power of two for this.
bindVisualServer_canvas_light_set_shadow_buffer_size :: MethodBind
bindVisualServer_canvas_light_set_shadow_buffer_size
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_shadow_buffer_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the width of the shadow buffer, size gets scaled to the next power of two for this.
canvas_light_set_shadow_buffer_size ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Int -> IO ()
canvas_light_set_shadow_buffer_size cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_set_shadow_buffer_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_shadow_color #-}

-- | Sets the color of the canvas light's shadow.
bindVisualServer_canvas_light_set_shadow_color :: MethodBind
bindVisualServer_canvas_light_set_shadow_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color of the canvas light's shadow.
canvas_light_set_shadow_color ::
                                (VisualServer :< cls, Object :< cls) =>
                                cls -> Rid -> Color -> IO ()
canvas_light_set_shadow_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_set_shadow_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_shadow_enabled #-}

-- | Enables or disables the canvas light's shadow.
bindVisualServer_canvas_light_set_shadow_enabled :: MethodBind
bindVisualServer_canvas_light_set_shadow_enabled
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_shadow_enabled" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables or disables the canvas light's shadow.
canvas_light_set_shadow_enabled ::
                                  (VisualServer :< cls, Object :< cls) =>
                                  cls -> Rid -> Bool -> IO ()
canvas_light_set_shadow_enabled cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_set_shadow_enabled
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_shadow_filter #-}

-- | Sets the canvas light's shadow's filter, see CANVAS_LIGHT_SHADOW_FILTER_* constants.
bindVisualServer_canvas_light_set_shadow_filter :: MethodBind
bindVisualServer_canvas_light_set_shadow_filter
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_shadow_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the canvas light's shadow's filter, see CANVAS_LIGHT_SHADOW_FILTER_* constants.
canvas_light_set_shadow_filter ::
                                 (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
canvas_light_set_shadow_filter cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_set_shadow_filter
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_shadow_gradient_length
             #-}

-- | Sets the length of the shadow's gradient.
bindVisualServer_canvas_light_set_shadow_gradient_length ::
                                                         MethodBind
bindVisualServer_canvas_light_set_shadow_gradient_length
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_shadow_gradient_length" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the length of the shadow's gradient.
canvas_light_set_shadow_gradient_length ::
                                          (VisualServer :< cls, Object :< cls) =>
                                          cls -> Rid -> Float -> IO ()
canvas_light_set_shadow_gradient_length cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_set_shadow_gradient_length
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_shadow_smooth #-}

-- | Smoothens the shadow. The lower, the more smooth.
bindVisualServer_canvas_light_set_shadow_smooth :: MethodBind
bindVisualServer_canvas_light_set_shadow_smooth
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_shadow_smooth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Smoothens the shadow. The lower, the more smooth.
canvas_light_set_shadow_smooth ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Float -> IO ()
canvas_light_set_shadow_smooth cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_set_shadow_smooth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_texture #-}

bindVisualServer_canvas_light_set_texture :: MethodBind
bindVisualServer_canvas_light_set_texture
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

canvas_light_set_texture ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
canvas_light_set_texture cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_light_set_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_texture_offset #-}

bindVisualServer_canvas_light_set_texture_offset :: MethodBind
bindVisualServer_canvas_light_set_texture_offset
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_texture_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

canvas_light_set_texture_offset ::
                                  (VisualServer :< cls, Object :< cls) =>
                                  cls -> Rid -> Vector2 -> IO ()
canvas_light_set_texture_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_light_set_texture_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_transform #-}

-- | Sets the canvas light's [Transform2D].
bindVisualServer_canvas_light_set_transform :: MethodBind
bindVisualServer_canvas_light_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the canvas light's [Transform2D].
canvas_light_set_transform ::
                             (VisualServer :< cls, Object :< cls) =>
                             cls -> Rid -> Transform2d -> IO ()
canvas_light_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_light_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_light_set_z_range #-}

bindVisualServer_canvas_light_set_z_range :: MethodBind
bindVisualServer_canvas_light_set_z_range
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_z_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

canvas_light_set_z_range ::
                           (VisualServer :< cls, Object :< cls) =>
                           cls -> Rid -> Int -> Int -> IO ()
canvas_light_set_z_range cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_light_set_z_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_occluder_polygon_create #-}

-- | Creates a new light occluder polygon.
bindVisualServer_canvas_occluder_polygon_create :: MethodBind
bindVisualServer_canvas_occluder_polygon_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_occluder_polygon_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new light occluder polygon.
canvas_occluder_polygon_create ::
                                 (VisualServer :< cls, Object :< cls) => cls -> IO Rid
canvas_occluder_polygon_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_occluder_polygon_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_occluder_polygon_set_cull_mode
             #-}

-- | Sets an occluder polygons cull mode. See CANVAS_OCCLUDER_POLYGON_CULL_MODE_* constants.
bindVisualServer_canvas_occluder_polygon_set_cull_mode ::
                                                       MethodBind
bindVisualServer_canvas_occluder_polygon_set_cull_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_occluder_polygon_set_cull_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an occluder polygons cull mode. See CANVAS_OCCLUDER_POLYGON_CULL_MODE_* constants.
canvas_occluder_polygon_set_cull_mode ::
                                        (VisualServer :< cls, Object :< cls) =>
                                        cls -> Rid -> Int -> IO ()
canvas_occluder_polygon_set_cull_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_occluder_polygon_set_cull_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_occluder_polygon_set_shape #-}

-- | Sets the shape of the occluder polygon.
bindVisualServer_canvas_occluder_polygon_set_shape :: MethodBind
bindVisualServer_canvas_occluder_polygon_set_shape
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_occluder_polygon_set_shape" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the shape of the occluder polygon.
canvas_occluder_polygon_set_shape ::
                                    (VisualServer :< cls, Object :< cls) =>
                                    cls -> Rid -> PoolVector2Array -> Bool -> IO ()
canvas_occluder_polygon_set_shape cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_occluder_polygon_set_shape
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_occluder_polygon_set_shape_as_lines
             #-}

-- | Sets the shape of the occluder polygon as lines.
bindVisualServer_canvas_occluder_polygon_set_shape_as_lines ::
                                                            MethodBind
bindVisualServer_canvas_occluder_polygon_set_shape_as_lines
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_occluder_polygon_set_shape_as_lines" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the shape of the occluder polygon as lines.
canvas_occluder_polygon_set_shape_as_lines ::
                                             (VisualServer :< cls, Object :< cls) =>
                                             cls -> Rid -> PoolVector2Array -> IO ()
canvas_occluder_polygon_set_shape_as_lines cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_occluder_polygon_set_shape_as_lines
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_set_item_mirroring #-}

-- | A copy of the canvas item will be drawn with a local offset of the mirroring [Vector2].
bindVisualServer_canvas_set_item_mirroring :: MethodBind
bindVisualServer_canvas_set_item_mirroring
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_set_item_mirroring" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A copy of the canvas item will be drawn with a local offset of the mirroring [Vector2].
canvas_set_item_mirroring ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Rid -> Vector2 -> IO ()
canvas_set_item_mirroring cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_set_item_mirroring
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_canvas_set_modulate #-}

-- | Modulates all colors in the given canvas.
bindVisualServer_canvas_set_modulate :: MethodBind
bindVisualServer_canvas_set_modulate
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_set_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Modulates all colors in the given canvas.
canvas_set_modulate ::
                      (VisualServer :< cls, Object :< cls) =>
                      cls -> Rid -> Color -> IO ()
canvas_set_modulate cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_set_modulate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_directional_light_create #-}

bindVisualServer_directional_light_create :: MethodBind
bindVisualServer_directional_light_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "directional_light_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

directional_light_create ::
                           (VisualServer :< cls, Object :< cls) => cls -> IO Rid
directional_light_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_directional_light_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_draw #-}

bindVisualServer_draw :: MethodBind
bindVisualServer_draw
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

draw ::
       (VisualServer :< cls, Object :< cls) =>
       cls -> Bool -> Float -> IO ()
draw cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_draw (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_create #-}

bindVisualServer_environment_create :: MethodBind
bindVisualServer_environment_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_create ::
                     (VisualServer :< cls, Object :< cls) => cls -> IO Rid
environment_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_adjustment #-}

bindVisualServer_environment_set_adjustment :: MethodBind
bindVisualServer_environment_set_adjustment
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_adjustment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_adjustment ::
                             (VisualServer :< cls, Object :< cls) =>
                             cls -> Rid -> Bool -> Float -> Float -> Float -> Rid -> IO ()
environment_set_adjustment cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_adjustment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_ambient_light #-}

bindVisualServer_environment_set_ambient_light :: MethodBind
bindVisualServer_environment_set_ambient_light
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_ambient_light" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_ambient_light ::
                                (VisualServer :< cls, Object :< cls) =>
                                cls -> Rid -> Color -> Float -> Float -> IO ()
environment_set_ambient_light cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_environment_set_ambient_light
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_background #-}

bindVisualServer_environment_set_background :: MethodBind
bindVisualServer_environment_set_background
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_background" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_background ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
environment_set_background cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_background
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_bg_color #-}

bindVisualServer_environment_set_bg_color :: MethodBind
bindVisualServer_environment_set_bg_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_bg_color ::
                           (VisualServer :< cls, Object :< cls) =>
                           cls -> Rid -> Color -> IO ()
environment_set_bg_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_bg_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_bg_energy #-}

bindVisualServer_environment_set_bg_energy :: MethodBind
bindVisualServer_environment_set_bg_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_bg_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_bg_energy ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Float -> IO ()
environment_set_bg_energy cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_bg_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_canvas_max_layer #-}

bindVisualServer_environment_set_canvas_max_layer :: MethodBind
bindVisualServer_environment_set_canvas_max_layer
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_canvas_max_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_canvas_max_layer ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> Int -> IO ()
environment_set_canvas_max_layer cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_environment_set_canvas_max_layer
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_dof_blur_far #-}

bindVisualServer_environment_set_dof_blur_far :: MethodBind
bindVisualServer_environment_set_dof_blur_far
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_dof_blur_far" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_dof_blur_far ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Rid -> Bool -> Float -> Float -> Float -> Int -> IO ()
environment_set_dof_blur_far cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_environment_set_dof_blur_far
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_dof_blur_near #-}

bindVisualServer_environment_set_dof_blur_near :: MethodBind
bindVisualServer_environment_set_dof_blur_near
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_dof_blur_near" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_dof_blur_near ::
                                (VisualServer :< cls, Object :< cls) =>
                                cls -> Rid -> Bool -> Float -> Float -> Float -> Int -> IO ()
environment_set_dof_blur_near cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_environment_set_dof_blur_near
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_fog #-}

bindVisualServer_environment_set_fog :: MethodBind
bindVisualServer_environment_set_fog
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_fog" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_fog ::
                      (VisualServer :< cls, Object :< cls) =>
                      cls -> Rid -> Bool -> Color -> Color -> Float -> IO ()
environment_set_fog cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_fog
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_fog_depth #-}

bindVisualServer_environment_set_fog_depth :: MethodBind
bindVisualServer_environment_set_fog_depth
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_fog_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_fog_depth ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls ->
                              Rid -> Bool -> Float -> Float -> Float -> Bool -> Float -> IO ()
environment_set_fog_depth cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_fog_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_fog_height #-}

bindVisualServer_environment_set_fog_height :: MethodBind
bindVisualServer_environment_set_fog_height
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_fog_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_fog_height ::
                             (VisualServer :< cls, Object :< cls) =>
                             cls -> Rid -> Bool -> Float -> Float -> Float -> IO ()
environment_set_fog_height cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_fog_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_glow #-}

bindVisualServer_environment_set_glow :: MethodBind
bindVisualServer_environment_set_glow
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_glow" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_glow ::
                       (VisualServer :< cls, Object :< cls) =>
                       cls ->
                         Rid ->
                           Bool ->
                             Int ->
                               Float ->
                                 Float -> Float -> Int -> Float -> Float -> Float -> Bool -> IO ()
environment_set_glow cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8
  arg9 arg10 arg11
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9, toVariant arg10, toVariant arg11]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_glow
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_sky #-}

bindVisualServer_environment_set_sky :: MethodBind
bindVisualServer_environment_set_sky
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_sky" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_sky ::
                      (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
environment_set_sky cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_sky
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_sky_custom_fov #-}

bindVisualServer_environment_set_sky_custom_fov :: MethodBind
bindVisualServer_environment_set_sky_custom_fov
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_sky_custom_fov" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_sky_custom_fov ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Float -> IO ()
environment_set_sky_custom_fov cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_environment_set_sky_custom_fov
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_sky_orientation #-}

bindVisualServer_environment_set_sky_orientation :: MethodBind
bindVisualServer_environment_set_sky_orientation
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_sky_orientation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_sky_orientation ::
                                  (VisualServer :< cls, Object :< cls) =>
                                  cls -> Rid -> Basis -> IO ()
environment_set_sky_orientation cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_environment_set_sky_orientation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_ssao #-}

bindVisualServer_environment_set_ssao :: MethodBind
bindVisualServer_environment_set_ssao
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_ssao" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_ssao ::
                       (VisualServer :< cls, Object :< cls) =>
                       cls ->
                         Rid ->
                           Bool ->
                             Float ->
                               Float ->
                                 Float ->
                                   Float ->
                                     Float ->
                                       Float -> Float -> Color -> Int -> Int -> Float -> IO ()
environment_set_ssao cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8
  arg9 arg10 arg11 arg12 arg13
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9, toVariant arg10, toVariant arg11, toVariant arg12,
       toVariant arg13]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_ssao
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_ssr #-}

bindVisualServer_environment_set_ssr :: MethodBind
bindVisualServer_environment_set_ssr
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_ssr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_ssr ::
                      (VisualServer :< cls, Object :< cls) =>
                      cls ->
                        Rid -> Bool -> Int -> Float -> Float -> Float -> Bool -> IO ()
environment_set_ssr cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_ssr
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_environment_set_tonemap #-}

bindVisualServer_environment_set_tonemap :: MethodBind
bindVisualServer_environment_set_tonemap
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_tonemap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

environment_set_tonemap ::
                          (VisualServer :< cls, Object :< cls) =>
                          cls ->
                            Rid ->
                              Int ->
                                Float -> Float -> Bool -> Float -> Float -> Float -> Float -> IO ()
environment_set_tonemap cls arg1 arg2 arg3 arg4 arg5 arg6 arg7 arg8
  arg9
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_environment_set_tonemap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_finish #-}

-- | Removes buffers and clears testcubes.
bindVisualServer_finish :: MethodBind
bindVisualServer_finish
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "finish" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes buffers and clears testcubes.
finish :: (VisualServer :< cls, Object :< cls) => cls -> IO ()
finish cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_finish (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_force_draw #-}

bindVisualServer_force_draw :: MethodBind
bindVisualServer_force_draw
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "force_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

force_draw ::
             (VisualServer :< cls, Object :< cls) =>
             cls -> Bool -> Float -> IO ()
force_draw cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_force_draw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_force_sync #-}

-- | Synchronizes threads.
bindVisualServer_force_sync :: MethodBind
bindVisualServer_force_sync
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "force_sync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Synchronizes threads.
force_sync :: (VisualServer :< cls, Object :< cls) => cls -> IO ()
force_sync cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_force_sync (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_free_rid #-}

-- | Tries to free an object in the VisualServer.
bindVisualServer_free_rid :: MethodBind
bindVisualServer_free_rid
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "free_rid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Tries to free an object in the VisualServer.
free_rid ::
           (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO ()
free_rid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_free_rid (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_get_render_info #-}

-- | Returns a certain information, see RENDER_INFO_* for options.
bindVisualServer_get_render_info :: MethodBind
bindVisualServer_get_render_info
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "get_render_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a certain information, see RENDER_INFO_* for options.
get_render_info ::
                  (VisualServer :< cls, Object :< cls) => cls -> Int -> IO Int
get_render_info cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_get_render_info
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_get_test_cube #-}

-- | Returns the id of the test cube. Creates one if none exists.
bindVisualServer_get_test_cube :: MethodBind
bindVisualServer_get_test_cube
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "get_test_cube" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the id of the test cube. Creates one if none exists.
get_test_cube ::
                (VisualServer :< cls, Object :< cls) => cls -> IO Rid
get_test_cube cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_get_test_cube (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_get_test_texture #-}

-- | Returns the id of the test texture. Creates one if none exists.
bindVisualServer_get_test_texture :: MethodBind
bindVisualServer_get_test_texture
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "get_test_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the id of the test texture. Creates one if none exists.
get_test_texture ::
                   (VisualServer :< cls, Object :< cls) => cls -> IO Rid
get_test_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_get_test_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_get_video_adapter_name #-}

bindVisualServer_get_video_adapter_name :: MethodBind
bindVisualServer_get_video_adapter_name
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "get_video_adapter_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_video_adapter_name ::
                         (VisualServer :< cls, Object :< cls) => cls -> IO GodotString
get_video_adapter_name cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_get_video_adapter_name
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_get_video_adapter_vendor #-}

bindVisualServer_get_video_adapter_vendor :: MethodBind
bindVisualServer_get_video_adapter_vendor
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "get_video_adapter_vendor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

get_video_adapter_vendor ::
                           (VisualServer :< cls, Object :< cls) => cls -> IO GodotString
get_video_adapter_vendor cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_get_video_adapter_vendor
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_get_white_texture #-}

-- | Returns the id of a white texture. Creates one if none exists.
bindVisualServer_get_white_texture :: MethodBind
bindVisualServer_get_white_texture
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "get_white_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the id of a white texture. Creates one if none exists.
get_white_texture ::
                    (VisualServer :< cls, Object :< cls) => cls -> IO Rid
get_white_texture cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_get_white_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_create #-}

bindVisualServer_gi_probe_create :: MethodBind
bindVisualServer_gi_probe_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_create ::
                  (VisualServer :< cls, Object :< cls) => cls -> IO Rid
gi_probe_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_get_bias #-}

bindVisualServer_gi_probe_get_bias :: MethodBind
bindVisualServer_gi_probe_get_bias
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_get_bias ::
                    (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Float
gi_probe_get_bias cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_get_bias
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_get_bounds #-}

bindVisualServer_gi_probe_get_bounds :: MethodBind
bindVisualServer_gi_probe_get_bounds
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_get_bounds ::
                      (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Aabb
gi_probe_get_bounds cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_get_bounds
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_get_cell_size #-}

bindVisualServer_gi_probe_get_cell_size :: MethodBind
bindVisualServer_gi_probe_get_cell_size
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_get_cell_size ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Float
gi_probe_get_cell_size cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_get_cell_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_get_dynamic_data #-}

bindVisualServer_gi_probe_get_dynamic_data :: MethodBind
bindVisualServer_gi_probe_get_dynamic_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_dynamic_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_get_dynamic_data ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> IO PoolIntArray
gi_probe_get_dynamic_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_get_dynamic_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_get_dynamic_range #-}

bindVisualServer_gi_probe_get_dynamic_range :: MethodBind
bindVisualServer_gi_probe_get_dynamic_range
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_dynamic_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_get_dynamic_range ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
gi_probe_get_dynamic_range cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_get_dynamic_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_get_energy #-}

bindVisualServer_gi_probe_get_energy :: MethodBind
bindVisualServer_gi_probe_get_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_get_energy ::
                      (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Float
gi_probe_get_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_get_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_get_normal_bias #-}

bindVisualServer_gi_probe_get_normal_bias :: MethodBind
bindVisualServer_gi_probe_get_normal_bias
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_normal_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_get_normal_bias ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Float
gi_probe_get_normal_bias cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_get_normal_bias
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_get_propagation #-}

bindVisualServer_gi_probe_get_propagation :: MethodBind
bindVisualServer_gi_probe_get_propagation
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_get_propagation ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Float
gi_probe_get_propagation cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_get_propagation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_get_to_cell_xform #-}

bindVisualServer_gi_probe_get_to_cell_xform :: MethodBind
bindVisualServer_gi_probe_get_to_cell_xform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_to_cell_xform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_get_to_cell_xform ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Transform
gi_probe_get_to_cell_xform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_get_to_cell_xform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_is_compressed #-}

bindVisualServer_gi_probe_is_compressed :: MethodBind
bindVisualServer_gi_probe_is_compressed
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_is_compressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_is_compressed ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
gi_probe_is_compressed cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_is_compressed
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_is_interior #-}

bindVisualServer_gi_probe_is_interior :: MethodBind
bindVisualServer_gi_probe_is_interior
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_is_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_is_interior ::
                       (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
gi_probe_is_interior cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_is_interior
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_set_bias #-}

bindVisualServer_gi_probe_set_bias :: MethodBind
bindVisualServer_gi_probe_set_bias
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_set_bias ::
                    (VisualServer :< cls, Object :< cls) =>
                    cls -> Rid -> Float -> IO ()
gi_probe_set_bias cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_set_bias
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_set_bounds #-}

bindVisualServer_gi_probe_set_bounds :: MethodBind
bindVisualServer_gi_probe_set_bounds
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_set_bounds ::
                      (VisualServer :< cls, Object :< cls) => cls -> Rid -> Aabb -> IO ()
gi_probe_set_bounds cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_set_bounds
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_set_cell_size #-}

bindVisualServer_gi_probe_set_cell_size :: MethodBind
bindVisualServer_gi_probe_set_cell_size
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_set_cell_size ::
                         (VisualServer :< cls, Object :< cls) =>
                         cls -> Rid -> Float -> IO ()
gi_probe_set_cell_size cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_set_cell_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_set_compress #-}

bindVisualServer_gi_probe_set_compress :: MethodBind
bindVisualServer_gi_probe_set_compress
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_compress" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_set_compress ::
                        (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
gi_probe_set_compress cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_set_compress
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_set_dynamic_data #-}

bindVisualServer_gi_probe_set_dynamic_data :: MethodBind
bindVisualServer_gi_probe_set_dynamic_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_dynamic_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_set_dynamic_data ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> PoolIntArray -> IO ()
gi_probe_set_dynamic_data cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_set_dynamic_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_set_dynamic_range #-}

bindVisualServer_gi_probe_set_dynamic_range :: MethodBind
bindVisualServer_gi_probe_set_dynamic_range
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_dynamic_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_set_dynamic_range ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
gi_probe_set_dynamic_range cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_set_dynamic_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_set_energy #-}

bindVisualServer_gi_probe_set_energy :: MethodBind
bindVisualServer_gi_probe_set_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_set_energy ::
                      (VisualServer :< cls, Object :< cls) =>
                      cls -> Rid -> Float -> IO ()
gi_probe_set_energy cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_set_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_set_interior #-}

bindVisualServer_gi_probe_set_interior :: MethodBind
bindVisualServer_gi_probe_set_interior
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_set_interior ::
                        (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
gi_probe_set_interior cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_set_interior
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_set_normal_bias #-}

bindVisualServer_gi_probe_set_normal_bias :: MethodBind
bindVisualServer_gi_probe_set_normal_bias
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_normal_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_set_normal_bias ::
                           (VisualServer :< cls, Object :< cls) =>
                           cls -> Rid -> Float -> IO ()
gi_probe_set_normal_bias cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_set_normal_bias
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_set_propagation #-}

bindVisualServer_gi_probe_set_propagation :: MethodBind
bindVisualServer_gi_probe_set_propagation
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_set_propagation ::
                           (VisualServer :< cls, Object :< cls) =>
                           cls -> Rid -> Float -> IO ()
gi_probe_set_propagation cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_set_propagation
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_gi_probe_set_to_cell_xform #-}

bindVisualServer_gi_probe_set_to_cell_xform :: MethodBind
bindVisualServer_gi_probe_set_to_cell_xform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_to_cell_xform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

gi_probe_set_to_cell_xform ::
                             (VisualServer :< cls, Object :< cls) =>
                             cls -> Rid -> Transform -> IO ()
gi_probe_set_to_cell_xform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_gi_probe_set_to_cell_xform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_has_changed #-}

-- | Returns [code]true[/code] if changes have been made to the VisualServer's data. [method draw] is usually called if this happens.
bindVisualServer_has_changed :: MethodBind
bindVisualServer_has_changed
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "has_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if changes have been made to the VisualServer's data. [method draw] is usually called if this happens.
has_changed ::
              (VisualServer :< cls, Object :< cls) => cls -> IO Bool
has_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_has_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_has_feature #-}

bindVisualServer_has_feature :: MethodBind
bindVisualServer_has_feature
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "has_feature" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

has_feature ::
              (VisualServer :< cls, Object :< cls) => cls -> Int -> IO Bool
has_feature cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_has_feature (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_has_os_feature #-}

-- | Returns [code]true[/code] if the OS supports a certain feature. Features might be s3tc, etc, etc2 and pvrtc,
bindVisualServer_has_os_feature :: MethodBind
bindVisualServer_has_os_feature
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "has_os_feature" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns [code]true[/code] if the OS supports a certain feature. Features might be s3tc, etc, etc2 and pvrtc,
has_os_feature ::
                 (VisualServer :< cls, Object :< cls) =>
                 cls -> GodotString -> IO Bool
has_os_feature cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_has_os_feature (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_begin #-}

bindVisualServer_immediate_begin :: MethodBind
bindVisualServer_immediate_begin
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_begin ::
                  (VisualServer :< cls, Object :< cls) =>
                  cls -> Rid -> Int -> Rid -> IO ()
immediate_begin cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_begin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_clear #-}

bindVisualServer_immediate_clear :: MethodBind
bindVisualServer_immediate_clear
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_clear ::
                  (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO ()
immediate_clear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_clear
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_color #-}

bindVisualServer_immediate_color :: MethodBind
bindVisualServer_immediate_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_color ::
                  (VisualServer :< cls, Object :< cls) =>
                  cls -> Rid -> Color -> IO ()
immediate_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_create #-}

bindVisualServer_immediate_create :: MethodBind
bindVisualServer_immediate_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_create ::
                   (VisualServer :< cls, Object :< cls) => cls -> IO Rid
immediate_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_end #-}

bindVisualServer_immediate_end :: MethodBind
bindVisualServer_immediate_end
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_end ::
                (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO ()
immediate_end cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_end (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_get_material #-}

bindVisualServer_immediate_get_material :: MethodBind
bindVisualServer_immediate_get_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_get_material ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
immediate_get_material cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_get_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_normal #-}

bindVisualServer_immediate_normal :: MethodBind
bindVisualServer_immediate_normal
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_normal ::
                   (VisualServer :< cls, Object :< cls) =>
                   cls -> Rid -> Vector3 -> IO ()
immediate_normal cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_normal
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_set_material #-}

bindVisualServer_immediate_set_material :: MethodBind
bindVisualServer_immediate_set_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_set_material ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
immediate_set_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_set_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_tangent #-}

bindVisualServer_immediate_tangent :: MethodBind
bindVisualServer_immediate_tangent
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_tangent ::
                    (VisualServer :< cls, Object :< cls) =>
                    cls -> Rid -> Plane -> IO ()
immediate_tangent cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_tangent
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_uv #-}

bindVisualServer_immediate_uv :: MethodBind
bindVisualServer_immediate_uv
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_uv ::
               (VisualServer :< cls, Object :< cls) =>
               cls -> Rid -> Vector2 -> IO ()
immediate_uv cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_uv (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_uv2 #-}

bindVisualServer_immediate_uv2 :: MethodBind
bindVisualServer_immediate_uv2
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_uv2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_uv2 ::
                (VisualServer :< cls, Object :< cls) =>
                cls -> Rid -> Vector2 -> IO ()
immediate_uv2 cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_uv2 (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_vertex #-}

bindVisualServer_immediate_vertex :: MethodBind
bindVisualServer_immediate_vertex
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_vertex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_vertex ::
                   (VisualServer :< cls, Object :< cls) =>
                   cls -> Rid -> Vector3 -> IO ()
immediate_vertex cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_vertex
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_immediate_vertex_2d #-}

bindVisualServer_immediate_vertex_2d :: MethodBind
bindVisualServer_immediate_vertex_2d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_vertex_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

immediate_vertex_2d ::
                      (VisualServer :< cls, Object :< cls) =>
                      cls -> Rid -> Vector2 -> IO ()
immediate_vertex_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_vertex_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_init #-}

-- | Initializes the visual server.
bindVisualServer_init :: MethodBind
bindVisualServer_init
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "init" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initializes the visual server.
init :: (VisualServer :< cls, Object :< cls) => cls -> IO ()
init cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_init (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_attach_object_instance_id
             #-}

bindVisualServer_instance_attach_object_instance_id :: MethodBind
bindVisualServer_instance_attach_object_instance_id
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_attach_object_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_attach_object_instance_id ::
                                     (VisualServer :< cls, Object :< cls) =>
                                     cls -> Rid -> Int -> IO ()
instance_attach_object_instance_id cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_instance_attach_object_instance_id
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_attach_skeleton #-}

bindVisualServer_instance_attach_skeleton :: MethodBind
bindVisualServer_instance_attach_skeleton
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_attach_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_attach_skeleton ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
instance_attach_skeleton cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_attach_skeleton
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_create #-}

bindVisualServer_instance_create :: MethodBind
bindVisualServer_instance_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_create ::
                  (VisualServer :< cls, Object :< cls) => cls -> IO Rid
instance_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_create2 #-}

bindVisualServer_instance_create2 :: MethodBind
bindVisualServer_instance_create2
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_create2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_create2 ::
                   (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO Rid
instance_create2 cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_create2
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_geometry_set_as_instance_lod
             #-}

bindVisualServer_instance_geometry_set_as_instance_lod ::
                                                       MethodBind
bindVisualServer_instance_geometry_set_as_instance_lod
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_geometry_set_as_instance_lod" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_geometry_set_as_instance_lod ::
                                        (VisualServer :< cls, Object :< cls) =>
                                        cls -> Rid -> Rid -> IO ()
instance_geometry_set_as_instance_lod cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_instance_geometry_set_as_instance_lod
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_geometry_set_cast_shadows_setting
             #-}

bindVisualServer_instance_geometry_set_cast_shadows_setting ::
                                                            MethodBind
bindVisualServer_instance_geometry_set_cast_shadows_setting
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_geometry_set_cast_shadows_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_geometry_set_cast_shadows_setting ::
                                             (VisualServer :< cls, Object :< cls) =>
                                             cls -> Rid -> Int -> IO ()
instance_geometry_set_cast_shadows_setting cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_instance_geometry_set_cast_shadows_setting
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_geometry_set_draw_range #-}

bindVisualServer_instance_geometry_set_draw_range :: MethodBind
bindVisualServer_instance_geometry_set_draw_range
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_geometry_set_draw_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_geometry_set_draw_range ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> Float -> Float -> Float -> Float -> IO ()
instance_geometry_set_draw_range cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_instance_geometry_set_draw_range
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_geometry_set_flag #-}

bindVisualServer_instance_geometry_set_flag :: MethodBind
bindVisualServer_instance_geometry_set_flag
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_geometry_set_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_geometry_set_flag ::
                             (VisualServer :< cls, Object :< cls) =>
                             cls -> Rid -> Int -> Bool -> IO ()
instance_geometry_set_flag cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_geometry_set_flag
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_geometry_set_material_override
             #-}

bindVisualServer_instance_geometry_set_material_override ::
                                                         MethodBind
bindVisualServer_instance_geometry_set_material_override
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_geometry_set_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_geometry_set_material_override ::
                                          (VisualServer :< cls, Object :< cls) =>
                                          cls -> Rid -> Rid -> IO ()
instance_geometry_set_material_override cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_instance_geometry_set_material_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_set_base #-}

bindVisualServer_instance_set_base :: MethodBind
bindVisualServer_instance_set_base
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_base" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_set_base ::
                    (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
instance_set_base cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_set_base
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_set_blend_shape_weight #-}

bindVisualServer_instance_set_blend_shape_weight :: MethodBind
bindVisualServer_instance_set_blend_shape_weight
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_blend_shape_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_set_blend_shape_weight ::
                                  (VisualServer :< cls, Object :< cls) =>
                                  cls -> Rid -> Int -> Float -> IO ()
instance_set_blend_shape_weight cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_instance_set_blend_shape_weight
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_set_custom_aabb #-}

bindVisualServer_instance_set_custom_aabb :: MethodBind
bindVisualServer_instance_set_custom_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_set_custom_aabb ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> Aabb -> IO ()
instance_set_custom_aabb cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_set_custom_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_set_exterior #-}

bindVisualServer_instance_set_exterior :: MethodBind
bindVisualServer_instance_set_exterior
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_exterior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_set_exterior ::
                        (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
instance_set_exterior cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_set_exterior
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_set_extra_visibility_margin
             #-}

bindVisualServer_instance_set_extra_visibility_margin :: MethodBind
bindVisualServer_instance_set_extra_visibility_margin
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_extra_visibility_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_set_extra_visibility_margin ::
                                       (VisualServer :< cls, Object :< cls) =>
                                       cls -> Rid -> Float -> IO ()
instance_set_extra_visibility_margin cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_instance_set_extra_visibility_margin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_set_layer_mask #-}

bindVisualServer_instance_set_layer_mask :: MethodBind
bindVisualServer_instance_set_layer_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_layer_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_set_layer_mask ::
                          (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
instance_set_layer_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_set_layer_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_set_scenario #-}

bindVisualServer_instance_set_scenario :: MethodBind
bindVisualServer_instance_set_scenario
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_scenario" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_set_scenario ::
                        (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
instance_set_scenario cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_set_scenario
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_set_surface_material #-}

bindVisualServer_instance_set_surface_material :: MethodBind
bindVisualServer_instance_set_surface_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_surface_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_set_surface_material ::
                                (VisualServer :< cls, Object :< cls) =>
                                cls -> Rid -> Int -> Rid -> IO ()
instance_set_surface_material cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_instance_set_surface_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_set_transform #-}

bindVisualServer_instance_set_transform :: MethodBind
bindVisualServer_instance_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_set_transform ::
                         (VisualServer :< cls, Object :< cls) =>
                         cls -> Rid -> Transform -> IO ()
instance_set_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_set_use_lightmap #-}

bindVisualServer_instance_set_use_lightmap :: MethodBind
bindVisualServer_instance_set_use_lightmap
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_use_lightmap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_set_use_lightmap ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Rid -> Rid -> IO ()
instance_set_use_lightmap cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_set_use_lightmap
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instance_set_visible #-}

bindVisualServer_instance_set_visible :: MethodBind
bindVisualServer_instance_set_visible
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instance_set_visible ::
                       (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
instance_set_visible cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instance_set_visible
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instances_cull_aabb #-}

bindVisualServer_instances_cull_aabb :: MethodBind
bindVisualServer_instances_cull_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instances_cull_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instances_cull_aabb ::
                      (VisualServer :< cls, Object :< cls) =>
                      cls -> Aabb -> Rid -> IO Array
instances_cull_aabb cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instances_cull_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instances_cull_convex #-}

bindVisualServer_instances_cull_convex :: MethodBind
bindVisualServer_instances_cull_convex
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instances_cull_convex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

instances_cull_convex ::
                        (VisualServer :< cls, Object :< cls) =>
                        cls -> Array -> Rid -> IO Array
instances_cull_convex cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instances_cull_convex
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_instances_cull_ray #-}

-- | Returns an array of object IDs intersecting with the provided 3D ray. Only visual 3D nodes are considered, such as [MeshInstance] or [DirectionalLight]. Use [method @GDScript.instance_from_id] to obtain the actual nodes. A scenario RID must be provided, which is available in the [World] you want to query.
--   				Warning: this function is primarily intended for editor usage. For in-game use cases, prefer physics collision.
bindVisualServer_instances_cull_ray :: MethodBind
bindVisualServer_instances_cull_ray
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instances_cull_ray" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of object IDs intersecting with the provided 3D ray. Only visual 3D nodes are considered, such as [MeshInstance] or [DirectionalLight]. Use [method @GDScript.instance_from_id] to obtain the actual nodes. A scenario RID must be provided, which is available in the [World] you want to query.
--   				Warning: this function is primarily intended for editor usage. For in-game use cases, prefer physics collision.
instances_cull_ray ::
                     (VisualServer :< cls, Object :< cls) =>
                     cls -> Vector3 -> Vector3 -> Rid -> IO Array
instances_cull_ray cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instances_cull_ray
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_directional_set_blend_splits
             #-}

bindVisualServer_light_directional_set_blend_splits :: MethodBind
bindVisualServer_light_directional_set_blend_splits
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_directional_set_blend_splits" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_directional_set_blend_splits ::
                                     (VisualServer :< cls, Object :< cls) =>
                                     cls -> Rid -> Bool -> IO ()
light_directional_set_blend_splits cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_light_directional_set_blend_splits
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_directional_set_shadow_depth_range_mode
             #-}

bindVisualServer_light_directional_set_shadow_depth_range_mode ::
                                                               MethodBind
bindVisualServer_light_directional_set_shadow_depth_range_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_directional_set_shadow_depth_range_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_directional_set_shadow_depth_range_mode ::
                                                (VisualServer :< cls, Object :< cls) =>
                                                cls -> Rid -> Int -> IO ()
light_directional_set_shadow_depth_range_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_light_directional_set_shadow_depth_range_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_directional_set_shadow_mode #-}

bindVisualServer_light_directional_set_shadow_mode :: MethodBind
bindVisualServer_light_directional_set_shadow_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_directional_set_shadow_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_directional_set_shadow_mode ::
                                    (VisualServer :< cls, Object :< cls) =>
                                    cls -> Rid -> Int -> IO ()
light_directional_set_shadow_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_light_directional_set_shadow_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_omni_set_shadow_detail #-}

bindVisualServer_light_omni_set_shadow_detail :: MethodBind
bindVisualServer_light_omni_set_shadow_detail
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_omni_set_shadow_detail" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_omni_set_shadow_detail ::
                               (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
light_omni_set_shadow_detail cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_light_omni_set_shadow_detail
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_omni_set_shadow_mode #-}

bindVisualServer_light_omni_set_shadow_mode :: MethodBind
bindVisualServer_light_omni_set_shadow_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_omni_set_shadow_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_omni_set_shadow_mode ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
light_omni_set_shadow_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_light_omni_set_shadow_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_set_color #-}

bindVisualServer_light_set_color :: MethodBind
bindVisualServer_light_set_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_set_color ::
                  (VisualServer :< cls, Object :< cls) =>
                  cls -> Rid -> Color -> IO ()
light_set_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_light_set_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_set_cull_mask #-}

bindVisualServer_light_set_cull_mask :: MethodBind
bindVisualServer_light_set_cull_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_set_cull_mask ::
                      (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
light_set_cull_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_light_set_cull_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_set_negative #-}

bindVisualServer_light_set_negative :: MethodBind
bindVisualServer_light_set_negative
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_negative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_set_negative ::
                     (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
light_set_negative cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_light_set_negative
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_set_param #-}

bindVisualServer_light_set_param :: MethodBind
bindVisualServer_light_set_param
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_set_param ::
                  (VisualServer :< cls, Object :< cls) =>
                  cls -> Rid -> Int -> Float -> IO ()
light_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_light_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_set_projector #-}

bindVisualServer_light_set_projector :: MethodBind
bindVisualServer_light_set_projector
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_projector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_set_projector ::
                      (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
light_set_projector cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_light_set_projector
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_set_reverse_cull_face_mode #-}

bindVisualServer_light_set_reverse_cull_face_mode :: MethodBind
bindVisualServer_light_set_reverse_cull_face_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_reverse_cull_face_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_set_reverse_cull_face_mode ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> Bool -> IO ()
light_set_reverse_cull_face_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_light_set_reverse_cull_face_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_set_shadow #-}

bindVisualServer_light_set_shadow :: MethodBind
bindVisualServer_light_set_shadow
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_shadow" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_set_shadow ::
                   (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
light_set_shadow cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_light_set_shadow
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_set_shadow_color #-}

bindVisualServer_light_set_shadow_color :: MethodBind
bindVisualServer_light_set_shadow_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_set_shadow_color ::
                         (VisualServer :< cls, Object :< cls) =>
                         cls -> Rid -> Color -> IO ()
light_set_shadow_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_light_set_shadow_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_light_set_use_gi #-}

bindVisualServer_light_set_use_gi :: MethodBind
bindVisualServer_light_set_use_gi
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_use_gi" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

light_set_use_gi ::
                   (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
light_set_use_gi cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_light_set_use_gi
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_lightmap_capture_create #-}

bindVisualServer_lightmap_capture_create :: MethodBind
bindVisualServer_lightmap_capture_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

lightmap_capture_create ::
                          (VisualServer :< cls, Object :< cls) => cls -> IO Rid
lightmap_capture_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_lightmap_capture_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_lightmap_capture_get_bounds #-}

bindVisualServer_lightmap_capture_get_bounds :: MethodBind
bindVisualServer_lightmap_capture_get_bounds
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_get_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

lightmap_capture_get_bounds ::
                              (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Aabb
lightmap_capture_get_bounds cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_lightmap_capture_get_bounds
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_lightmap_capture_get_energy #-}

bindVisualServer_lightmap_capture_get_energy :: MethodBind
bindVisualServer_lightmap_capture_get_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_get_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

lightmap_capture_get_energy ::
                              (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Float
lightmap_capture_get_energy cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_lightmap_capture_get_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_lightmap_capture_get_octree #-}

bindVisualServer_lightmap_capture_get_octree :: MethodBind
bindVisualServer_lightmap_capture_get_octree
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_get_octree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

lightmap_capture_get_octree ::
                              (VisualServer :< cls, Object :< cls) =>
                              cls -> Rid -> IO PoolByteArray
lightmap_capture_get_octree cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_lightmap_capture_get_octree
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_lightmap_capture_get_octree_cell_subdiv
             #-}

bindVisualServer_lightmap_capture_get_octree_cell_subdiv ::
                                                         MethodBind
bindVisualServer_lightmap_capture_get_octree_cell_subdiv
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_get_octree_cell_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

lightmap_capture_get_octree_cell_subdiv ::
                                          (VisualServer :< cls, Object :< cls) =>
                                          cls -> Rid -> IO Int
lightmap_capture_get_octree_cell_subdiv cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_lightmap_capture_get_octree_cell_subdiv
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_lightmap_capture_get_octree_cell_transform
             #-}

bindVisualServer_lightmap_capture_get_octree_cell_transform ::
                                                            MethodBind
bindVisualServer_lightmap_capture_get_octree_cell_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_get_octree_cell_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

lightmap_capture_get_octree_cell_transform ::
                                             (VisualServer :< cls, Object :< cls) =>
                                             cls -> Rid -> IO Transform
lightmap_capture_get_octree_cell_transform cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_lightmap_capture_get_octree_cell_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_lightmap_capture_set_bounds #-}

bindVisualServer_lightmap_capture_set_bounds :: MethodBind
bindVisualServer_lightmap_capture_set_bounds
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_set_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

lightmap_capture_set_bounds ::
                              (VisualServer :< cls, Object :< cls) => cls -> Rid -> Aabb -> IO ()
lightmap_capture_set_bounds cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_lightmap_capture_set_bounds
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_lightmap_capture_set_energy #-}

bindVisualServer_lightmap_capture_set_energy :: MethodBind
bindVisualServer_lightmap_capture_set_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_set_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

lightmap_capture_set_energy ::
                              (VisualServer :< cls, Object :< cls) =>
                              cls -> Rid -> Float -> IO ()
lightmap_capture_set_energy cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_lightmap_capture_set_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_lightmap_capture_set_octree #-}

bindVisualServer_lightmap_capture_set_octree :: MethodBind
bindVisualServer_lightmap_capture_set_octree
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_set_octree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

lightmap_capture_set_octree ::
                              (VisualServer :< cls, Object :< cls) =>
                              cls -> Rid -> PoolByteArray -> IO ()
lightmap_capture_set_octree cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_lightmap_capture_set_octree
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_lightmap_capture_set_octree_cell_subdiv
             #-}

bindVisualServer_lightmap_capture_set_octree_cell_subdiv ::
                                                         MethodBind
bindVisualServer_lightmap_capture_set_octree_cell_subdiv
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_set_octree_cell_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

lightmap_capture_set_octree_cell_subdiv ::
                                          (VisualServer :< cls, Object :< cls) =>
                                          cls -> Rid -> Int -> IO ()
lightmap_capture_set_octree_cell_subdiv cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_lightmap_capture_set_octree_cell_subdiv
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_lightmap_capture_set_octree_cell_transform
             #-}

bindVisualServer_lightmap_capture_set_octree_cell_transform ::
                                                            MethodBind
bindVisualServer_lightmap_capture_set_octree_cell_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_set_octree_cell_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

lightmap_capture_set_octree_cell_transform ::
                                             (VisualServer :< cls, Object :< cls) =>
                                             cls -> Rid -> Transform -> IO ()
lightmap_capture_set_octree_cell_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_lightmap_capture_set_octree_cell_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_make_sphere_mesh #-}

-- | Returns a mesh of a sphere with the given amount of horizontal and vertical subdivisions.
bindVisualServer_make_sphere_mesh :: MethodBind
bindVisualServer_make_sphere_mesh
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "make_sphere_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh of a sphere with the given amount of horizontal and vertical subdivisions.
make_sphere_mesh ::
                   (VisualServer :< cls, Object :< cls) =>
                   cls -> Int -> Int -> Float -> IO Rid
make_sphere_mesh cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_make_sphere_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_material_create #-}

-- | Returns an empty material.
bindVisualServer_material_create :: MethodBind
bindVisualServer_material_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an empty material.
material_create ::
                  (VisualServer :< cls, Object :< cls) => cls -> IO Rid
material_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_material_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_material_get_param #-}

-- | Returns the value of a certain material's parameter.
bindVisualServer_material_get_param :: MethodBind
bindVisualServer_material_get_param
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_get_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the value of a certain material's parameter.
material_get_param ::
                     (VisualServer :< cls, Object :< cls) =>
                     cls -> Rid -> GodotString -> IO GodotVariant
material_get_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_material_get_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_material_get_param_default #-}

bindVisualServer_material_get_param_default :: MethodBind
bindVisualServer_material_get_param_default
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_get_param_default" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

material_get_param_default ::
                             (VisualServer :< cls, Object :< cls) =>
                             cls -> Rid -> GodotString -> IO GodotVariant
material_get_param_default cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_material_get_param_default
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_material_get_shader #-}

-- | Returns the shader of a certain material's shader. Returns an empty RID if the material doesn't have a shader.
bindVisualServer_material_get_shader :: MethodBind
bindVisualServer_material_get_shader
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_get_shader" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the shader of a certain material's shader. Returns an empty RID if the material doesn't have a shader.
material_get_shader ::
                      (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
material_get_shader cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_material_get_shader
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_material_set_line_width #-}

-- | Sets a materials line width.
bindVisualServer_material_set_line_width :: MethodBind
bindVisualServer_material_set_line_width
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_set_line_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a materials line width.
material_set_line_width ::
                          (VisualServer :< cls, Object :< cls) =>
                          cls -> Rid -> Float -> IO ()
material_set_line_width cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_material_set_line_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_material_set_next_pass #-}

-- | Sets an objects next material.
bindVisualServer_material_set_next_pass :: MethodBind
bindVisualServer_material_set_next_pass
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_set_next_pass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an objects next material.
material_set_next_pass ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
material_set_next_pass cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_material_set_next_pass
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_material_set_param #-}

-- | Sets a materials parameter.
bindVisualServer_material_set_param :: MethodBind
bindVisualServer_material_set_param
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a materials parameter.
material_set_param ::
                     (VisualServer :< cls, Object :< cls) =>
                     cls -> Rid -> GodotString -> GodotVariant -> IO ()
material_set_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_material_set_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_material_set_render_priority #-}

-- | Sets a material's render priority.
bindVisualServer_material_set_render_priority :: MethodBind
bindVisualServer_material_set_render_priority
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_set_render_priority" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a material's render priority.
material_set_render_priority ::
                               (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
material_set_render_priority cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_material_set_render_priority
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_material_set_shader #-}

-- | Sets a shader material's shader.
bindVisualServer_material_set_shader :: MethodBind
bindVisualServer_material_set_shader
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_set_shader" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a shader material's shader.
material_set_shader ::
                      (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
material_set_shader cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_material_set_shader
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_add_surface_from_arrays #-}

-- | Adds a surface generated from the Arrays to a mesh. See PRIMITIVE_TYPE_* constants for types.
bindVisualServer_mesh_add_surface_from_arrays :: MethodBind
bindVisualServer_mesh_add_surface_from_arrays
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_add_surface_from_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a surface generated from the Arrays to a mesh. See PRIMITIVE_TYPE_* constants for types.
mesh_add_surface_from_arrays ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> Array -> Array -> Int -> IO ()
mesh_add_surface_from_arrays cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_mesh_add_surface_from_arrays
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_clear #-}

-- | Removes all surfaces from a mesh.
bindVisualServer_mesh_clear :: MethodBind
bindVisualServer_mesh_clear
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes all surfaces from a mesh.
mesh_clear ::
             (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO ()
mesh_clear cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_clear (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_create #-}

-- | Creates a new mesh.
bindVisualServer_mesh_create :: MethodBind
bindVisualServer_mesh_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new mesh.
mesh_create ::
              (VisualServer :< cls, Object :< cls) => cls -> IO Rid
mesh_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_get_blend_shape_count #-}

-- | Returns a mesh's blend shape count.
bindVisualServer_mesh_get_blend_shape_count :: MethodBind
bindVisualServer_mesh_get_blend_shape_count
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_get_blend_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's blend shape count.
mesh_get_blend_shape_count ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
mesh_get_blend_shape_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_get_blend_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_get_blend_shape_mode #-}

-- | Returns a mesh's blend shape mode.
bindVisualServer_mesh_get_blend_shape_mode :: MethodBind
bindVisualServer_mesh_get_blend_shape_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_get_blend_shape_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's blend shape mode.
mesh_get_blend_shape_mode ::
                            (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
mesh_get_blend_shape_mode cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_get_blend_shape_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_get_custom_aabb #-}

-- | Returns a mesh's custom aabb.
bindVisualServer_mesh_get_custom_aabb :: MethodBind
bindVisualServer_mesh_get_custom_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_get_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's custom aabb.
mesh_get_custom_aabb ::
                       (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Aabb
mesh_get_custom_aabb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_get_custom_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_get_surface_count #-}

-- | Returns a mesh's number of surfaces.
bindVisualServer_mesh_get_surface_count :: MethodBind
bindVisualServer_mesh_get_surface_count
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_get_surface_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's number of surfaces.
mesh_get_surface_count ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
mesh_get_surface_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_get_surface_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_remove_surface #-}

-- | Removes a mesh's surface.
bindVisualServer_mesh_remove_surface :: MethodBind
bindVisualServer_mesh_remove_surface
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_remove_surface" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Removes a mesh's surface.
mesh_remove_surface ::
                      (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
mesh_remove_surface cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_remove_surface
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_set_blend_shape_count #-}

-- | Sets a mesh's blend shape count.
bindVisualServer_mesh_set_blend_shape_count :: MethodBind
bindVisualServer_mesh_set_blend_shape_count
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_set_blend_shape_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a mesh's blend shape count.
mesh_set_blend_shape_count ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
mesh_set_blend_shape_count cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_set_blend_shape_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_set_blend_shape_mode #-}

-- | Sets a mesh's blend shape mode.
bindVisualServer_mesh_set_blend_shape_mode :: MethodBind
bindVisualServer_mesh_set_blend_shape_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_set_blend_shape_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a mesh's blend shape mode.
mesh_set_blend_shape_mode ::
                            (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
mesh_set_blend_shape_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_set_blend_shape_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_set_custom_aabb #-}

-- | Sets a mesh's custom aabb.
bindVisualServer_mesh_set_custom_aabb :: MethodBind
bindVisualServer_mesh_set_custom_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_set_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a mesh's custom aabb.
mesh_set_custom_aabb ::
                       (VisualServer :< cls, Object :< cls) => cls -> Rid -> Aabb -> IO ()
mesh_set_custom_aabb cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_set_custom_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_aabb #-}

-- | Returns a mesh's surface's aabb.
bindVisualServer_mesh_surface_get_aabb :: MethodBind
bindVisualServer_mesh_surface_get_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's surface's aabb.
mesh_surface_get_aabb ::
                        (VisualServer :< cls, Object :< cls) =>
                        cls -> Rid -> Int -> IO Aabb
mesh_surface_get_aabb cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_surface_get_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_array #-}

-- | Returns a mesh's surface's vertex buffer.
bindVisualServer_mesh_surface_get_array :: MethodBind
bindVisualServer_mesh_surface_get_array
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's surface's vertex buffer.
mesh_surface_get_array ::
                         (VisualServer :< cls, Object :< cls) =>
                         cls -> Rid -> Int -> IO PoolByteArray
mesh_surface_get_array cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_surface_get_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_array_index_len #-}

-- | Returns a mesh's surface's amount of indices.
bindVisualServer_mesh_surface_get_array_index_len :: MethodBind
bindVisualServer_mesh_surface_get_array_index_len
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_array_index_len" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's surface's amount of indices.
mesh_surface_get_array_index_len ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> Int -> IO Int
mesh_surface_get_array_index_len cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_mesh_surface_get_array_index_len
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_array_len #-}

-- | Returns a mesh's surface's amount of vertices.
bindVisualServer_mesh_surface_get_array_len :: MethodBind
bindVisualServer_mesh_surface_get_array_len
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_array_len" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's surface's amount of vertices.
mesh_surface_get_array_len ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO Int
mesh_surface_get_array_len cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_surface_get_array_len
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_arrays #-}

-- | Returns a mesh's surface's buffer arrays.
bindVisualServer_mesh_surface_get_arrays :: MethodBind
bindVisualServer_mesh_surface_get_arrays
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's surface's buffer arrays.
mesh_surface_get_arrays ::
                          (VisualServer :< cls, Object :< cls) =>
                          cls -> Rid -> Int -> IO Array
mesh_surface_get_arrays cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_surface_get_arrays
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_blend_shape_arrays
             #-}

-- | Returns a mesh's surface's arrays for blend shapes
bindVisualServer_mesh_surface_get_blend_shape_arrays :: MethodBind
bindVisualServer_mesh_surface_get_blend_shape_arrays
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_blend_shape_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's surface's arrays for blend shapes
mesh_surface_get_blend_shape_arrays ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Int -> IO Array
mesh_surface_get_blend_shape_arrays cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_mesh_surface_get_blend_shape_arrays
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_format #-}

-- | Returns the format of a mesh's surface.
bindVisualServer_mesh_surface_get_format :: MethodBind
bindVisualServer_mesh_surface_get_format
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the format of a mesh's surface.
mesh_surface_get_format ::
                          (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO Int
mesh_surface_get_format cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_surface_get_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_format_offset #-}

bindVisualServer_mesh_surface_get_format_offset :: MethodBind
bindVisualServer_mesh_surface_get_format_offset
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_format_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

mesh_surface_get_format_offset ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls -> Int -> Int -> Int -> Int -> IO Int
mesh_surface_get_format_offset cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_mesh_surface_get_format_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_format_stride #-}

bindVisualServer_mesh_surface_get_format_stride :: MethodBind
bindVisualServer_mesh_surface_get_format_stride
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_format_stride" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

mesh_surface_get_format_stride ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls -> Int -> Int -> Int -> IO Int
mesh_surface_get_format_stride cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_mesh_surface_get_format_stride
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_index_array #-}

-- | Returns a mesh's surface's index buffer.
bindVisualServer_mesh_surface_get_index_array :: MethodBind
bindVisualServer_mesh_surface_get_index_array
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_index_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's surface's index buffer.
mesh_surface_get_index_array ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> IO PoolByteArray
mesh_surface_get_index_array cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_mesh_surface_get_index_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_material #-}

-- | Returns a mesh's surface's material.
bindVisualServer_mesh_surface_get_material :: MethodBind
bindVisualServer_mesh_surface_get_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's surface's material.
mesh_surface_get_material ::
                            (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO Rid
mesh_surface_get_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_surface_get_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_primitive_type #-}

-- | Returns the primitive type of a mesh's surface.
bindVisualServer_mesh_surface_get_primitive_type :: MethodBind
bindVisualServer_mesh_surface_get_primitive_type
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_primitive_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the primitive type of a mesh's surface.
mesh_surface_get_primitive_type ::
                                  (VisualServer :< cls, Object :< cls) =>
                                  cls -> Rid -> Int -> IO Int
mesh_surface_get_primitive_type cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_mesh_surface_get_primitive_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_get_skeleton_aabb #-}

-- | Returns the aabb of a mesh's surface's skeleton.
bindVisualServer_mesh_surface_get_skeleton_aabb :: MethodBind
bindVisualServer_mesh_surface_get_skeleton_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_skeleton_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the aabb of a mesh's surface's skeleton.
mesh_surface_get_skeleton_aabb ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Int -> IO Array
mesh_surface_get_skeleton_aabb cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_mesh_surface_get_skeleton_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_set_material #-}

-- | Sets a mesh's surface's material.
bindVisualServer_mesh_surface_set_material :: MethodBind
bindVisualServer_mesh_surface_set_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a mesh's surface's material.
mesh_surface_set_material ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Int -> Rid -> IO ()
mesh_surface_set_material cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_surface_set_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_mesh_surface_update_region #-}

bindVisualServer_mesh_surface_update_region :: MethodBind
bindVisualServer_mesh_surface_update_region
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_update_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

mesh_surface_update_region ::
                             (VisualServer :< cls, Object :< cls) =>
                             cls -> Rid -> Int -> Int -> PoolByteArray -> IO ()
mesh_surface_update_region cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_surface_update_region
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_allocate #-}

bindVisualServer_multimesh_allocate :: MethodBind
bindVisualServer_multimesh_allocate
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_allocate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_allocate ::
                     (VisualServer :< cls, Object :< cls) =>
                     cls -> Rid -> Int -> Int -> Int -> Int -> IO ()
multimesh_allocate cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_multimesh_allocate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_create #-}

bindVisualServer_multimesh_create :: MethodBind
bindVisualServer_multimesh_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_create ::
                   (VisualServer :< cls, Object :< cls) => cls -> IO Rid
multimesh_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_multimesh_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_get_aabb #-}

bindVisualServer_multimesh_get_aabb :: MethodBind
bindVisualServer_multimesh_get_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_get_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_get_aabb ::
                     (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Aabb
multimesh_get_aabb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_multimesh_get_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_get_instance_count #-}

bindVisualServer_multimesh_get_instance_count :: MethodBind
bindVisualServer_multimesh_get_instance_count
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_get_instance_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_get_instance_count ::
                               (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
multimesh_get_instance_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_multimesh_get_instance_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_get_mesh #-}

bindVisualServer_multimesh_get_mesh :: MethodBind
bindVisualServer_multimesh_get_mesh
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_get_mesh ::
                     (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
multimesh_get_mesh cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_multimesh_get_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_get_visible_instances #-}

bindVisualServer_multimesh_get_visible_instances :: MethodBind
bindVisualServer_multimesh_get_visible_instances
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_get_visible_instances" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_get_visible_instances ::
                                  (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
multimesh_get_visible_instances cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_multimesh_get_visible_instances
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_instance_get_color #-}

bindVisualServer_multimesh_instance_get_color :: MethodBind
bindVisualServer_multimesh_instance_get_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_instance_get_color ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> IO Color
multimesh_instance_get_color cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_multimesh_instance_get_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_instance_get_custom_data
             #-}

bindVisualServer_multimesh_instance_get_custom_data :: MethodBind
bindVisualServer_multimesh_instance_get_custom_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_get_custom_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_instance_get_custom_data ::
                                     (VisualServer :< cls, Object :< cls) =>
                                     cls -> Rid -> Int -> IO Color
multimesh_instance_get_custom_data cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_multimesh_instance_get_custom_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_instance_get_transform #-}

bindVisualServer_multimesh_instance_get_transform :: MethodBind
bindVisualServer_multimesh_instance_get_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_instance_get_transform ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> Int -> IO Transform
multimesh_instance_get_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_multimesh_instance_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_instance_get_transform_2d
             #-}

bindVisualServer_multimesh_instance_get_transform_2d :: MethodBind
bindVisualServer_multimesh_instance_get_transform_2d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_get_transform_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_instance_get_transform_2d ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Int -> IO Transform2d
multimesh_instance_get_transform_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_multimesh_instance_get_transform_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_instance_set_color #-}

bindVisualServer_multimesh_instance_set_color :: MethodBind
bindVisualServer_multimesh_instance_set_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_instance_set_color ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> Color -> IO ()
multimesh_instance_set_color cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_multimesh_instance_set_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_instance_set_custom_data
             #-}

bindVisualServer_multimesh_instance_set_custom_data :: MethodBind
bindVisualServer_multimesh_instance_set_custom_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_set_custom_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_instance_set_custom_data ::
                                     (VisualServer :< cls, Object :< cls) =>
                                     cls -> Rid -> Int -> Color -> IO ()
multimesh_instance_set_custom_data cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_multimesh_instance_set_custom_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_instance_set_transform #-}

bindVisualServer_multimesh_instance_set_transform :: MethodBind
bindVisualServer_multimesh_instance_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_instance_set_transform ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> Int -> Transform -> IO ()
multimesh_instance_set_transform cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_multimesh_instance_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_instance_set_transform_2d
             #-}

bindVisualServer_multimesh_instance_set_transform_2d :: MethodBind
bindVisualServer_multimesh_instance_set_transform_2d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_set_transform_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_instance_set_transform_2d ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Int -> Transform2d -> IO ()
multimesh_instance_set_transform_2d cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_multimesh_instance_set_transform_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_set_as_bulk_array #-}

bindVisualServer_multimesh_set_as_bulk_array :: MethodBind
bindVisualServer_multimesh_set_as_bulk_array
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_set_as_bulk_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_set_as_bulk_array ::
                              (VisualServer :< cls, Object :< cls) =>
                              cls -> Rid -> PoolRealArray -> IO ()
multimesh_set_as_bulk_array cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_multimesh_set_as_bulk_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_set_mesh #-}

bindVisualServer_multimesh_set_mesh :: MethodBind
bindVisualServer_multimesh_set_mesh
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_set_mesh ::
                     (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
multimesh_set_mesh cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_multimesh_set_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_multimesh_set_visible_instances #-}

bindVisualServer_multimesh_set_visible_instances :: MethodBind
bindVisualServer_multimesh_set_visible_instances
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_set_visible_instances" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

multimesh_set_visible_instances ::
                                  (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
multimesh_set_visible_instances cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_multimesh_set_visible_instances
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_omni_light_create #-}

bindVisualServer_omni_light_create :: MethodBind
bindVisualServer_omni_light_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "omni_light_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

omni_light_create ::
                    (VisualServer :< cls, Object :< cls) => cls -> IO Rid
omni_light_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_omni_light_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_create #-}

bindVisualServer_particles_create :: MethodBind
bindVisualServer_particles_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_create ::
                   (VisualServer :< cls, Object :< cls) => cls -> IO Rid
particles_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_get_current_aabb #-}

bindVisualServer_particles_get_current_aabb :: MethodBind
bindVisualServer_particles_get_current_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_get_current_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_get_current_aabb ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Aabb
particles_get_current_aabb cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_get_current_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_get_emitting #-}

bindVisualServer_particles_get_emitting :: MethodBind
bindVisualServer_particles_get_emitting
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_get_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_get_emitting ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
particles_get_emitting cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_get_emitting
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_is_inactive #-}

bindVisualServer_particles_is_inactive :: MethodBind
bindVisualServer_particles_is_inactive
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_is_inactive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_is_inactive ::
                        (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Bool
particles_is_inactive cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_is_inactive
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_request_process #-}

bindVisualServer_particles_request_process :: MethodBind
bindVisualServer_particles_request_process
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_request_process" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_request_process ::
                            (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO ()
particles_request_process cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_request_process
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_restart #-}

bindVisualServer_particles_restart :: MethodBind
bindVisualServer_particles_restart
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_restart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_restart ::
                    (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO ()
particles_restart cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_restart
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_amount #-}

bindVisualServer_particles_set_amount :: MethodBind
bindVisualServer_particles_set_amount
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_amount ::
                       (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
particles_set_amount cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_set_amount
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_custom_aabb #-}

bindVisualServer_particles_set_custom_aabb :: MethodBind
bindVisualServer_particles_set_custom_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_custom_aabb ::
                            (VisualServer :< cls, Object :< cls) => cls -> Rid -> Aabb -> IO ()
particles_set_custom_aabb cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_set_custom_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_draw_order #-}

bindVisualServer_particles_set_draw_order :: MethodBind
bindVisualServer_particles_set_draw_order
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_draw_order ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
particles_set_draw_order cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_set_draw_order
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_draw_pass_mesh #-}

bindVisualServer_particles_set_draw_pass_mesh :: MethodBind
bindVisualServer_particles_set_draw_pass_mesh
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_draw_pass_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_draw_pass_mesh ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> Rid -> IO ()
particles_set_draw_pass_mesh cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_particles_set_draw_pass_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_draw_passes #-}

bindVisualServer_particles_set_draw_passes :: MethodBind
bindVisualServer_particles_set_draw_passes
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_draw_passes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_draw_passes ::
                            (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
particles_set_draw_passes cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_set_draw_passes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_emission_transform #-}

bindVisualServer_particles_set_emission_transform :: MethodBind
bindVisualServer_particles_set_emission_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_emission_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_emission_transform ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> Transform -> IO ()
particles_set_emission_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_particles_set_emission_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_emitting #-}

bindVisualServer_particles_set_emitting :: MethodBind
bindVisualServer_particles_set_emitting
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_emitting ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
particles_set_emitting cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_set_emitting
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_explosiveness_ratio #-}

bindVisualServer_particles_set_explosiveness_ratio :: MethodBind
bindVisualServer_particles_set_explosiveness_ratio
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_explosiveness_ratio ::
                                    (VisualServer :< cls, Object :< cls) =>
                                    cls -> Rid -> Float -> IO ()
particles_set_explosiveness_ratio cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_particles_set_explosiveness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_fixed_fps #-}

bindVisualServer_particles_set_fixed_fps :: MethodBind
bindVisualServer_particles_set_fixed_fps
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_fixed_fps ::
                          (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
particles_set_fixed_fps cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_set_fixed_fps
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_fractional_delta #-}

bindVisualServer_particles_set_fractional_delta :: MethodBind
bindVisualServer_particles_set_fractional_delta
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_fractional_delta ::
                                 (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
particles_set_fractional_delta cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_particles_set_fractional_delta
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_lifetime #-}

bindVisualServer_particles_set_lifetime :: MethodBind
bindVisualServer_particles_set_lifetime
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_lifetime ::
                         (VisualServer :< cls, Object :< cls) =>
                         cls -> Rid -> Float -> IO ()
particles_set_lifetime cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_set_lifetime
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_one_shot #-}

bindVisualServer_particles_set_one_shot :: MethodBind
bindVisualServer_particles_set_one_shot
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_one_shot ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
particles_set_one_shot cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_set_one_shot
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_pre_process_time #-}

bindVisualServer_particles_set_pre_process_time :: MethodBind
bindVisualServer_particles_set_pre_process_time
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_pre_process_time ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Float -> IO ()
particles_set_pre_process_time cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_particles_set_pre_process_time
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_process_material #-}

bindVisualServer_particles_set_process_material :: MethodBind
bindVisualServer_particles_set_process_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_process_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_process_material ::
                                 (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
particles_set_process_material cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_particles_set_process_material
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_randomness_ratio #-}

bindVisualServer_particles_set_randomness_ratio :: MethodBind
bindVisualServer_particles_set_randomness_ratio
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_randomness_ratio ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Float -> IO ()
particles_set_randomness_ratio cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_particles_set_randomness_ratio
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_speed_scale #-}

bindVisualServer_particles_set_speed_scale :: MethodBind
bindVisualServer_particles_set_speed_scale
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_speed_scale ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Float -> IO ()
particles_set_speed_scale cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_particles_set_speed_scale
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_particles_set_use_local_coordinates
             #-}

bindVisualServer_particles_set_use_local_coordinates :: MethodBind
bindVisualServer_particles_set_use_local_coordinates
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

particles_set_use_local_coordinates ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Bool -> IO ()
particles_set_use_local_coordinates cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_particles_set_use_local_coordinates
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_create #-}

bindVisualServer_reflection_probe_create :: MethodBind
bindVisualServer_reflection_probe_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_create ::
                          (VisualServer :< cls, Object :< cls) => cls -> IO Rid
reflection_probe_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_reflection_probe_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_as_interior #-}

bindVisualServer_reflection_probe_set_as_interior :: MethodBind
bindVisualServer_reflection_probe_set_as_interior
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_as_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_as_interior ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> Bool -> IO ()
reflection_probe_set_as_interior cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_as_interior
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_cull_mask #-}

bindVisualServer_reflection_probe_set_cull_mask :: MethodBind
bindVisualServer_reflection_probe_set_cull_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_cull_mask ::
                                 (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
reflection_probe_set_cull_mask cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_cull_mask
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_enable_box_projection
             #-}

bindVisualServer_reflection_probe_set_enable_box_projection ::
                                                            MethodBind
bindVisualServer_reflection_probe_set_enable_box_projection
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_enable_box_projection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_enable_box_projection ::
                                             (VisualServer :< cls, Object :< cls) =>
                                             cls -> Rid -> Bool -> IO ()
reflection_probe_set_enable_box_projection cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_enable_box_projection
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_enable_shadows
             #-}

bindVisualServer_reflection_probe_set_enable_shadows :: MethodBind
bindVisualServer_reflection_probe_set_enable_shadows
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_enable_shadows" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_enable_shadows ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Bool -> IO ()
reflection_probe_set_enable_shadows cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_enable_shadows
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_extents #-}

bindVisualServer_reflection_probe_set_extents :: MethodBind
bindVisualServer_reflection_probe_set_extents
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_extents ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Rid -> Vector3 -> IO ()
reflection_probe_set_extents cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_extents
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_intensity #-}

bindVisualServer_reflection_probe_set_intensity :: MethodBind
bindVisualServer_reflection_probe_set_intensity
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_intensity ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Float -> IO ()
reflection_probe_set_intensity cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_intensity
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_interior_ambient
             #-}

bindVisualServer_reflection_probe_set_interior_ambient ::
                                                       MethodBind
bindVisualServer_reflection_probe_set_interior_ambient
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_interior_ambient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_interior_ambient ::
                                        (VisualServer :< cls, Object :< cls) =>
                                        cls -> Rid -> Color -> IO ()
reflection_probe_set_interior_ambient cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_interior_ambient
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_interior_ambient_energy
             #-}

bindVisualServer_reflection_probe_set_interior_ambient_energy ::
                                                              MethodBind
bindVisualServer_reflection_probe_set_interior_ambient_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_interior_ambient_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_interior_ambient_energy ::
                                               (VisualServer :< cls, Object :< cls) =>
                                               cls -> Rid -> Float -> IO ()
reflection_probe_set_interior_ambient_energy cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_interior_ambient_energy
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_interior_ambient_probe_contribution
             #-}

bindVisualServer_reflection_probe_set_interior_ambient_probe_contribution ::
                                                                          MethodBind
bindVisualServer_reflection_probe_set_interior_ambient_probe_contribution
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString
            "reflection_probe_set_interior_ambient_probe_contribution"
            $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_interior_ambient_probe_contribution ::
                                                           (VisualServer :< cls, Object :< cls) =>
                                                           cls -> Rid -> Float -> IO ()
reflection_probe_set_interior_ambient_probe_contribution cls arg1
  arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_interior_ambient_probe_contribution
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_max_distance #-}

bindVisualServer_reflection_probe_set_max_distance :: MethodBind
bindVisualServer_reflection_probe_set_max_distance
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_max_distance ::
                                    (VisualServer :< cls, Object :< cls) =>
                                    cls -> Rid -> Float -> IO ()
reflection_probe_set_max_distance cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_max_distance
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_origin_offset
             #-}

bindVisualServer_reflection_probe_set_origin_offset :: MethodBind
bindVisualServer_reflection_probe_set_origin_offset
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_origin_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_origin_offset ::
                                     (VisualServer :< cls, Object :< cls) =>
                                     cls -> Rid -> Vector3 -> IO ()
reflection_probe_set_origin_offset cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_origin_offset
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_reflection_probe_set_update_mode #-}

bindVisualServer_reflection_probe_set_update_mode :: MethodBind
bindVisualServer_reflection_probe_set_update_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

reflection_probe_set_update_mode ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> Int -> IO ()
reflection_probe_set_update_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_reflection_probe_set_update_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_request_frame_drawn_callback #-}

-- | Schedules a callback to the corresponding named 'method' on 'where' after a frame has been drawn.
--   				The callback method must use only 1 argument which will be called with 'userdata'.
bindVisualServer_request_frame_drawn_callback :: MethodBind
bindVisualServer_request_frame_drawn_callback
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "request_frame_drawn_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Schedules a callback to the corresponding named 'method' on 'where' after a frame has been drawn.
--   				The callback method must use only 1 argument which will be called with 'userdata'.
request_frame_drawn_callback ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Object -> GodotString -> GodotVariant -> IO ()
request_frame_drawn_callback cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_request_frame_drawn_callback
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_scenario_create #-}

bindVisualServer_scenario_create :: MethodBind
bindVisualServer_scenario_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "scenario_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

scenario_create ::
                  (VisualServer :< cls, Object :< cls) => cls -> IO Rid
scenario_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_scenario_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_scenario_set_debug #-}

bindVisualServer_scenario_set_debug :: MethodBind
bindVisualServer_scenario_set_debug
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "scenario_set_debug" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

scenario_set_debug ::
                     (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
scenario_set_debug cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_scenario_set_debug
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_scenario_set_environment #-}

bindVisualServer_scenario_set_environment :: MethodBind
bindVisualServer_scenario_set_environment
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "scenario_set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

scenario_set_environment ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
scenario_set_environment cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_scenario_set_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_scenario_set_fallback_environment #-}

bindVisualServer_scenario_set_fallback_environment :: MethodBind
bindVisualServer_scenario_set_fallback_environment
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "scenario_set_fallback_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

scenario_set_fallback_environment ::
                                    (VisualServer :< cls, Object :< cls) =>
                                    cls -> Rid -> Rid -> IO ()
scenario_set_fallback_environment cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_scenario_set_fallback_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_scenario_set_reflection_atlas_size
             #-}

bindVisualServer_scenario_set_reflection_atlas_size :: MethodBind
bindVisualServer_scenario_set_reflection_atlas_size
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "scenario_set_reflection_atlas_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

scenario_set_reflection_atlas_size ::
                                     (VisualServer :< cls, Object :< cls) =>
                                     cls -> Rid -> Int -> Int -> IO ()
scenario_set_reflection_atlas_size cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_scenario_set_reflection_atlas_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_set_boot_image #-}

-- | Sets a boot image. The color defines the background color and if scale is [code]true[/code] the image will be scaled to fit the screen size.
bindVisualServer_set_boot_image :: MethodBind
bindVisualServer_set_boot_image
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "set_boot_image" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a boot image. The color defines the background color and if scale is [code]true[/code] the image will be scaled to fit the screen size.
set_boot_image ::
                 (VisualServer :< cls, Object :< cls) =>
                 cls -> Image -> Color -> Bool -> Bool -> IO ()
set_boot_image cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_set_boot_image (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_set_debug_generate_wireframes #-}

bindVisualServer_set_debug_generate_wireframes :: MethodBind
bindVisualServer_set_debug_generate_wireframes
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "set_debug_generate_wireframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_debug_generate_wireframes ::
                                (VisualServer :< cls, Object :< cls) => cls -> Bool -> IO ()
set_debug_generate_wireframes cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_set_debug_generate_wireframes
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_set_default_clear_color #-}

bindVisualServer_set_default_clear_color :: MethodBind
bindVisualServer_set_default_clear_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "set_default_clear_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

set_default_clear_color ::
                          (VisualServer :< cls, Object :< cls) => cls -> Color -> IO ()
set_default_clear_color cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_set_default_clear_color
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_shader_create #-}

-- | Creates an empty shader.
bindVisualServer_shader_create :: MethodBind
bindVisualServer_shader_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "shader_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an empty shader.
shader_create ::
                (VisualServer :< cls, Object :< cls) => cls -> IO Rid
shader_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_shader_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_shader_get_code #-}

-- | Returns a shader's code.
bindVisualServer_shader_get_code :: MethodBind
bindVisualServer_shader_get_code
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "shader_get_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a shader's code.
shader_get_code ::
                  (VisualServer :< cls, Object :< cls) =>
                  cls -> Rid -> IO GodotString
shader_get_code cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_shader_get_code
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_shader_get_default_texture_param #-}

-- | Returns a default texture from a shader searched by name.
bindVisualServer_shader_get_default_texture_param :: MethodBind
bindVisualServer_shader_get_default_texture_param
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "shader_get_default_texture_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a default texture from a shader searched by name.
shader_get_default_texture_param ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> GodotString -> IO Rid
shader_get_default_texture_param cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_shader_get_default_texture_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_shader_get_param_list #-}

-- | Returns the parameters of a shader.
bindVisualServer_shader_get_param_list :: MethodBind
bindVisualServer_shader_get_param_list
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "shader_get_param_list" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the parameters of a shader.
shader_get_param_list ::
                        (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Array
shader_get_param_list cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_shader_get_param_list
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_shader_set_code #-}

-- | Sets a shader's code.
bindVisualServer_shader_set_code :: MethodBind
bindVisualServer_shader_set_code
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "shader_set_code" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a shader's code.
shader_set_code ::
                  (VisualServer :< cls, Object :< cls) =>
                  cls -> Rid -> GodotString -> IO ()
shader_set_code cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_shader_set_code
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_shader_set_default_texture_param #-}

-- | Sets a shader's default texture. Overwrites the texture given by name.
bindVisualServer_shader_set_default_texture_param :: MethodBind
bindVisualServer_shader_set_default_texture_param
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "shader_set_default_texture_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a shader's default texture. Overwrites the texture given by name.
shader_set_default_texture_param ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> GodotString -> Rid -> IO ()
shader_set_default_texture_param cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_shader_set_default_texture_param
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_skeleton_allocate #-}

bindVisualServer_skeleton_allocate :: MethodBind
bindVisualServer_skeleton_allocate
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_allocate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

skeleton_allocate ::
                    (VisualServer :< cls, Object :< cls) =>
                    cls -> Rid -> Int -> Bool -> IO ()
skeleton_allocate cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_skeleton_allocate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_skeleton_bone_get_transform #-}

bindVisualServer_skeleton_bone_get_transform :: MethodBind
bindVisualServer_skeleton_bone_get_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_bone_get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

skeleton_bone_get_transform ::
                              (VisualServer :< cls, Object :< cls) =>
                              cls -> Rid -> Int -> IO Transform
skeleton_bone_get_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_skeleton_bone_get_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_skeleton_bone_get_transform_2d #-}

bindVisualServer_skeleton_bone_get_transform_2d :: MethodBind
bindVisualServer_skeleton_bone_get_transform_2d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_bone_get_transform_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

skeleton_bone_get_transform_2d ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Int -> IO Transform2d
skeleton_bone_get_transform_2d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_skeleton_bone_get_transform_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_skeleton_bone_set_transform #-}

bindVisualServer_skeleton_bone_set_transform :: MethodBind
bindVisualServer_skeleton_bone_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_bone_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

skeleton_bone_set_transform ::
                              (VisualServer :< cls, Object :< cls) =>
                              cls -> Rid -> Int -> Transform -> IO ()
skeleton_bone_set_transform cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_skeleton_bone_set_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_skeleton_bone_set_transform_2d #-}

bindVisualServer_skeleton_bone_set_transform_2d :: MethodBind
bindVisualServer_skeleton_bone_set_transform_2d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_bone_set_transform_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

skeleton_bone_set_transform_2d ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls -> Rid -> Int -> Transform2d -> IO ()
skeleton_bone_set_transform_2d cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_skeleton_bone_set_transform_2d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_skeleton_create #-}

bindVisualServer_skeleton_create :: MethodBind
bindVisualServer_skeleton_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

skeleton_create ::
                  (VisualServer :< cls, Object :< cls) => cls -> IO Rid
skeleton_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_skeleton_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_skeleton_get_bone_count #-}

bindVisualServer_skeleton_get_bone_count :: MethodBind
bindVisualServer_skeleton_get_bone_count
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_get_bone_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

skeleton_get_bone_count ::
                          (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
skeleton_get_bone_count cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_skeleton_get_bone_count
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_sky_create #-}

-- | Creates an empty sky.
bindVisualServer_sky_create :: MethodBind
bindVisualServer_sky_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "sky_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an empty sky.
sky_create :: (VisualServer :< cls, Object :< cls) => cls -> IO Rid
sky_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_sky_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_sky_set_texture #-}

-- | Sets a sky's texture.
bindVisualServer_sky_set_texture :: MethodBind
bindVisualServer_sky_set_texture
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "sky_set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a sky's texture.
sky_set_texture ::
                  (VisualServer :< cls, Object :< cls) =>
                  cls -> Rid -> Rid -> Int -> IO ()
sky_set_texture cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_sky_set_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_spot_light_create #-}

bindVisualServer_spot_light_create :: MethodBind
bindVisualServer_spot_light_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "spot_light_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

spot_light_create ::
                    (VisualServer :< cls, Object :< cls) => cls -> IO Rid
spot_light_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_spot_light_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_sync #-}

bindVisualServer_sync :: MethodBind
bindVisualServer_sync
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "sync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

sync :: (VisualServer :< cls, Object :< cls) => cls -> IO ()
sync cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_sync (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_allocate #-}

bindVisualServer_texture_allocate :: MethodBind
bindVisualServer_texture_allocate
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_allocate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

texture_allocate ::
                   (VisualServer :< cls, Object :< cls) =>
                   cls -> Rid -> Int -> Int -> Int -> Int -> Int -> Int -> IO ()
texture_allocate cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_allocate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_bind #-}

bindVisualServer_texture_bind :: MethodBind
bindVisualServer_texture_bind
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_bind" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

texture_bind ::
               (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
texture_bind cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_bind (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_create #-}

-- | Creates an empty texture.
bindVisualServer_texture_create :: MethodBind
bindVisualServer_texture_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an empty texture.
texture_create ::
                 (VisualServer :< cls, Object :< cls) => cls -> IO Rid
texture_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_create_from_image #-}

-- | Creates a texture, allocates the space for an image, and fills in the image.
bindVisualServer_texture_create_from_image :: MethodBind
bindVisualServer_texture_create_from_image
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_create_from_image" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a texture, allocates the space for an image, and fills in the image.
texture_create_from_image ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Image -> Int -> IO Rid
texture_create_from_image cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_create_from_image
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_debug_usage #-}

-- | Returns a list of all the textures and their information.
bindVisualServer_texture_debug_usage :: MethodBind
bindVisualServer_texture_debug_usage
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_debug_usage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a list of all the textures and their information.
texture_debug_usage ::
                      (VisualServer :< cls, Object :< cls) => cls -> IO Array
texture_debug_usage cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_debug_usage
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_get_data #-}

-- | Returns a copy of a texture's image unless it's a CubeMap, in which case it returns the [RID] of the image at one of the cubes sides.
bindVisualServer_texture_get_data :: MethodBind
bindVisualServer_texture_get_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a copy of a texture's image unless it's a CubeMap, in which case it returns the [RID] of the image at one of the cubes sides.
texture_get_data ::
                   (VisualServer :< cls, Object :< cls) =>
                   cls -> Rid -> Int -> IO Image
texture_get_data cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_get_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_get_depth #-}

bindVisualServer_texture_get_depth :: MethodBind
bindVisualServer_texture_get_depth
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

texture_get_depth ::
                    (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
texture_get_depth cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_get_depth
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_get_flags #-}

-- | Returns the flags of a texture.
bindVisualServer_texture_get_flags :: MethodBind
bindVisualServer_texture_get_flags
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the flags of a texture.
texture_get_flags ::
                    (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
texture_get_flags cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_get_flags
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_get_format #-}

-- | Returns the format of the texture's image.
bindVisualServer_texture_get_format :: MethodBind
bindVisualServer_texture_get_format
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_format" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the format of the texture's image.
texture_get_format ::
                     (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
texture_get_format cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_get_format
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_get_height #-}

-- | Returns the texture's height.
bindVisualServer_texture_get_height :: MethodBind
bindVisualServer_texture_get_height
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the texture's height.
texture_get_height ::
                     (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
texture_get_height cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_get_height
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_get_path #-}

-- | Returns the texture's path.
bindVisualServer_texture_get_path :: MethodBind
bindVisualServer_texture_get_path
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the texture's path.
texture_get_path ::
                   (VisualServer :< cls, Object :< cls) =>
                   cls -> Rid -> IO GodotString
texture_get_path cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_get_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_get_texid #-}

-- | Returns the opengl id of the texture's image.
bindVisualServer_texture_get_texid :: MethodBind
bindVisualServer_texture_get_texid
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_texid" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the opengl id of the texture's image.
texture_get_texid ::
                    (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
texture_get_texid cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_get_texid
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_get_type #-}

bindVisualServer_texture_get_type :: MethodBind
bindVisualServer_texture_get_type
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

texture_get_type ::
                   (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
texture_get_type cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_get_type
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_get_width #-}

-- | Returns the texture's width.
bindVisualServer_texture_get_width :: MethodBind
bindVisualServer_texture_get_width
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the texture's width.
texture_get_width ::
                    (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Int
texture_get_width cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_get_width
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_set_data #-}

-- | Sets the texture's image data. If it's a CubeMap, it sets the image data at a cube side.
bindVisualServer_texture_set_data :: MethodBind
bindVisualServer_texture_set_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the texture's image data. If it's a CubeMap, it sets the image data at a cube side.
texture_set_data ::
                   (VisualServer :< cls, Object :< cls) =>
                   cls -> Rid -> Image -> Int -> IO ()
texture_set_data cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_set_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_set_data_partial #-}

bindVisualServer_texture_set_data_partial :: MethodBind
bindVisualServer_texture_set_data_partial
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_set_data_partial" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

texture_set_data_partial ::
                           (VisualServer :< cls, Object :< cls) =>
                           cls ->
                             Rid ->
                               Image ->
                                 Int -> Int -> Int -> Int -> Int -> Int -> Int -> Int -> IO ()
texture_set_data_partial cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  arg8 arg9 arg10
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9, toVariant arg10]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_set_data_partial
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_set_flags #-}

-- | Sets the texture's flags. See [enum TextureFlags] for options
bindVisualServer_texture_set_flags :: MethodBind
bindVisualServer_texture_set_flags
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_set_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the texture's flags. See [enum TextureFlags] for options
texture_set_flags ::
                    (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
texture_set_flags cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_set_flags
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_set_path #-}

-- | Sets the texture's path.
bindVisualServer_texture_set_path :: MethodBind
bindVisualServer_texture_set_path
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_set_path" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the texture's path.
texture_set_path ::
                   (VisualServer :< cls, Object :< cls) =>
                   cls -> Rid -> GodotString -> IO ()
texture_set_path cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_set_path
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_set_shrink_all_x2_on_set_data
             #-}

-- | If [code]true[/code], sets internal processes to shrink all image data to half the size.
bindVisualServer_texture_set_shrink_all_x2_on_set_data ::
                                                       MethodBind
bindVisualServer_texture_set_shrink_all_x2_on_set_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_set_shrink_all_x2_on_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], sets internal processes to shrink all image data to half the size.
texture_set_shrink_all_x2_on_set_data ::
                                        (VisualServer :< cls, Object :< cls) => cls -> Bool -> IO ()
texture_set_shrink_all_x2_on_set_data cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_texture_set_shrink_all_x2_on_set_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_texture_set_size_override #-}

bindVisualServer_texture_set_size_override :: MethodBind
bindVisualServer_texture_set_size_override
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_set_size_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

texture_set_size_override ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Int -> Int -> Int -> IO ()
texture_set_size_override cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_set_size_override
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_textures_keep_original #-}

-- | If [code]true[/code], the image will be stored in the texture's images array if overwritten.
bindVisualServer_textures_keep_original :: MethodBind
bindVisualServer_textures_keep_original
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "textures_keep_original" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the image will be stored in the texture's images array if overwritten.
textures_keep_original ::
                         (VisualServer :< cls, Object :< cls) => cls -> Bool -> IO ()
textures_keep_original cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_textures_keep_original
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_attach_camera #-}

-- | Sets a viewport's camera.
bindVisualServer_viewport_attach_camera :: MethodBind
bindVisualServer_viewport_attach_camera
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_attach_camera" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a viewport's camera.
viewport_attach_camera ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
viewport_attach_camera cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_attach_camera
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_attach_canvas #-}

-- | Sets a viewport's canvas.
bindVisualServer_viewport_attach_canvas :: MethodBind
bindVisualServer_viewport_attach_canvas
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_attach_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a viewport's canvas.
viewport_attach_canvas ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
viewport_attach_canvas cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_attach_canvas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_attach_to_screen #-}

-- | Attaches a viewport to a screen.
bindVisualServer_viewport_attach_to_screen :: MethodBind
bindVisualServer_viewport_attach_to_screen
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_attach_to_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Attaches a viewport to a screen.
viewport_attach_to_screen ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Rect2 -> Int -> IO ()
viewport_attach_to_screen cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_attach_to_screen
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_create #-}

-- | Creates an empty viewport.
bindVisualServer_viewport_create :: MethodBind
bindVisualServer_viewport_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an empty viewport.
viewport_create ::
                  (VisualServer :< cls, Object :< cls) => cls -> IO Rid
viewport_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_create
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_detach #-}

-- | Detaches the viewport from the screen.
bindVisualServer_viewport_detach :: MethodBind
bindVisualServer_viewport_detach
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_detach" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Detaches the viewport from the screen.
viewport_detach ::
                  (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO ()
viewport_detach cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_detach
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_get_render_info #-}

-- | Returns a viewport's render info. for options see VIEWPORT_RENDER_INFO* constants.
bindVisualServer_viewport_get_render_info :: MethodBind
bindVisualServer_viewport_get_render_info
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_get_render_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a viewport's render info. for options see VIEWPORT_RENDER_INFO* constants.
viewport_get_render_info ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO Int
viewport_get_render_info cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_get_render_info
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_get_texture #-}

-- | Returns the viewport's last rendered frame.
bindVisualServer_viewport_get_texture :: MethodBind
bindVisualServer_viewport_get_texture
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_get_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the viewport's last rendered frame.
viewport_get_texture ::
                       (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO Rid
viewport_get_texture cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_get_texture
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_remove_canvas #-}

-- | Detaches a viewport from a canvas and vice versa.
bindVisualServer_viewport_remove_canvas :: MethodBind
bindVisualServer_viewport_remove_canvas
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_remove_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Detaches a viewport from a canvas and vice versa.
viewport_remove_canvas ::
                         (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
viewport_remove_canvas cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_remove_canvas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_active #-}

-- | If [code]true[/code], sets the viewport active, else sets it inactive.
bindVisualServer_viewport_set_active :: MethodBind
bindVisualServer_viewport_set_active
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], sets the viewport active, else sets it inactive.
viewport_set_active ::
                      (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
viewport_set_active cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_active
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_canvas_stacking #-}

-- | Sets the stacking order for a viewport's canvas.
--   				[code]layer[/code] is the actual canvas layer, while [code]sublayer[/code] specifies the stacking order of the canvas among those in the same layer.
bindVisualServer_viewport_set_canvas_stacking :: MethodBind
bindVisualServer_viewport_set_canvas_stacking
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_canvas_stacking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the stacking order for a viewport's canvas.
--   				[code]layer[/code] is the actual canvas layer, while [code]sublayer[/code] specifies the stacking order of the canvas among those in the same layer.
viewport_set_canvas_stacking ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Rid -> Rid -> Int -> Int -> IO ()
viewport_set_canvas_stacking cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_viewport_set_canvas_stacking
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_canvas_transform #-}

-- | Sets the transformation of a viewport's canvas.
bindVisualServer_viewport_set_canvas_transform :: MethodBind
bindVisualServer_viewport_set_canvas_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_canvas_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the transformation of a viewport's canvas.
viewport_set_canvas_transform ::
                                (VisualServer :< cls, Object :< cls) =>
                                cls -> Rid -> Rid -> Transform2d -> IO ()
viewport_set_canvas_transform cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_viewport_set_canvas_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_clear_mode #-}

-- | Sets the clear mode of a viewport. See [enum VisualServer.ViewportClearMode] for options.
bindVisualServer_viewport_set_clear_mode :: MethodBind
bindVisualServer_viewport_set_clear_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_clear_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the clear mode of a viewport. See [enum VisualServer.ViewportClearMode] for options.
viewport_set_clear_mode ::
                          (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
viewport_set_clear_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_clear_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_debug_draw #-}

-- | Sets the debug draw mode of a viewport. See [enum VisualServer.ViewportDebugDraw] for options.
bindVisualServer_viewport_set_debug_draw :: MethodBind
bindVisualServer_viewport_set_debug_draw
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_debug_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the debug draw mode of a viewport. See [enum VisualServer.ViewportDebugDraw] for options.
viewport_set_debug_draw ::
                          (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
viewport_set_debug_draw cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_debug_draw
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_disable_3d #-}

-- | If [code]true[/code], a viewport's 3D rendering is disabled.
bindVisualServer_viewport_set_disable_3d :: MethodBind
bindVisualServer_viewport_set_disable_3d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_disable_3d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], a viewport's 3D rendering is disabled.
viewport_set_disable_3d ::
                          (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
viewport_set_disable_3d cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_disable_3d
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_disable_environment #-}

-- | If [code]true[/code], rendering of a viewport's environment is disabled.
bindVisualServer_viewport_set_disable_environment :: MethodBind
bindVisualServer_viewport_set_disable_environment
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_disable_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], rendering of a viewport's environment is disabled.
viewport_set_disable_environment ::
                                   (VisualServer :< cls, Object :< cls) =>
                                   cls -> Rid -> Bool -> IO ()
viewport_set_disable_environment cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_viewport_set_disable_environment
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_global_canvas_transform
             #-}

-- | Sets the viewport's global transformation matrix.
bindVisualServer_viewport_set_global_canvas_transform :: MethodBind
bindVisualServer_viewport_set_global_canvas_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_global_canvas_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the viewport's global transformation matrix.
viewport_set_global_canvas_transform ::
                                       (VisualServer :< cls, Object :< cls) =>
                                       cls -> Rid -> Transform2d -> IO ()
viewport_set_global_canvas_transform cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_viewport_set_global_canvas_transform
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_hdr #-}

-- | If [code]true[/code], the viewport renders to hdr.
bindVisualServer_viewport_set_hdr :: MethodBind
bindVisualServer_viewport_set_hdr
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport renders to hdr.
viewport_set_hdr ::
                   (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
viewport_set_hdr cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_hdr
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_hide_canvas #-}

-- | If [code]true[/code], the viewport's canvas is not rendered.
bindVisualServer_viewport_set_hide_canvas :: MethodBind
bindVisualServer_viewport_set_hide_canvas
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_hide_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport's canvas is not rendered.
viewport_set_hide_canvas ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
viewport_set_hide_canvas cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_hide_canvas
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_hide_scenario #-}

bindVisualServer_viewport_set_hide_scenario :: MethodBind
bindVisualServer_viewport_set_hide_scenario
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_hide_scenario" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

viewport_set_hide_scenario ::
                             (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
viewport_set_hide_scenario cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_hide_scenario
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_msaa #-}

-- | Sets the anti-aliasing mode. see [enum ViewportMSAA] for options.
bindVisualServer_viewport_set_msaa :: MethodBind
bindVisualServer_viewport_set_msaa
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_msaa" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the anti-aliasing mode. see [enum ViewportMSAA] for options.
viewport_set_msaa ::
                    (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
viewport_set_msaa cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_msaa
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_parent_viewport #-}

-- | Sets the viewport's parent to another viewport.
bindVisualServer_viewport_set_parent_viewport :: MethodBind
bindVisualServer_viewport_set_parent_viewport
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_parent_viewport" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the viewport's parent to another viewport.
viewport_set_parent_viewport ::
                               (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
viewport_set_parent_viewport cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_viewport_set_parent_viewport
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_render_direct_to_screen
             #-}

bindVisualServer_viewport_set_render_direct_to_screen :: MethodBind
bindVisualServer_viewport_set_render_direct_to_screen
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_render_direct_to_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

viewport_set_render_direct_to_screen ::
                                       (VisualServer :< cls, Object :< cls) =>
                                       cls -> Rid -> Bool -> IO ()
viewport_set_render_direct_to_screen cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_viewport_set_render_direct_to_screen
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_scenario #-}

-- | Sets a viewport's scenario.
--   				The scenario contains information about the [enum ScenarioDebugMode], environment information, reflection atlas etc.
bindVisualServer_viewport_set_scenario :: MethodBind
bindVisualServer_viewport_set_scenario
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_scenario" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a viewport's scenario.
--   				The scenario contains information about the [enum ScenarioDebugMode], environment information, reflection atlas etc.
viewport_set_scenario ::
                        (VisualServer :< cls, Object :< cls) => cls -> Rid -> Rid -> IO ()
viewport_set_scenario cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_scenario
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_shadow_atlas_quadrant_subdivision
             #-}

-- | Sets the shadow atlas quadrant's subdivision.
bindVisualServer_viewport_set_shadow_atlas_quadrant_subdivision ::
                                                                MethodBind
bindVisualServer_viewport_set_shadow_atlas_quadrant_subdivision
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_shadow_atlas_quadrant_subdivision" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the shadow atlas quadrant's subdivision.
viewport_set_shadow_atlas_quadrant_subdivision ::
                                                 (VisualServer :< cls, Object :< cls) =>
                                                 cls -> Rid -> Int -> Int -> IO ()
viewport_set_shadow_atlas_quadrant_subdivision cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_viewport_set_shadow_atlas_quadrant_subdivision
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_shadow_atlas_size #-}

-- | Sets the size of the shadow atlas's images.
bindVisualServer_viewport_set_shadow_atlas_size :: MethodBind
bindVisualServer_viewport_set_shadow_atlas_size
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_shadow_atlas_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the shadow atlas's images.
viewport_set_shadow_atlas_size ::
                                 (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
viewport_set_shadow_atlas_size cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_viewport_set_shadow_atlas_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_size #-}

-- | Sets the viewport's width and height.
bindVisualServer_viewport_set_size :: MethodBind
bindVisualServer_viewport_set_size
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the viewport's width and height.
viewport_set_size ::
                    (VisualServer :< cls, Object :< cls) =>
                    cls -> Rid -> Int -> Int -> IO ()
viewport_set_size cls arg1 arg2 arg3
  = withVariantArray [toVariant arg1, toVariant arg2, toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_size
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_transparent_background
             #-}

-- | If [code]true[/code], the viewport renders its background as transparent.
bindVisualServer_viewport_set_transparent_background :: MethodBind
bindVisualServer_viewport_set_transparent_background
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_transparent_background" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport renders its background as transparent.
viewport_set_transparent_background ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls -> Rid -> Bool -> IO ()
viewport_set_transparent_background cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_viewport_set_transparent_background
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_update_mode #-}

-- | Sets when the viewport should be updated. See [enum ViewportUpdateMode] constants for options.
bindVisualServer_viewport_set_update_mode :: MethodBind
bindVisualServer_viewport_set_update_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets when the viewport should be updated. See [enum ViewportUpdateMode] constants for options.
viewport_set_update_mode ::
                           (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
viewport_set_update_mode cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_update_mode
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_usage #-}

-- | Sets the viewport's 2D/3D mode. See [enum ViewportUsage] constants for options.
bindVisualServer_viewport_set_usage :: MethodBind
bindVisualServer_viewport_set_usage
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_usage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the viewport's 2D/3D mode. See [enum ViewportUsage] constants for options.
viewport_set_usage ::
                     (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
viewport_set_usage cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_usage
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_use_arvr #-}

-- | If [code]true[/code], the viewport uses augmented or virtual reality technologies. See [ARVRInterface].
bindVisualServer_viewport_set_use_arvr :: MethodBind
bindVisualServer_viewport_set_use_arvr
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_use_arvr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport uses augmented or virtual reality technologies. See [ARVRInterface].
viewport_set_use_arvr ::
                        (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
viewport_set_use_arvr cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_use_arvr
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

{-# NOINLINE bindVisualServer_viewport_set_vflip #-}

-- | If [code]true[/code], the viewport's rendering is flipped vertically.
bindVisualServer_viewport_set_vflip :: MethodBind
bindVisualServer_viewport_set_vflip
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_vflip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If [code]true[/code], the viewport's rendering is flipped vertically.
viewport_set_vflip ::
                     (VisualServer :< cls, Object :< cls) => cls -> Rid -> Bool -> IO ()
viewport_set_vflip cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_set_vflip
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)