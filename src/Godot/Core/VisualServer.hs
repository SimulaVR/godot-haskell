{-# LANGUAGE DerivingStrategies, GeneralizedNewtypeDeriving,
  TypeFamilies, TypeOperators, FlexibleContexts, DataKinds,
  MultiParamTypeClasses #-}
module Godot.Core.VisualServer
       (Godot.Core.VisualServer._VIEWPORT_CLEAR_ONLY_NEXT_FRAME,
        Godot.Core.VisualServer._ARRAY_FLAG_USE_16_BIT_BONES,
        Godot.Core.VisualServer._CANVAS_LIGHT_MODE_SUB,
        Godot.Core.VisualServer._CANVAS_ITEM_Z_MIN,
        Godot.Core.VisualServer._ARRAY_WEIGHTS_SIZE,
        Godot.Core.VisualServer._ARRAY_COMPRESS_INDEX,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_MAX_DISTANCE,
        Godot.Core.VisualServer._ARRAY_FORMAT_WEIGHTS,
        Godot.Core.VisualServer._TEXTURE_FLAG_REPEAT,
        Godot.Core.VisualServer._SHADOW_CASTING_SETTING_DOUBLE_SIDED,
        Godot.Core.VisualServer._VIEWPORT_UPDATE_ONCE,
        Godot.Core.VisualServer._MULTIMESH_TRANSFORM_2D,
        Godot.Core.VisualServer._VIEWPORT_DEBUG_DRAW_DISABLED,
        Godot.Core.VisualServer._ARRAY_COMPRESS_COLOR,
        Godot.Core.VisualServer._ENV_TONE_MAPPER_REINHARD,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_MAX,
        Godot.Core.VisualServer._ENV_SSAO_BLUR_DISABLED,
        Godot.Core.VisualServer._LIGHT_SPOT,
        Godot.Core.VisualServer._NINE_PATCH_TILE,
        Godot.Core.VisualServer._ENV_BG_SKY,
        Godot.Core.VisualServer._INSTANCE_REFLECTION_PROBE,
        Godot.Core.VisualServer._ENV_BG_CANVAS,
        Godot.Core.VisualServer._FEATURE_SHADERS,
        Godot.Core.VisualServer._MATERIAL_RENDER_PRIORITY_MAX,
        Godot.Core.VisualServer._GLOW_BLEND_MODE_SCREEN,
        Godot.Core.VisualServer._INFO_VERTICES_IN_FRAME,
        Godot.Core.VisualServer._ENV_SSAO_QUALITY_HIGH,
        Godot.Core.VisualServer._INFO_SHADER_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._TEXTURE_FLAG_MIPMAPS,
        Godot.Core.VisualServer._PARTICLES_DRAW_ORDER_VIEW_DEPTH,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_BIAS,
        Godot.Core.VisualServer._VIEWPORT_MSAA_EXT_4X,
        Godot.Core.VisualServer._CUBEMAP_RIGHT,
        Godot.Core.VisualServer._GLOW_BLEND_MODE_SOFTLIGHT,
        Godot.Core.VisualServer._ENV_BG_CLEAR_COLOR,
        Godot.Core.VisualServer._ENV_TONE_MAPPER_ACES,
        Godot.Core.VisualServer._ARRAY_NORMAL,
        Godot.Core.VisualServer._LIGHT_PARAM_RANGE,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_SURFACE_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._BLEND_SHAPE_MODE_NORMALIZED,
        Godot.Core.VisualServer._ARRAY_COMPRESS_DEFAULT,
        Godot.Core.VisualServer._VIEWPORT_MSAA_EXT_2X,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_BIAS_SPLIT_SCALE,
        Godot.Core.VisualServer._PARTICLES_DRAW_ORDER_INDEX,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_PCF3,
        Godot.Core.VisualServer._SHADOW_CASTING_SETTING_OFF,
        Godot.Core.VisualServer._TEXTURE_FLAG_MIRRORED_REPEAT,
        Godot.Core.VisualServer._VIEWPORT_DEBUG_DRAW_OVERDRAW,
        Godot.Core.VisualServer._GLOW_BLEND_MODE_ADDITIVE,
        Godot.Core.VisualServer._ENV_DOF_BLUR_QUALITY_MEDIUM,
        Godot.Core.VisualServer._NO_INDEX_ARRAY,
        Godot.Core.VisualServer._ENV_DOF_BLUR_QUALITY_LOW,
        Godot.Core.VisualServer._VIEWPORT_USAGE_2D,
        Godot.Core.VisualServer._LIGHT_OMNI_SHADOW_CUBE,
        Godot.Core.VisualServer._TEXTURE_TYPE_3D,
        Godot.Core.VisualServer._ARRAY_MAX,
        Godot.Core.VisualServer._ARRAY_FORMAT_COLOR,
        Godot.Core.VisualServer._VIEWPORT_MSAA_4X,
        Godot.Core.VisualServer._PRIMITIVE_LINES,
        Godot.Core.VisualServer._ARRAY_FORMAT_TEX_UV,
        Godot.Core.VisualServer._ENV_BG_MAX,
        Godot.Core.VisualServer._LIGHT_OMNI,
        Godot.Core.VisualServer._VIEWPORT_USAGE_2D_NO_SAMPLING,
        Godot.Core.VisualServer._MAX_CURSORS,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_SPLIT_3_OFFSET,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL_SHADOW_ORTHOGONAL,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_NONE,
        Godot.Core.VisualServer._VIEWPORT_CLEAR_NEVER,
        Godot.Core.VisualServer._CUBEMAP_BOTTOM,
        Godot.Core.VisualServer._INSTANCE_PARTICLES,
        Godot.Core.VisualServer._ENV_BG_COLOR_SKY,
        Godot.Core.VisualServer._VIEWPORT_MSAA_DISABLED,
        Godot.Core.VisualServer._ARRAY_COMPRESS_VERTEX,
        Godot.Core.VisualServer._TEXTURE_FLAG_CONVERT_TO_LINEAR,
        Godot.Core.VisualServer._MULTIMESH_COLOR_FLOAT,
        Godot.Core.VisualServer._INSTANCE_GEOMETRY_MASK,
        Godot.Core.VisualServer._ENV_BG_COLOR,
        Godot.Core.VisualServer._ARRAY_FORMAT_TEX_UV2,
        Godot.Core.VisualServer._ENV_SSAO_QUALITY_LOW,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_PCF13,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_PCF5,
        Godot.Core.VisualServer._SCENARIO_DEBUG_DISABLED,
        Godot.Core.VisualServer._VIEWPORT_MSAA_16X,
        Godot.Core.VisualServer._VIEWPORT_UPDATE_ALWAYS,
        Godot.Core.VisualServer._ENV_SSAO_BLUR_2x2,
        Godot.Core.VisualServer._ENV_SSAO_BLUR_3x3,
        Godot.Core.VisualServer._ARRAY_COMPRESS_TANGENT,
        Godot.Core.VisualServer._VIEWPORT_DEBUG_DRAW_UNSHADED,
        Godot.Core.VisualServer._MATERIAL_RENDER_PRIORITY_MIN,
        Godot.Core.VisualServer._ARRAY_COMPRESS_WEIGHTS,
        Godot.Core.VisualServer._ENV_SSAO_BLUR_1x1,
        Godot.Core.VisualServer._INSTANCE_FLAG_USE_BAKED_LIGHT,
        Godot.Core.VisualServer._INFO_TEXTURE_MEM_USED,
        Godot.Core.VisualServer._GLOW_BLEND_MODE_REPLACE,
        Godot.Core.VisualServer._VIEWPORT_USAGE_3D_NO_EFFECTS,
        Godot.Core.VisualServer._MULTIMESH_CUSTOM_DATA_FLOAT,
        Godot.Core.VisualServer._INFO_SURFACE_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._ARRAY_FORMAT_NORMAL,
        Godot.Core.VisualServer._CANVAS_LIGHT_MODE_MASK,
        Godot.Core.VisualServer._CUBEMAP_FRONT,
        Godot.Core.VisualServer._LIGHT_PARAM_MAX,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL_SHADOW_PARALLEL_2_SPLITS,
        Godot.Core.VisualServer._ARRAY_FORMAT_BONES,
        Godot.Core.VisualServer._CUBEMAP_BACK,
        Godot.Core.VisualServer._VIEWPORT_DEBUG_DRAW_WIREFRAME,
        Godot.Core.VisualServer._ARRAY_FORMAT_TANGENT,
        Godot.Core.VisualServer._FEATURE_MULTITHREADED,
        Godot.Core.VisualServer._INSTANCE_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE,
        Godot.Core.VisualServer._INSTANCE_MESH,
        Godot.Core.VisualServer._INFO_OBJECTS_IN_FRAME,
        Godot.Core.VisualServer._ARRAY_COMPRESS_TEX_UV2,
        Godot.Core.VisualServer._SHADER_CANVAS_ITEM,
        Godot.Core.VisualServer._INSTANCE_FLAG_MAX,
        Godot.Core.VisualServer._LIGHT_PARAM_ATTENUATION,
        Godot.Core.VisualServer._PARTICLES_DRAW_ORDER_LIFETIME,
        Godot.Core.VisualServer._NINE_PATCH_TILE_FIT,
        Godot.Core.VisualServer._INFO_VIDEO_MEM_USED,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL_SHADOW_PARALLEL_4_SPLITS,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_PCF7,
        Godot.Core.VisualServer._MULTIMESH_CUSTOM_DATA_8BIT,
        Godot.Core.VisualServer._PRIMITIVE_TRIANGLE_STRIP,
        Godot.Core.VisualServer._INFO_MATERIAL_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._MULTIMESH_COLOR_8BIT,
        Godot.Core.VisualServer._TEXTURE_TYPE_2D,
        Godot.Core.VisualServer._SHADOW_CASTING_SETTING_ON,
        Godot.Core.VisualServer._REFLECTION_PROBE_UPDATE_ALWAYS,
        Godot.Core.VisualServer._LIGHT_PARAM_SPOT_ANGLE,
        Godot.Core.VisualServer._PRIMITIVE_POINTS,
        Godot.Core.VisualServer._SHADER_PARTICLES,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_SPLIT_1_OFFSET,
        Godot.Core.VisualServer._ENV_SSAO_QUALITY_MEDIUM,
        Godot.Core.VisualServer._ARRAY_INDEX,
        Godot.Core.VisualServer._ARRAY_VERTEX,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_SPLIT_2_OFFSET,
        Godot.Core.VisualServer._ENV_TONE_MAPPER_LINEAR,
        Godot.Core.VisualServer._ARRAY_TEX_UV2,
        Godot.Core.VisualServer._LIGHT_PARAM_SPECULAR,
        Godot.Core.VisualServer._SHADER_SPATIAL,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_VERTICES_IN_FRAME,
        Godot.Core.VisualServer._ARRAY_COLOR,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_MATERIAL_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._TEXTURE_FLAG_FILTER,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_SHADER_CHANGES_IN_FRAME,
        Godot.Core.VisualServer._MULTIMESH_TRANSFORM_3D,
        Godot.Core.VisualServer._NINE_PATCH_STRETCH,
        Godot.Core.VisualServer._LIGHT_PARAM_CONTACT_SHADOW_SIZE,
        Godot.Core.VisualServer._VIEWPORT_CLEAR_ALWAYS,
        Godot.Core.VisualServer._ARRAY_COMPRESS_NORMAL,
        Godot.Core.VisualServer._INSTANCE_NONE,
        Godot.Core.VisualServer._CANVAS_LIGHT_MODE_ADD,
        Godot.Core.VisualServer._CUBEMAP_TOP,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_OBJECTS_IN_FRAME,
        Godot.Core.VisualServer._PRIMITIVE_TRIANGLE_FAN,
        Godot.Core.VisualServer._SHADER_MAX,
        Godot.Core.VisualServer._INSTANCE_IMMEDIATE,
        Godot.Core.VisualServer._SHADOW_CASTING_SETTING_SHADOWS_ONLY,
        Godot.Core.VisualServer._SCENARIO_DEBUG_SHADELESS,
        Godot.Core.VisualServer._ENV_DOF_BLUR_QUALITY_HIGH,
        Godot.Core.VisualServer._CANVAS_LIGHT_FILTER_PCF9,
        Godot.Core.VisualServer._VIEWPORT_UPDATE_DISABLED,
        Godot.Core.VisualServer._CUBEMAP_LEFT,
        Godot.Core.VisualServer._CANVAS_LIGHT_MODE_MIX,
        Godot.Core.VisualServer._INFO_DRAW_CALLS_IN_FRAME,
        Godot.Core.VisualServer._ARRAY_FORMAT_INDEX,
        Godot.Core.VisualServer._TEXTURE_FLAG_USED_FOR_STREAMING,
        Godot.Core.VisualServer._ARRAY_TANGENT,
        Godot.Core.VisualServer._INSTANCE_MULTIMESH,
        Godot.Core.VisualServer._INSTANCE_MAX,
        Godot.Core.VisualServer._TEXTURE_TYPE_CUBEMAP,
        Godot.Core.VisualServer._ARRAY_WEIGHTS,
        Godot.Core.VisualServer._INSTANCE_LIGHT,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_OPTIMIZED,
        Godot.Core.VisualServer._ARRAY_COMPRESS_BONES,
        Godot.Core.VisualServer._MULTIMESH_CUSTOM_DATA_NONE,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL,
        Godot.Core.VisualServer._SCENARIO_DEBUG_WIREFRAME,
        Godot.Core.VisualServer._LIGHT_PARAM_SHADOW_NORMAL_BIAS,
        Godot.Core.VisualServer._ARRAY_FORMAT_VERTEX,
        Godot.Core.VisualServer._LIGHT_OMNI_SHADOW_DETAIL_HORIZONTAL,
        Godot.Core.VisualServer._ENV_TONE_MAPPER_FILMIC,
        Godot.Core.VisualServer._VIEWPORT_RENDER_INFO_DRAW_CALLS_IN_FRAME,
        Godot.Core.VisualServer._CANVAS_ITEM_Z_MAX,
        Godot.Core.VisualServer._ARRAY_FLAG_USE_2D_VERTICES,
        Godot.Core.VisualServer._TEXTURE_TYPE_2D_ARRAY,
        Godot.Core.VisualServer._CANVAS_OCCLUDER_POLYGON_CULL_DISABLED,
        Godot.Core.VisualServer._SCENARIO_DEBUG_OVERDRAW,
        Godot.Core.VisualServer._VIEWPORT_UPDATE_WHEN_VISIBLE,
        Godot.Core.VisualServer._ARRAY_COMPRESS_TEX_UV,
        Godot.Core.VisualServer._CANVAS_OCCLUDER_POLYGON_CULL_CLOCKWISE,
        Godot.Core.VisualServer._MULTIMESH_COLOR_NONE,
        Godot.Core.VisualServer._BLEND_SHAPE_MODE_RELATIVE,
        Godot.Core.VisualServer._LIGHT_OMNI_SHADOW_DETAIL_VERTICAL,
        Godot.Core.VisualServer._PRIMITIVE_MAX,
        Godot.Core.VisualServer._LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_STABLE,
        Godot.Core.VisualServer._LIGHT_PARAM_ENERGY,
        Godot.Core.VisualServer._VIEWPORT_USAGE_3D,
        Godot.Core.VisualServer._CANVAS_OCCLUDER_POLYGON_CULL_COUNTER_CLOCKWISE,
        Godot.Core.VisualServer._PRIMITIVE_TRIANGLES,
        Godot.Core.VisualServer._INSTANCE_GI_PROBE,
        Godot.Core.VisualServer._ARRAY_BONES,
        Godot.Core.VisualServer._VIEWPORT_MSAA_8X,
        Godot.Core.VisualServer._ENV_BG_KEEP,
        Godot.Core.VisualServer._PRIMITIVE_LINE_LOOP,
        Godot.Core.VisualServer._INFO_USAGE_VIDEO_MEM_TOTAL,
        Godot.Core.VisualServer._ARRAY_TEX_UV,
        Godot.Core.VisualServer._INFO_VERTEX_MEM_USED,
        Godot.Core.VisualServer._MAX_GLOW_LEVELS,
        Godot.Core.VisualServer._PRIMITIVE_LINE_STRIP,
        Godot.Core.VisualServer._LIGHT_OMNI_SHADOW_DUAL_PARABOLOID,
        Godot.Core.VisualServer._TEXTURE_FLAG_ANISOTROPIC_FILTER,
        Godot.Core.VisualServer._TEXTURE_FLAGS_DEFAULT,
        Godot.Core.VisualServer._INSTANCE_LIGHTMAP_CAPTURE,
        Godot.Core.VisualServer._VIEWPORT_MSAA_2X,
        Godot.Core.VisualServer._LIGHT_PARAM_SPOT_ATTENUATION,
        Godot.Core.VisualServer._REFLECTION_PROBE_UPDATE_ONCE,
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
import qualified Data.Vector as V
import Linear(V2(..),V3(..),M22)
import Data.Colour(withOpacity)
import Data.Colour.SRGB(sRGB)
import System.IO.Unsafe
import Godot.Gdnative.Internal
import Godot.Api.Types
import Godot.Core.Object()

_VIEWPORT_CLEAR_ONLY_NEXT_FRAME :: Int
_VIEWPORT_CLEAR_ONLY_NEXT_FRAME = 2

_ARRAY_FLAG_USE_16_BIT_BONES :: Int
_ARRAY_FLAG_USE_16_BIT_BONES = 524288

_CANVAS_LIGHT_MODE_SUB :: Int
_CANVAS_LIGHT_MODE_SUB = 1

_CANVAS_ITEM_Z_MIN :: Int
_CANVAS_ITEM_Z_MIN = -4096

_ARRAY_WEIGHTS_SIZE :: Int
_ARRAY_WEIGHTS_SIZE = 4

_ARRAY_COMPRESS_INDEX :: Int
_ARRAY_COMPRESS_INDEX = 131072

_LIGHT_PARAM_SHADOW_MAX_DISTANCE :: Int
_LIGHT_PARAM_SHADOW_MAX_DISTANCE = 8

_ARRAY_FORMAT_WEIGHTS :: Int
_ARRAY_FORMAT_WEIGHTS = 128

_TEXTURE_FLAG_REPEAT :: Int
_TEXTURE_FLAG_REPEAT = 2

_SHADOW_CASTING_SETTING_DOUBLE_SIDED :: Int
_SHADOW_CASTING_SETTING_DOUBLE_SIDED = 2

_VIEWPORT_UPDATE_ONCE :: Int
_VIEWPORT_UPDATE_ONCE = 1

_MULTIMESH_TRANSFORM_2D :: Int
_MULTIMESH_TRANSFORM_2D = 0

_VIEWPORT_DEBUG_DRAW_DISABLED :: Int
_VIEWPORT_DEBUG_DRAW_DISABLED = 0

_ARRAY_COMPRESS_COLOR :: Int
_ARRAY_COMPRESS_COLOR = 4096

_ENV_TONE_MAPPER_REINHARD :: Int
_ENV_TONE_MAPPER_REINHARD = 1

_VIEWPORT_RENDER_INFO_MAX :: Int
_VIEWPORT_RENDER_INFO_MAX = 6

_ENV_SSAO_BLUR_DISABLED :: Int
_ENV_SSAO_BLUR_DISABLED = 0

_LIGHT_SPOT :: Int
_LIGHT_SPOT = 2

_NINE_PATCH_TILE :: Int
_NINE_PATCH_TILE = 1

_ENV_BG_SKY :: Int
_ENV_BG_SKY = 2

_INSTANCE_REFLECTION_PROBE :: Int
_INSTANCE_REFLECTION_PROBE = 6

_ENV_BG_CANVAS :: Int
_ENV_BG_CANVAS = 4

_FEATURE_SHADERS :: Int
_FEATURE_SHADERS = 0

_MATERIAL_RENDER_PRIORITY_MAX :: Int
_MATERIAL_RENDER_PRIORITY_MAX = 127

_GLOW_BLEND_MODE_SCREEN :: Int
_GLOW_BLEND_MODE_SCREEN = 1

_INFO_VERTICES_IN_FRAME :: Int
_INFO_VERTICES_IN_FRAME = 1

_ENV_SSAO_QUALITY_HIGH :: Int
_ENV_SSAO_QUALITY_HIGH = 2

_INFO_SHADER_CHANGES_IN_FRAME :: Int
_INFO_SHADER_CHANGES_IN_FRAME = 3

_TEXTURE_FLAG_MIPMAPS :: Int
_TEXTURE_FLAG_MIPMAPS = 1

_PARTICLES_DRAW_ORDER_VIEW_DEPTH :: Int
_PARTICLES_DRAW_ORDER_VIEW_DEPTH = 2

_LIGHT_PARAM_SHADOW_BIAS :: Int
_LIGHT_PARAM_SHADOW_BIAS = 13

_VIEWPORT_MSAA_EXT_4X :: Int
_VIEWPORT_MSAA_EXT_4X = 6

_CUBEMAP_RIGHT :: Int
_CUBEMAP_RIGHT = 1

_GLOW_BLEND_MODE_SOFTLIGHT :: Int
_GLOW_BLEND_MODE_SOFTLIGHT = 2

_ENV_BG_CLEAR_COLOR :: Int
_ENV_BG_CLEAR_COLOR = 0

_ENV_TONE_MAPPER_ACES :: Int
_ENV_TONE_MAPPER_ACES = 3

_ARRAY_NORMAL :: Int
_ARRAY_NORMAL = 1

_LIGHT_PARAM_RANGE :: Int
_LIGHT_PARAM_RANGE = 3

_VIEWPORT_RENDER_INFO_SURFACE_CHANGES_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_SURFACE_CHANGES_IN_FRAME = 4

_BLEND_SHAPE_MODE_NORMALIZED :: Int
_BLEND_SHAPE_MODE_NORMALIZED = 0

_ARRAY_COMPRESS_DEFAULT :: Int
_ARRAY_COMPRESS_DEFAULT = 97280

_VIEWPORT_MSAA_EXT_2X :: Int
_VIEWPORT_MSAA_EXT_2X = 5

_LIGHT_PARAM_SHADOW_BIAS_SPLIT_SCALE :: Int
_LIGHT_PARAM_SHADOW_BIAS_SPLIT_SCALE = 14

_PARTICLES_DRAW_ORDER_INDEX :: Int
_PARTICLES_DRAW_ORDER_INDEX = 0

_CANVAS_LIGHT_FILTER_PCF3 :: Int
_CANVAS_LIGHT_FILTER_PCF3 = 1

_SHADOW_CASTING_SETTING_OFF :: Int
_SHADOW_CASTING_SETTING_OFF = 0

_TEXTURE_FLAG_MIRRORED_REPEAT :: Int
_TEXTURE_FLAG_MIRRORED_REPEAT = 32

_VIEWPORT_DEBUG_DRAW_OVERDRAW :: Int
_VIEWPORT_DEBUG_DRAW_OVERDRAW = 2

_GLOW_BLEND_MODE_ADDITIVE :: Int
_GLOW_BLEND_MODE_ADDITIVE = 0

_ENV_DOF_BLUR_QUALITY_MEDIUM :: Int
_ENV_DOF_BLUR_QUALITY_MEDIUM = 1

_NO_INDEX_ARRAY :: Int
_NO_INDEX_ARRAY = -1

_ENV_DOF_BLUR_QUALITY_LOW :: Int
_ENV_DOF_BLUR_QUALITY_LOW = 0

_VIEWPORT_USAGE_2D :: Int
_VIEWPORT_USAGE_2D = 0

_LIGHT_OMNI_SHADOW_CUBE :: Int
_LIGHT_OMNI_SHADOW_CUBE = 1

_TEXTURE_TYPE_3D :: Int
_TEXTURE_TYPE_3D = 3

_ARRAY_MAX :: Int
_ARRAY_MAX = 9

_ARRAY_FORMAT_COLOR :: Int
_ARRAY_FORMAT_COLOR = 8

_VIEWPORT_MSAA_4X :: Int
_VIEWPORT_MSAA_4X = 2

_PRIMITIVE_LINES :: Int
_PRIMITIVE_LINES = 1

_ARRAY_FORMAT_TEX_UV :: Int
_ARRAY_FORMAT_TEX_UV = 16

_ENV_BG_MAX :: Int
_ENV_BG_MAX = 7

_LIGHT_OMNI :: Int
_LIGHT_OMNI = 1

_VIEWPORT_USAGE_2D_NO_SAMPLING :: Int
_VIEWPORT_USAGE_2D_NO_SAMPLING = 1

_MAX_CURSORS :: Int
_MAX_CURSORS = 8

_LIGHT_PARAM_SHADOW_SPLIT_3_OFFSET :: Int
_LIGHT_PARAM_SHADOW_SPLIT_3_OFFSET = 11

_LIGHT_DIRECTIONAL_SHADOW_ORTHOGONAL :: Int
_LIGHT_DIRECTIONAL_SHADOW_ORTHOGONAL = 0

_CANVAS_LIGHT_FILTER_NONE :: Int
_CANVAS_LIGHT_FILTER_NONE = 0

_VIEWPORT_CLEAR_NEVER :: Int
_VIEWPORT_CLEAR_NEVER = 1

_CUBEMAP_BOTTOM :: Int
_CUBEMAP_BOTTOM = 2

_INSTANCE_PARTICLES :: Int
_INSTANCE_PARTICLES = 4

_ENV_BG_COLOR_SKY :: Int
_ENV_BG_COLOR_SKY = 3

_VIEWPORT_MSAA_DISABLED :: Int
_VIEWPORT_MSAA_DISABLED = 0

_ARRAY_COMPRESS_VERTEX :: Int
_ARRAY_COMPRESS_VERTEX = 512

_TEXTURE_FLAG_CONVERT_TO_LINEAR :: Int
_TEXTURE_FLAG_CONVERT_TO_LINEAR = 16

_MULTIMESH_COLOR_FLOAT :: Int
_MULTIMESH_COLOR_FLOAT = 2

_INSTANCE_GEOMETRY_MASK :: Int
_INSTANCE_GEOMETRY_MASK = 30

_ENV_BG_COLOR :: Int
_ENV_BG_COLOR = 1

_ARRAY_FORMAT_TEX_UV2 :: Int
_ARRAY_FORMAT_TEX_UV2 = 32

_ENV_SSAO_QUALITY_LOW :: Int
_ENV_SSAO_QUALITY_LOW = 0

_CANVAS_LIGHT_FILTER_PCF13 :: Int
_CANVAS_LIGHT_FILTER_PCF13 = 5

_CANVAS_LIGHT_FILTER_PCF5 :: Int
_CANVAS_LIGHT_FILTER_PCF5 = 2

_SCENARIO_DEBUG_DISABLED :: Int
_SCENARIO_DEBUG_DISABLED = 0

_VIEWPORT_MSAA_16X :: Int
_VIEWPORT_MSAA_16X = 4

_VIEWPORT_UPDATE_ALWAYS :: Int
_VIEWPORT_UPDATE_ALWAYS = 3

_ENV_SSAO_BLUR_2x2 :: Int
_ENV_SSAO_BLUR_2x2 = 2

_ENV_SSAO_BLUR_3x3 :: Int
_ENV_SSAO_BLUR_3x3 = 3

_ARRAY_COMPRESS_TANGENT :: Int
_ARRAY_COMPRESS_TANGENT = 2048

_VIEWPORT_DEBUG_DRAW_UNSHADED :: Int
_VIEWPORT_DEBUG_DRAW_UNSHADED = 1

_MATERIAL_RENDER_PRIORITY_MIN :: Int
_MATERIAL_RENDER_PRIORITY_MIN = -128

_ARRAY_COMPRESS_WEIGHTS :: Int
_ARRAY_COMPRESS_WEIGHTS = 65536

_ENV_SSAO_BLUR_1x1 :: Int
_ENV_SSAO_BLUR_1x1 = 1

_INSTANCE_FLAG_USE_BAKED_LIGHT :: Int
_INSTANCE_FLAG_USE_BAKED_LIGHT = 0

_INFO_TEXTURE_MEM_USED :: Int
_INFO_TEXTURE_MEM_USED = 8

_GLOW_BLEND_MODE_REPLACE :: Int
_GLOW_BLEND_MODE_REPLACE = 3

_VIEWPORT_USAGE_3D_NO_EFFECTS :: Int
_VIEWPORT_USAGE_3D_NO_EFFECTS = 3

_MULTIMESH_CUSTOM_DATA_FLOAT :: Int
_MULTIMESH_CUSTOM_DATA_FLOAT = 2

_INFO_SURFACE_CHANGES_IN_FRAME :: Int
_INFO_SURFACE_CHANGES_IN_FRAME = 4

_ARRAY_FORMAT_NORMAL :: Int
_ARRAY_FORMAT_NORMAL = 2

_CANVAS_LIGHT_MODE_MASK :: Int
_CANVAS_LIGHT_MODE_MASK = 3

_CUBEMAP_FRONT :: Int
_CUBEMAP_FRONT = 4

_LIGHT_PARAM_MAX :: Int
_LIGHT_PARAM_MAX = 15

_LIGHT_DIRECTIONAL_SHADOW_PARALLEL_2_SPLITS :: Int
_LIGHT_DIRECTIONAL_SHADOW_PARALLEL_2_SPLITS = 1

_ARRAY_FORMAT_BONES :: Int
_ARRAY_FORMAT_BONES = 64

_CUBEMAP_BACK :: Int
_CUBEMAP_BACK = 5

_VIEWPORT_DEBUG_DRAW_WIREFRAME :: Int
_VIEWPORT_DEBUG_DRAW_WIREFRAME = 3

_ARRAY_FORMAT_TANGENT :: Int
_ARRAY_FORMAT_TANGENT = 4

_FEATURE_MULTITHREADED :: Int
_FEATURE_MULTITHREADED = 1

_INSTANCE_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE :: Int
_INSTANCE_FLAG_DRAW_NEXT_FRAME_IF_VISIBLE = 1

_INSTANCE_MESH :: Int
_INSTANCE_MESH = 1

_INFO_OBJECTS_IN_FRAME :: Int
_INFO_OBJECTS_IN_FRAME = 0

_ARRAY_COMPRESS_TEX_UV2 :: Int
_ARRAY_COMPRESS_TEX_UV2 = 16384

_SHADER_CANVAS_ITEM :: Int
_SHADER_CANVAS_ITEM = 1

_INSTANCE_FLAG_MAX :: Int
_INSTANCE_FLAG_MAX = 2

_LIGHT_PARAM_ATTENUATION :: Int
_LIGHT_PARAM_ATTENUATION = 4

_PARTICLES_DRAW_ORDER_LIFETIME :: Int
_PARTICLES_DRAW_ORDER_LIFETIME = 1

_NINE_PATCH_TILE_FIT :: Int
_NINE_PATCH_TILE_FIT = 2

_INFO_VIDEO_MEM_USED :: Int
_INFO_VIDEO_MEM_USED = 7

_LIGHT_DIRECTIONAL_SHADOW_PARALLEL_4_SPLITS :: Int
_LIGHT_DIRECTIONAL_SHADOW_PARALLEL_4_SPLITS = 2

_CANVAS_LIGHT_FILTER_PCF7 :: Int
_CANVAS_LIGHT_FILTER_PCF7 = 3

_MULTIMESH_CUSTOM_DATA_8BIT :: Int
_MULTIMESH_CUSTOM_DATA_8BIT = 1

_PRIMITIVE_TRIANGLE_STRIP :: Int
_PRIMITIVE_TRIANGLE_STRIP = 5

_INFO_MATERIAL_CHANGES_IN_FRAME :: Int
_INFO_MATERIAL_CHANGES_IN_FRAME = 2

_MULTIMESH_COLOR_8BIT :: Int
_MULTIMESH_COLOR_8BIT = 1

_TEXTURE_TYPE_2D :: Int
_TEXTURE_TYPE_2D = 0

_SHADOW_CASTING_SETTING_ON :: Int
_SHADOW_CASTING_SETTING_ON = 1

_REFLECTION_PROBE_UPDATE_ALWAYS :: Int
_REFLECTION_PROBE_UPDATE_ALWAYS = 1

_LIGHT_PARAM_SPOT_ANGLE :: Int
_LIGHT_PARAM_SPOT_ANGLE = 5

_PRIMITIVE_POINTS :: Int
_PRIMITIVE_POINTS = 0

_SHADER_PARTICLES :: Int
_SHADER_PARTICLES = 2

_LIGHT_PARAM_SHADOW_SPLIT_1_OFFSET :: Int
_LIGHT_PARAM_SHADOW_SPLIT_1_OFFSET = 9

_ENV_SSAO_QUALITY_MEDIUM :: Int
_ENV_SSAO_QUALITY_MEDIUM = 1

_ARRAY_INDEX :: Int
_ARRAY_INDEX = 8

_ARRAY_VERTEX :: Int
_ARRAY_VERTEX = 0

_LIGHT_PARAM_SHADOW_SPLIT_2_OFFSET :: Int
_LIGHT_PARAM_SHADOW_SPLIT_2_OFFSET = 10

_ENV_TONE_MAPPER_LINEAR :: Int
_ENV_TONE_MAPPER_LINEAR = 0

_ARRAY_TEX_UV2 :: Int
_ARRAY_TEX_UV2 = 5

_LIGHT_PARAM_SPECULAR :: Int
_LIGHT_PARAM_SPECULAR = 2

_SHADER_SPATIAL :: Int
_SHADER_SPATIAL = 0

_VIEWPORT_RENDER_INFO_VERTICES_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_VERTICES_IN_FRAME = 1

_ARRAY_COLOR :: Int
_ARRAY_COLOR = 3

_VIEWPORT_RENDER_INFO_MATERIAL_CHANGES_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_MATERIAL_CHANGES_IN_FRAME = 2

_TEXTURE_FLAG_FILTER :: Int
_TEXTURE_FLAG_FILTER = 4

_VIEWPORT_RENDER_INFO_SHADER_CHANGES_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_SHADER_CHANGES_IN_FRAME = 3

_MULTIMESH_TRANSFORM_3D :: Int
_MULTIMESH_TRANSFORM_3D = 1

_NINE_PATCH_STRETCH :: Int
_NINE_PATCH_STRETCH = 0

_LIGHT_PARAM_CONTACT_SHADOW_SIZE :: Int
_LIGHT_PARAM_CONTACT_SHADOW_SIZE = 7

_VIEWPORT_CLEAR_ALWAYS :: Int
_VIEWPORT_CLEAR_ALWAYS = 0

_ARRAY_COMPRESS_NORMAL :: Int
_ARRAY_COMPRESS_NORMAL = 1024

_INSTANCE_NONE :: Int
_INSTANCE_NONE = 0

_CANVAS_LIGHT_MODE_ADD :: Int
_CANVAS_LIGHT_MODE_ADD = 0

_CUBEMAP_TOP :: Int
_CUBEMAP_TOP = 3

_VIEWPORT_RENDER_INFO_OBJECTS_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_OBJECTS_IN_FRAME = 0

_PRIMITIVE_TRIANGLE_FAN :: Int
_PRIMITIVE_TRIANGLE_FAN = 6

_SHADER_MAX :: Int
_SHADER_MAX = 3

_INSTANCE_IMMEDIATE :: Int
_INSTANCE_IMMEDIATE = 3

_SHADOW_CASTING_SETTING_SHADOWS_ONLY :: Int
_SHADOW_CASTING_SETTING_SHADOWS_ONLY = 3

_SCENARIO_DEBUG_SHADELESS :: Int
_SCENARIO_DEBUG_SHADELESS = 3

_ENV_DOF_BLUR_QUALITY_HIGH :: Int
_ENV_DOF_BLUR_QUALITY_HIGH = 2

_CANVAS_LIGHT_FILTER_PCF9 :: Int
_CANVAS_LIGHT_FILTER_PCF9 = 4

_VIEWPORT_UPDATE_DISABLED :: Int
_VIEWPORT_UPDATE_DISABLED = 0

_CUBEMAP_LEFT :: Int
_CUBEMAP_LEFT = 0

_CANVAS_LIGHT_MODE_MIX :: Int
_CANVAS_LIGHT_MODE_MIX = 2

_INFO_DRAW_CALLS_IN_FRAME :: Int
_INFO_DRAW_CALLS_IN_FRAME = 5

_ARRAY_FORMAT_INDEX :: Int
_ARRAY_FORMAT_INDEX = 256

_TEXTURE_FLAG_USED_FOR_STREAMING :: Int
_TEXTURE_FLAG_USED_FOR_STREAMING = 2048

_ARRAY_TANGENT :: Int
_ARRAY_TANGENT = 2

_INSTANCE_MULTIMESH :: Int
_INSTANCE_MULTIMESH = 2

_INSTANCE_MAX :: Int
_INSTANCE_MAX = 9

_TEXTURE_TYPE_CUBEMAP :: Int
_TEXTURE_TYPE_CUBEMAP = 1

_ARRAY_WEIGHTS :: Int
_ARRAY_WEIGHTS = 7

_INSTANCE_LIGHT :: Int
_INSTANCE_LIGHT = 5

_LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_OPTIMIZED :: Int
_LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_OPTIMIZED = 1

_ARRAY_COMPRESS_BONES :: Int
_ARRAY_COMPRESS_BONES = 32768

_MULTIMESH_CUSTOM_DATA_NONE :: Int
_MULTIMESH_CUSTOM_DATA_NONE = 0

_LIGHT_DIRECTIONAL :: Int
_LIGHT_DIRECTIONAL = 0

_SCENARIO_DEBUG_WIREFRAME :: Int
_SCENARIO_DEBUG_WIREFRAME = 1

_LIGHT_PARAM_SHADOW_NORMAL_BIAS :: Int
_LIGHT_PARAM_SHADOW_NORMAL_BIAS = 12

_ARRAY_FORMAT_VERTEX :: Int
_ARRAY_FORMAT_VERTEX = 1

_LIGHT_OMNI_SHADOW_DETAIL_HORIZONTAL :: Int
_LIGHT_OMNI_SHADOW_DETAIL_HORIZONTAL = 1

_ENV_TONE_MAPPER_FILMIC :: Int
_ENV_TONE_MAPPER_FILMIC = 2

_VIEWPORT_RENDER_INFO_DRAW_CALLS_IN_FRAME :: Int
_VIEWPORT_RENDER_INFO_DRAW_CALLS_IN_FRAME = 5

_CANVAS_ITEM_Z_MAX :: Int
_CANVAS_ITEM_Z_MAX = 4096

_ARRAY_FLAG_USE_2D_VERTICES :: Int
_ARRAY_FLAG_USE_2D_VERTICES = 262144

_TEXTURE_TYPE_2D_ARRAY :: Int
_TEXTURE_TYPE_2D_ARRAY = 2

_CANVAS_OCCLUDER_POLYGON_CULL_DISABLED :: Int
_CANVAS_OCCLUDER_POLYGON_CULL_DISABLED = 0

_SCENARIO_DEBUG_OVERDRAW :: Int
_SCENARIO_DEBUG_OVERDRAW = 2

_VIEWPORT_UPDATE_WHEN_VISIBLE :: Int
_VIEWPORT_UPDATE_WHEN_VISIBLE = 2

_ARRAY_COMPRESS_TEX_UV :: Int
_ARRAY_COMPRESS_TEX_UV = 8192

_CANVAS_OCCLUDER_POLYGON_CULL_CLOCKWISE :: Int
_CANVAS_OCCLUDER_POLYGON_CULL_CLOCKWISE = 1

_MULTIMESH_COLOR_NONE :: Int
_MULTIMESH_COLOR_NONE = 0

_BLEND_SHAPE_MODE_RELATIVE :: Int
_BLEND_SHAPE_MODE_RELATIVE = 1

_LIGHT_OMNI_SHADOW_DETAIL_VERTICAL :: Int
_LIGHT_OMNI_SHADOW_DETAIL_VERTICAL = 0

_PRIMITIVE_MAX :: Int
_PRIMITIVE_MAX = 7

_LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_STABLE :: Int
_LIGHT_DIRECTIONAL_SHADOW_DEPTH_RANGE_STABLE = 0

_LIGHT_PARAM_ENERGY :: Int
_LIGHT_PARAM_ENERGY = 0

_VIEWPORT_USAGE_3D :: Int
_VIEWPORT_USAGE_3D = 2

_CANVAS_OCCLUDER_POLYGON_CULL_COUNTER_CLOCKWISE :: Int
_CANVAS_OCCLUDER_POLYGON_CULL_COUNTER_CLOCKWISE = 2

_PRIMITIVE_TRIANGLES :: Int
_PRIMITIVE_TRIANGLES = 4

_INSTANCE_GI_PROBE :: Int
_INSTANCE_GI_PROBE = 7

_ARRAY_BONES :: Int
_ARRAY_BONES = 6

_VIEWPORT_MSAA_8X :: Int
_VIEWPORT_MSAA_8X = 3

_ENV_BG_KEEP :: Int
_ENV_BG_KEEP = 5

_PRIMITIVE_LINE_LOOP :: Int
_PRIMITIVE_LINE_LOOP = 3

_INFO_USAGE_VIDEO_MEM_TOTAL :: Int
_INFO_USAGE_VIDEO_MEM_TOTAL = 6

_ARRAY_TEX_UV :: Int
_ARRAY_TEX_UV = 4

_INFO_VERTEX_MEM_USED :: Int
_INFO_VERTEX_MEM_USED = 9

_MAX_GLOW_LEVELS :: Int
_MAX_GLOW_LEVELS = 7

_PRIMITIVE_LINE_STRIP :: Int
_PRIMITIVE_LINE_STRIP = 2

_LIGHT_OMNI_SHADOW_DUAL_PARABOLOID :: Int
_LIGHT_OMNI_SHADOW_DUAL_PARABOLOID = 0

_TEXTURE_FLAG_ANISOTROPIC_FILTER :: Int
_TEXTURE_FLAG_ANISOTROPIC_FILTER = 8

_TEXTURE_FLAGS_DEFAULT :: Int
_TEXTURE_FLAGS_DEFAULT = 7

_INSTANCE_LIGHTMAP_CAPTURE :: Int
_INSTANCE_LIGHTMAP_CAPTURE = 8

_VIEWPORT_MSAA_2X :: Int
_VIEWPORT_MSAA_2X = 1

_LIGHT_PARAM_SPOT_ATTENUATION :: Int
_LIGHT_PARAM_SPOT_ATTENUATION = 6

_REFLECTION_PROBE_UPDATE_ONCE :: Int
_REFLECTION_PROBE_UPDATE_ONCE = 0

-- | Emitted at the end of the frame, after the VisualServer has finished updating all the Viewports.
sig_frame_post_draw :: Godot.Internal.Dispatch.Signal VisualServer
sig_frame_post_draw
  = Godot.Internal.Dispatch.Signal "frame_post_draw"

instance NodeSignal VisualServer "frame_post_draw" '[]

-- | Emitted at the beginning of the frame, before the VisualServer updates all the Viewports.
sig_frame_pre_draw :: Godot.Internal.Dispatch.Signal VisualServer
sig_frame_pre_draw
  = Godot.Internal.Dispatch.Signal "frame_pre_draw"

instance NodeSignal VisualServer "frame_pre_draw" '[]

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

instance NodeMethod VisualServer "black_bars_set_images"
           '[Rid, Rid, Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.black_bars_set_images

{-# NOINLINE bindVisualServer_black_bars_set_margins #-}

-- | Sets margin size, where black bars (or images, if @method black_bars_set_images@ was used) are rendered.
bindVisualServer_black_bars_set_margins :: MethodBind
bindVisualServer_black_bars_set_margins
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "black_bars_set_margins" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets margin size, where black bars (or images, if @method black_bars_set_images@ was used) are rendered.
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

instance NodeMethod VisualServer "black_bars_set_margins"
           '[Int, Int, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.black_bars_set_margins

{-# NOINLINE bindVisualServer_camera_create #-}

-- | Creates a camera and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @camera_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_camera_create :: MethodBind
bindVisualServer_camera_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a camera and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @camera_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
camera_create ::
                (VisualServer :< cls, Object :< cls) => cls -> IO Rid
camera_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_camera_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "camera_create" '[] (IO Rid) where
        nodeMethod = Godot.Core.VisualServer.camera_create

{-# NOINLINE bindVisualServer_camera_set_cull_mask #-}

-- | Sets the cull mask associated with this camera. The cull mask describes which 3D layers are rendered by this camera. Equivalent to @Camera.cull_mask@.
bindVisualServer_camera_set_cull_mask :: MethodBind
bindVisualServer_camera_set_cull_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the cull mask associated with this camera. The cull mask describes which 3D layers are rendered by this camera. Equivalent to @Camera.cull_mask@.
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

instance NodeMethod VisualServer "camera_set_cull_mask" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.camera_set_cull_mask

{-# NOINLINE bindVisualServer_camera_set_environment #-}

-- | Sets the environment used by this camera. Equivalent to @Camera.environment@.
bindVisualServer_camera_set_environment :: MethodBind
bindVisualServer_camera_set_environment
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the environment used by this camera. Equivalent to @Camera.environment@.
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

instance NodeMethod VisualServer "camera_set_environment"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.camera_set_environment

{-# NOINLINE bindVisualServer_camera_set_frustum #-}

-- | Sets camera to use frustum projection. This mode allows adjusting the @offset@ argument to create "tilted frustum" effects.
bindVisualServer_camera_set_frustum :: MethodBind
bindVisualServer_camera_set_frustum
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_frustum" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets camera to use frustum projection. This mode allows adjusting the @offset@ argument to create "tilted frustum" effects.
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

instance NodeMethod VisualServer "camera_set_frustum"
           '[Rid, Float, Vector2, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.camera_set_frustum

{-# NOINLINE bindVisualServer_camera_set_orthogonal #-}

-- | Sets camera to use orthogonal projection, also known as orthographic projection. Objects remain the same size on the screen no matter how far away they are.
bindVisualServer_camera_set_orthogonal :: MethodBind
bindVisualServer_camera_set_orthogonal
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_orthogonal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets camera to use orthogonal projection, also known as orthographic projection. Objects remain the same size on the screen no matter how far away they are.
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

instance NodeMethod VisualServer "camera_set_orthogonal"
           '[Rid, Float, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.camera_set_orthogonal

{-# NOINLINE bindVisualServer_camera_set_perspective #-}

-- | Sets camera to use perspective projection. Objects on the screen becomes smaller when they are far away.
bindVisualServer_camera_set_perspective :: MethodBind
bindVisualServer_camera_set_perspective
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_perspective" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets camera to use perspective projection. Objects on the screen becomes smaller when they are far away.
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

instance NodeMethod VisualServer "camera_set_perspective"
           '[Rid, Float, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.camera_set_perspective

{-# NOINLINE bindVisualServer_camera_set_transform #-}

-- | Sets @Transform@ of camera.
bindVisualServer_camera_set_transform :: MethodBind
bindVisualServer_camera_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets @Transform@ of camera.
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

instance NodeMethod VisualServer "camera_set_transform"
           '[Rid, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.camera_set_transform

{-# NOINLINE bindVisualServer_camera_set_use_vertical_aspect #-}

-- | If @true@, preserves the horizontal aspect ratio which is equivalent to @Camera.KEEP_WIDTH@. If @false@, preserves the vertical aspect ratio which is equivalent to @Camera.KEEP_HEIGHT@.
bindVisualServer_camera_set_use_vertical_aspect :: MethodBind
bindVisualServer_camera_set_use_vertical_aspect
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "camera_set_use_vertical_aspect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, preserves the horizontal aspect ratio which is equivalent to @Camera.KEEP_WIDTH@. If @false@, preserves the vertical aspect ratio which is equivalent to @Camera.KEEP_HEIGHT@.
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

instance NodeMethod VisualServer "camera_set_use_vertical_aspect"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.camera_set_use_vertical_aspect

{-# NOINLINE bindVisualServer_canvas_create #-}

-- | Creates a canvas and returns the assigned @RID@. It can be accessed with the RID that is returned. This RID will be used in all @canvas_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_canvas_create :: MethodBind
bindVisualServer_canvas_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a canvas and returns the assigned @RID@. It can be accessed with the RID that is returned. This RID will be used in all @canvas_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
canvas_create ::
                (VisualServer :< cls, Object :< cls) => cls -> IO Rid
canvas_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "canvas_create" '[] (IO Rid) where
        nodeMethod = Godot.Core.VisualServer.canvas_create

{-# NOINLINE bindVisualServer_canvas_item_add_circle #-}

-- | Adds a circle command to the @CanvasItem@'s draw commands.
bindVisualServer_canvas_item_add_circle :: MethodBind
bindVisualServer_canvas_item_add_circle
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_circle" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a circle command to the @CanvasItem@'s draw commands.
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

instance NodeMethod VisualServer "canvas_item_add_circle"
           '[Rid, Vector2, Float, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_circle

{-# NOINLINE bindVisualServer_canvas_item_add_clip_ignore #-}

-- | If ignore is @true@, the VisualServer does not perform clipping.
bindVisualServer_canvas_item_add_clip_ignore :: MethodBind
bindVisualServer_canvas_item_add_clip_ignore
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_clip_ignore" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If ignore is @true@, the VisualServer does not perform clipping.
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

instance NodeMethod VisualServer "canvas_item_add_clip_ignore"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_clip_ignore

{-# NOINLINE bindVisualServer_canvas_item_add_line #-}

-- | Adds a line command to the @CanvasItem@'s draw commands.
bindVisualServer_canvas_item_add_line :: MethodBind
bindVisualServer_canvas_item_add_line
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_line" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a line command to the @CanvasItem@'s draw commands.
canvas_item_add_line ::
                       (VisualServer :< cls, Object :< cls) =>
                       cls ->
                         Rid ->
                           Vector2 -> Vector2 -> Color -> Maybe Float -> Maybe Bool -> IO ()
canvas_item_add_line cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantReal (1)) toVariant arg5,
       maybe (VariantBool False) toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_line
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "canvas_item_add_line"
           '[Rid, Vector2, Vector2, Color, Maybe Float, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_line

{-# NOINLINE bindVisualServer_canvas_item_add_mesh #-}

-- | Adds a mesh command to the @CanvasItem@'s draw commands.
bindVisualServer_canvas_item_add_mesh :: MethodBind
bindVisualServer_canvas_item_add_mesh
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a mesh command to the @CanvasItem@'s draw commands.
canvas_item_add_mesh ::
                       (VisualServer :< cls, Object :< cls) =>
                       cls ->
                         Rid ->
                           Rid ->
                             Maybe Transform2d -> Maybe Color -> Maybe Rid -> Maybe Rid -> IO ()
canvas_item_add_mesh cls arg1 arg2 arg3 arg4 arg5 arg6
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantTransform2d
         (TF2d (V2 1 0) (V2 0 1) (V2 0 0))
         arg3,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg4,
       maybe VariantNil toVariant arg5, maybe VariantNil toVariant arg6]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_mesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "canvas_item_add_mesh"
           '[Rid, Rid, Maybe Transform2d, Maybe Color, Maybe Rid, Maybe Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_mesh

{-# NOINLINE bindVisualServer_canvas_item_add_multimesh #-}

-- | Adds a @MultiMesh@ to the @CanvasItem@'s draw commands. Only affects its aabb at the moment.
bindVisualServer_canvas_item_add_multimesh :: MethodBind
bindVisualServer_canvas_item_add_multimesh
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_multimesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @MultiMesh@ to the @CanvasItem@'s draw commands. Only affects its aabb at the moment.
canvas_item_add_multimesh ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Rid -> Rid -> Maybe Rid -> IO ()
canvas_item_add_multimesh cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe VariantNil toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_multimesh
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "canvas_item_add_multimesh"
           '[Rid, Rid, Rid, Maybe Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_multimesh

{-# NOINLINE bindVisualServer_canvas_item_add_nine_patch #-}

-- | Adds a nine patch image to the @CanvasItem@'s draw commands.
--   				See @NinePatchRect@ for more explanation.
bindVisualServer_canvas_item_add_nine_patch :: MethodBind
bindVisualServer_canvas_item_add_nine_patch
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_nine_patch" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a nine patch image to the @CanvasItem@'s draw commands.
--   				See @NinePatchRect@ for more explanation.
canvas_item_add_nine_patch ::
                             (VisualServer :< cls, Object :< cls) =>
                             cls ->
                               Rid ->
                                 Rect2 ->
                                   Rect2 ->
                                     Rid ->
                                       Vector2 ->
                                         Vector2 ->
                                           Maybe Int ->
                                             Maybe Int ->
                                               Maybe Bool -> Maybe Color -> Maybe Rid -> IO ()
canvas_item_add_nine_patch cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  arg8 arg9 arg10 arg11
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6,
       maybe (VariantInt (0)) toVariant arg7,
       maybe (VariantInt (0)) toVariant arg8,
       maybe (VariantBool True) toVariant arg9,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg10,
       maybe VariantNil toVariant arg11]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_nine_patch
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "canvas_item_add_nine_patch"
           '[Rid, Rect2, Rect2, Rid, Vector2, Vector2, Maybe Int, Maybe Int,
             Maybe Bool, Maybe Color, Maybe Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_nine_patch

{-# NOINLINE bindVisualServer_canvas_item_add_particles #-}

-- | Adds a particle system to the @CanvasItem@'s draw commands.
bindVisualServer_canvas_item_add_particles :: MethodBind
bindVisualServer_canvas_item_add_particles
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_particles" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a particle system to the @CanvasItem@'s draw commands.
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

instance NodeMethod VisualServer "canvas_item_add_particles"
           '[Rid, Rid, Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_particles

{-# NOINLINE bindVisualServer_canvas_item_add_polygon #-}

-- | Adds a polygon to the @CanvasItem@'s draw commands.
bindVisualServer_canvas_item_add_polygon :: MethodBind
bindVisualServer_canvas_item_add_polygon
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_polygon" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a polygon to the @CanvasItem@'s draw commands.
canvas_item_add_polygon ::
                          (VisualServer :< cls, Object :< cls) =>
                          cls ->
                            Rid ->
                              PoolVector2Array ->
                                PoolColorArray ->
                                  Maybe PoolVector2Array ->
                                    Maybe Rid -> Maybe Rid -> Maybe Bool -> IO ()
canvas_item_add_polygon cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       defaultedVariant VariantPoolVector2Array V.empty arg4,
       maybe VariantNil toVariant arg5, maybe VariantNil toVariant arg6,
       maybe (VariantBool False) toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_polygon
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "canvas_item_add_polygon"
           '[Rid, PoolVector2Array, PoolColorArray, Maybe PoolVector2Array,
             Maybe Rid, Maybe Rid, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_polygon

{-# NOINLINE bindVisualServer_canvas_item_add_polyline #-}

-- | Adds a polyline, which is a line from multiple points with a width, to the @CanvasItem@'s draw commands.
bindVisualServer_canvas_item_add_polyline :: MethodBind
bindVisualServer_canvas_item_add_polyline
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_polyline" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a polyline, which is a line from multiple points with a width, to the @CanvasItem@'s draw commands.
canvas_item_add_polyline ::
                           (VisualServer :< cls, Object :< cls) =>
                           cls ->
                             Rid ->
                               PoolVector2Array ->
                                 PoolColorArray -> Maybe Float -> Maybe Bool -> IO ()
canvas_item_add_polyline cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantReal (1)) toVariant arg4,
       maybe (VariantBool False) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_polyline
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "canvas_item_add_polyline"
           '[Rid, PoolVector2Array, PoolColorArray, Maybe Float, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_polyline

{-# NOINLINE bindVisualServer_canvas_item_add_primitive #-}

-- | Adds a primitive to the @CanvasItem@'s draw commands.
bindVisualServer_canvas_item_add_primitive :: MethodBind
bindVisualServer_canvas_item_add_primitive
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_primitive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a primitive to the @CanvasItem@'s draw commands.
canvas_item_add_primitive ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls ->
                              Rid ->
                                PoolVector2Array ->
                                  PoolColorArray ->
                                    PoolVector2Array -> Rid -> Maybe Float -> Maybe Rid -> IO ()
canvas_item_add_primitive cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, maybe (VariantReal (1)) toVariant arg6,
       maybe VariantNil toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_add_primitive
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "canvas_item_add_primitive"
           '[Rid, PoolVector2Array, PoolColorArray, PoolVector2Array, Rid,
             Maybe Float, Maybe Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_primitive

{-# NOINLINE bindVisualServer_canvas_item_add_rect #-}

-- | Adds a rectangle to the @CanvasItem@'s draw commands.
bindVisualServer_canvas_item_add_rect :: MethodBind
bindVisualServer_canvas_item_add_rect
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a rectangle to the @CanvasItem@'s draw commands.
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

instance NodeMethod VisualServer "canvas_item_add_rect"
           '[Rid, Rect2, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_rect

{-# NOINLINE bindVisualServer_canvas_item_add_set_transform #-}

-- | Adds a @Transform2D@ command to the @CanvasItem@'s draw commands.
--   				This sets the extra_matrix uniform when executed. This affects the later commands of the canvas item.
bindVisualServer_canvas_item_add_set_transform :: MethodBind
bindVisualServer_canvas_item_add_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a @Transform2D@ command to the @CanvasItem@'s draw commands.
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

instance NodeMethod VisualServer "canvas_item_add_set_transform"
           '[Rid, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_set_transform

{-# NOINLINE bindVisualServer_canvas_item_add_texture_rect #-}

-- | Adds a textured rect to the @CanvasItem@'s draw commands.
bindVisualServer_canvas_item_add_texture_rect :: MethodBind
bindVisualServer_canvas_item_add_texture_rect
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_texture_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a textured rect to the @CanvasItem@'s draw commands.
canvas_item_add_texture_rect ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls ->
                                 Rid ->
                                   Rect2 ->
                                     Rid ->
                                       Maybe Bool -> Maybe Color -> Maybe Bool -> Maybe Rid -> IO ()
canvas_item_add_texture_rect cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantBool False) toVariant arg4,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg5,
       maybe (VariantBool False) toVariant arg6,
       maybe VariantNil toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_add_texture_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "canvas_item_add_texture_rect"
           '[Rid, Rect2, Rid, Maybe Bool, Maybe Color, Maybe Bool, Maybe Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_texture_rect

{-# NOINLINE bindVisualServer_canvas_item_add_texture_rect_region
             #-}

-- | Adds a texture rect with region setting to the @CanvasItem@'s draw commands.
bindVisualServer_canvas_item_add_texture_rect_region :: MethodBind
bindVisualServer_canvas_item_add_texture_rect_region
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_texture_rect_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a texture rect with region setting to the @CanvasItem@'s draw commands.
canvas_item_add_texture_rect_region ::
                                      (VisualServer :< cls, Object :< cls) =>
                                      cls ->
                                        Rid ->
                                          Rect2 ->
                                            Rid ->
                                              Rect2 ->
                                                Maybe Color ->
                                                  Maybe Bool -> Maybe Rid -> Maybe Bool -> IO ()
canvas_item_add_texture_rect_region cls arg1 arg2 arg3 arg4 arg5
  arg6 arg7 arg8
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       defaultedVariant VariantColor (withOpacity (sRGB 1 1 1) 1) arg5,
       maybe (VariantBool False) toVariant arg6,
       maybe VariantNil toVariant arg7,
       maybe (VariantBool True) toVariant arg8]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_add_texture_rect_region
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer
           "canvas_item_add_texture_rect_region"
           '[Rid, Rect2, Rid, Rect2, Maybe Color, Maybe Bool, Maybe Rid,
             Maybe Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_item_add_texture_rect_region

{-# NOINLINE bindVisualServer_canvas_item_add_triangle_array #-}

-- | Adds a triangle array to the @CanvasItem@'s draw commands.
bindVisualServer_canvas_item_add_triangle_array :: MethodBind
bindVisualServer_canvas_item_add_triangle_array
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_add_triangle_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a triangle array to the @CanvasItem@'s draw commands.
canvas_item_add_triangle_array ::
                                 (VisualServer :< cls, Object :< cls) =>
                                 cls ->
                                   Rid ->
                                     PoolIntArray ->
                                       PoolVector2Array ->
                                         PoolColorArray ->
                                           Maybe PoolVector2Array ->
                                             Maybe PoolIntArray ->
                                               Maybe PoolRealArray ->
                                                 Maybe Rid ->
                                                   Maybe Int ->
                                                     Maybe Rid -> Maybe Bool -> Maybe Bool -> IO ()
canvas_item_add_triangle_array cls arg1 arg2 arg3 arg4 arg5 arg6
  arg7 arg8 arg9 arg10 arg11 arg12
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       defaultedVariant VariantPoolVector2Array V.empty arg5,
       defaultedVariant VariantPoolIntArray V.empty arg6,
       defaultedVariant VariantPoolRealArray V.empty arg7,
       maybe VariantNil toVariant arg8,
       maybe (VariantInt (-1)) toVariant arg9,
       maybe VariantNil toVariant arg10,
       maybe (VariantBool False) toVariant arg11,
       maybe (VariantBool False) toVariant arg12]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_canvas_item_add_triangle_array
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "canvas_item_add_triangle_array"
           '[Rid, PoolIntArray, PoolVector2Array, PoolColorArray,
             Maybe PoolVector2Array, Maybe PoolIntArray, Maybe PoolRealArray,
             Maybe Rid, Maybe Int, Maybe Rid, Maybe Bool, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_add_triangle_array

{-# NOINLINE bindVisualServer_canvas_item_clear #-}

-- | Clears the @CanvasItem@ and removes all commands in it.
bindVisualServer_canvas_item_clear :: MethodBind
bindVisualServer_canvas_item_clear
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears the @CanvasItem@ and removes all commands in it.
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

instance NodeMethod VisualServer "canvas_item_clear" '[Rid] (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_clear

{-# NOINLINE bindVisualServer_canvas_item_create #-}

-- | Creates a new @CanvasItem@ and returns its @RID@. It can be accessed with the RID that is returned. This RID will be used in all @canvas_item_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_canvas_item_create :: MethodBind
bindVisualServer_canvas_item_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new @CanvasItem@ and returns its @RID@. It can be accessed with the RID that is returned. This RID will be used in all @canvas_item_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
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

instance NodeMethod VisualServer "canvas_item_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_create

{-# NOINLINE bindVisualServer_canvas_item_set_clip #-}

-- | Sets clipping for the @CanvasItem@.
bindVisualServer_canvas_item_set_clip :: MethodBind
bindVisualServer_canvas_item_set_clip
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_clip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets clipping for the @CanvasItem@.
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

instance NodeMethod VisualServer "canvas_item_set_clip"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_set_clip

{-# NOINLINE bindVisualServer_canvas_item_set_copy_to_backbuffer
             #-}

-- | Sets the @CanvasItem@ to copy a rect to the backbuffer.
bindVisualServer_canvas_item_set_copy_to_backbuffer :: MethodBind
bindVisualServer_canvas_item_set_copy_to_backbuffer
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_copy_to_backbuffer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @CanvasItem@ to copy a rect to the backbuffer.
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

instance NodeMethod VisualServer
           "canvas_item_set_copy_to_backbuffer"
           '[Rid, Bool, Rect2]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_item_set_copy_to_backbuffer

{-# NOINLINE bindVisualServer_canvas_item_set_custom_rect #-}

-- | Defines a custom drawing rectangle for the @CanvasItem@.
bindVisualServer_canvas_item_set_custom_rect :: MethodBind
bindVisualServer_canvas_item_set_custom_rect
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_custom_rect" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Defines a custom drawing rectangle for the @CanvasItem@.
canvas_item_set_custom_rect ::
                              (VisualServer :< cls, Object :< cls) =>
                              cls -> Rid -> Bool -> Maybe Rect2 -> IO ()
canvas_item_set_custom_rect cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       defaultedVariant VariantRect2 (V2 (V2 0 0) (V2 0 0)) arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_canvas_item_set_custom_rect
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "canvas_item_set_custom_rect"
           '[Rid, Bool, Maybe Rect2]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_set_custom_rect

{-# NOINLINE bindVisualServer_canvas_item_set_distance_field_mode
             #-}

-- | Enables the use of distance fields for GUI elements that are rendering distance field based fonts.
bindVisualServer_canvas_item_set_distance_field_mode :: MethodBind
bindVisualServer_canvas_item_set_distance_field_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_distance_field_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Enables the use of distance fields for GUI elements that are rendering distance field based fonts.
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

instance NodeMethod VisualServer
           "canvas_item_set_distance_field_mode"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_item_set_distance_field_mode

{-# NOINLINE bindVisualServer_canvas_item_set_draw_behind_parent
             #-}

-- | Sets @CanvasItem@ to be drawn behind its parent.
bindVisualServer_canvas_item_set_draw_behind_parent :: MethodBind
bindVisualServer_canvas_item_set_draw_behind_parent
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_draw_behind_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets @CanvasItem@ to be drawn behind its parent.
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

instance NodeMethod VisualServer
           "canvas_item_set_draw_behind_parent"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_item_set_draw_behind_parent

{-# NOINLINE bindVisualServer_canvas_item_set_draw_index #-}

-- | Sets the index for the @CanvasItem@.
bindVisualServer_canvas_item_set_draw_index :: MethodBind
bindVisualServer_canvas_item_set_draw_index
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_draw_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the index for the @CanvasItem@.
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

instance NodeMethod VisualServer "canvas_item_set_draw_index"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_set_draw_index

{-# NOINLINE bindVisualServer_canvas_item_set_light_mask #-}

-- | The light mask. See @LightOccluder2D@ for more information on light masks.
bindVisualServer_canvas_item_set_light_mask :: MethodBind
bindVisualServer_canvas_item_set_light_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light mask. See @LightOccluder2D@ for more information on light masks.
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

instance NodeMethod VisualServer "canvas_item_set_light_mask"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_set_light_mask

{-# NOINLINE bindVisualServer_canvas_item_set_material #-}

-- | Sets a new material to the @CanvasItem@.
bindVisualServer_canvas_item_set_material :: MethodBind
bindVisualServer_canvas_item_set_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a new material to the @CanvasItem@.
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

instance NodeMethod VisualServer "canvas_item_set_material"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_set_material

{-# NOINLINE bindVisualServer_canvas_item_set_modulate #-}

-- | Sets the color that modulates the @CanvasItem@ and its children.
bindVisualServer_canvas_item_set_modulate :: MethodBind
bindVisualServer_canvas_item_set_modulate
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color that modulates the @CanvasItem@ and its children.
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

instance NodeMethod VisualServer "canvas_item_set_modulate"
           '[Rid, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_set_modulate

{-# NOINLINE bindVisualServer_canvas_item_set_parent #-}

-- | Sets the parent for the @CanvasItem@. The parent can be another canvas item, or it can be the root canvas that is attached to the viewport.
bindVisualServer_canvas_item_set_parent :: MethodBind
bindVisualServer_canvas_item_set_parent
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the parent for the @CanvasItem@. The parent can be another canvas item, or it can be the root canvas that is attached to the viewport.
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

instance NodeMethod VisualServer "canvas_item_set_parent"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_set_parent

{-# NOINLINE bindVisualServer_canvas_item_set_self_modulate #-}

-- | Sets the color that modulates the @CanvasItem@ without children.
bindVisualServer_canvas_item_set_self_modulate :: MethodBind
bindVisualServer_canvas_item_set_self_modulate
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_self_modulate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color that modulates the @CanvasItem@ without children.
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

instance NodeMethod VisualServer "canvas_item_set_self_modulate"
           '[Rid, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_set_self_modulate

{-# NOINLINE bindVisualServer_canvas_item_set_sort_children_by_y
             #-}

-- | Sets if @CanvasItem@'s children should be sorted by y-position.
bindVisualServer_canvas_item_set_sort_children_by_y :: MethodBind
bindVisualServer_canvas_item_set_sort_children_by_y
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_sort_children_by_y" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets if @CanvasItem@'s children should be sorted by y-position.
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

instance NodeMethod VisualServer
           "canvas_item_set_sort_children_by_y"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_item_set_sort_children_by_y

{-# NOINLINE bindVisualServer_canvas_item_set_transform #-}

-- | Sets the @CanvasItem@'s @Transform2D@.
bindVisualServer_canvas_item_set_transform :: MethodBind
bindVisualServer_canvas_item_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @CanvasItem@'s @Transform2D@.
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

instance NodeMethod VisualServer "canvas_item_set_transform"
           '[Rid, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_set_transform

{-# NOINLINE bindVisualServer_canvas_item_set_use_parent_material
             #-}

-- | Sets if the @CanvasItem@ uses its parent's material.
bindVisualServer_canvas_item_set_use_parent_material :: MethodBind
bindVisualServer_canvas_item_set_use_parent_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_use_parent_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets if the @CanvasItem@ uses its parent's material.
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

instance NodeMethod VisualServer
           "canvas_item_set_use_parent_material"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_item_set_use_parent_material

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

instance NodeMethod VisualServer "canvas_item_set_visible"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_set_visible

{-# NOINLINE bindVisualServer_canvas_item_set_z_as_relative_to_parent
             #-}

-- | If this is enabled, the Z index of the parent will be added to the children's Z index.
bindVisualServer_canvas_item_set_z_as_relative_to_parent ::
                                                         MethodBind
bindVisualServer_canvas_item_set_z_as_relative_to_parent
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_z_as_relative_to_parent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If this is enabled, the Z index of the parent will be added to the children's Z index.
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

instance NodeMethod VisualServer
           "canvas_item_set_z_as_relative_to_parent"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_item_set_z_as_relative_to_parent

{-# NOINLINE bindVisualServer_canvas_item_set_z_index #-}

-- | Sets the @CanvasItem@'s Z index, i.e. its draw order (lower indexes are drawn first).
bindVisualServer_canvas_item_set_z_index :: MethodBind
bindVisualServer_canvas_item_set_z_index
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_item_set_z_index" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @CanvasItem@'s Z index, i.e. its draw order (lower indexes are drawn first).
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

instance NodeMethod VisualServer "canvas_item_set_z_index"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_item_set_z_index

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

instance NodeMethod VisualServer "canvas_light_attach_to_canvas"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_attach_to_canvas

{-# NOINLINE bindVisualServer_canvas_light_create #-}

-- | Creates a canvas light and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @canvas_light_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_canvas_light_create :: MethodBind
bindVisualServer_canvas_light_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a canvas light and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @canvas_light_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
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

instance NodeMethod VisualServer "canvas_light_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_create

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

instance NodeMethod VisualServer
           "canvas_light_occluder_attach_to_canvas"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_light_occluder_attach_to_canvas

{-# NOINLINE bindVisualServer_canvas_light_occluder_create #-}

-- | Creates a light occluder and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @canvas_light_ocluder_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_canvas_light_occluder_create :: MethodBind
bindVisualServer_canvas_light_occluder_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_occluder_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a light occluder and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @canvas_light_ocluder_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
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

instance NodeMethod VisualServer "canvas_light_occluder_create" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_occluder_create

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

instance NodeMethod VisualServer
           "canvas_light_occluder_set_enabled"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_light_occluder_set_enabled

{-# NOINLINE bindVisualServer_canvas_light_occluder_set_light_mask
             #-}

-- | The light mask. See @LightOccluder2D@ for more information on light masks.
bindVisualServer_canvas_light_occluder_set_light_mask :: MethodBind
bindVisualServer_canvas_light_occluder_set_light_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_occluder_set_light_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light mask. See @LightOccluder2D@ for more information on light masks.
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

instance NodeMethod VisualServer
           "canvas_light_occluder_set_light_mask"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_light_occluder_set_light_mask

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

instance NodeMethod VisualServer
           "canvas_light_occluder_set_polygon"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_light_occluder_set_polygon

{-# NOINLINE bindVisualServer_canvas_light_occluder_set_transform
             #-}

-- | Sets a light occluder's @Transform2D@.
bindVisualServer_canvas_light_occluder_set_transform :: MethodBind
bindVisualServer_canvas_light_occluder_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_occluder_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a light occluder's @Transform2D@.
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

instance NodeMethod VisualServer
           "canvas_light_occluder_set_transform"
           '[Rid, Transform2d]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_light_occluder_set_transform

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

instance NodeMethod VisualServer "canvas_light_set_color"
           '[Rid, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_color

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

instance NodeMethod VisualServer "canvas_light_set_enabled"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_enabled

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

instance NodeMethod VisualServer "canvas_light_set_energy"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_energy

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

instance NodeMethod VisualServer "canvas_light_set_height"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_height

{-# NOINLINE bindVisualServer_canvas_light_set_item_cull_mask #-}

-- | The light mask. See @LightOccluder2D@ for more information on light masks.
bindVisualServer_canvas_light_set_item_cull_mask :: MethodBind
bindVisualServer_canvas_light_set_item_cull_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_item_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The light mask. See @LightOccluder2D@ for more information on light masks.
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

instance NodeMethod VisualServer "canvas_light_set_item_cull_mask"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_light_set_item_cull_mask

{-# NOINLINE bindVisualServer_canvas_light_set_item_shadow_cull_mask
             #-}

-- | The binary mask used to determine which layers this canvas light's shadows affects. See @LightOccluder2D@ for more information on light masks.
bindVisualServer_canvas_light_set_item_shadow_cull_mask ::
                                                        MethodBind
bindVisualServer_canvas_light_set_item_shadow_cull_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_item_shadow_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The binary mask used to determine which layers this canvas light's shadows affects. See @LightOccluder2D@ for more information on light masks.
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

instance NodeMethod VisualServer
           "canvas_light_set_item_shadow_cull_mask"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_light_set_item_shadow_cull_mask

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

instance NodeMethod VisualServer "canvas_light_set_layer_range"
           '[Rid, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_layer_range

{-# NOINLINE bindVisualServer_canvas_light_set_mode #-}

-- | The mode of the light, see @enum CanvasLightMode@ constants.
bindVisualServer_canvas_light_set_mode :: MethodBind
bindVisualServer_canvas_light_set_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | The mode of the light, see @enum CanvasLightMode@ constants.
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

instance NodeMethod VisualServer "canvas_light_set_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_mode

{-# NOINLINE bindVisualServer_canvas_light_set_scale #-}

-- | Sets the texture's scale factor of the light. Equivalent to @Light2D.texture_scale@.
bindVisualServer_canvas_light_set_scale :: MethodBind
bindVisualServer_canvas_light_set_scale
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the texture's scale factor of the light. Equivalent to @Light2D.texture_scale@.
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

instance NodeMethod VisualServer "canvas_light_set_scale"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_scale

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

instance NodeMethod VisualServer
           "canvas_light_set_shadow_buffer_size"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_light_set_shadow_buffer_size

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

instance NodeMethod VisualServer "canvas_light_set_shadow_color"
           '[Rid, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_shadow_color

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

instance NodeMethod VisualServer "canvas_light_set_shadow_enabled"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_light_set_shadow_enabled

{-# NOINLINE bindVisualServer_canvas_light_set_shadow_filter #-}

-- | Sets the canvas light's shadow's filter, see @enum CanvasLightShadowFilter@ constants.
bindVisualServer_canvas_light_set_shadow_filter :: MethodBind
bindVisualServer_canvas_light_set_shadow_filter
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_shadow_filter" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the canvas light's shadow's filter, see @enum CanvasLightShadowFilter@ constants.
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

instance NodeMethod VisualServer "canvas_light_set_shadow_filter"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_shadow_filter

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

instance NodeMethod VisualServer
           "canvas_light_set_shadow_gradient_length"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_light_set_shadow_gradient_length

{-# NOINLINE bindVisualServer_canvas_light_set_shadow_smooth #-}

-- | Smoothens the shadow. The lower, the smoother.
bindVisualServer_canvas_light_set_shadow_smooth :: MethodBind
bindVisualServer_canvas_light_set_shadow_smooth
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_shadow_smooth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Smoothens the shadow. The lower, the smoother.
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

instance NodeMethod VisualServer "canvas_light_set_shadow_smooth"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_shadow_smooth

{-# NOINLINE bindVisualServer_canvas_light_set_texture #-}

-- | Sets texture to be used by light. Equivalent to @Light2D.texture@.
bindVisualServer_canvas_light_set_texture :: MethodBind
bindVisualServer_canvas_light_set_texture
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_texture" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets texture to be used by light. Equivalent to @Light2D.texture@.
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

instance NodeMethod VisualServer "canvas_light_set_texture"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_texture

{-# NOINLINE bindVisualServer_canvas_light_set_texture_offset #-}

-- | Sets the offset of the light's texture. Equivalent to @Light2D.offset@.
bindVisualServer_canvas_light_set_texture_offset :: MethodBind
bindVisualServer_canvas_light_set_texture_offset
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_texture_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the offset of the light's texture. Equivalent to @Light2D.offset@.
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

instance NodeMethod VisualServer "canvas_light_set_texture_offset"
           '[Rid, Vector2]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_light_set_texture_offset

{-# NOINLINE bindVisualServer_canvas_light_set_transform #-}

-- | Sets the canvas light's @Transform2D@.
bindVisualServer_canvas_light_set_transform :: MethodBind
bindVisualServer_canvas_light_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the canvas light's @Transform2D@.
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

instance NodeMethod VisualServer "canvas_light_set_transform"
           '[Rid, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_transform

{-# NOINLINE bindVisualServer_canvas_light_set_z_range #-}

-- | Sets the Z range of objects that will be affected by this light. Equivalent to @Light2D.range_z_min@ and @Light2D.range_z_max@.
bindVisualServer_canvas_light_set_z_range :: MethodBind
bindVisualServer_canvas_light_set_z_range
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_light_set_z_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the Z range of objects that will be affected by this light. Equivalent to @Light2D.range_z_min@ and @Light2D.range_z_max@.
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

instance NodeMethod VisualServer "canvas_light_set_z_range"
           '[Rid, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_light_set_z_range

{-# NOINLINE bindVisualServer_canvas_occluder_polygon_create #-}

-- | Creates a new light occluder polygon and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @canvas_occluder_polygon_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_canvas_occluder_polygon_create :: MethodBind
bindVisualServer_canvas_occluder_polygon_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_occluder_polygon_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new light occluder polygon and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @canvas_occluder_polygon_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
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

instance NodeMethod VisualServer "canvas_occluder_polygon_create"
           '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.canvas_occluder_polygon_create

{-# NOINLINE bindVisualServer_canvas_occluder_polygon_set_cull_mode
             #-}

-- | Sets an occluder polygons cull mode. See @enum CanvasOccluderPolygonCullMode@ constants.
bindVisualServer_canvas_occluder_polygon_set_cull_mode ::
                                                       MethodBind
bindVisualServer_canvas_occluder_polygon_set_cull_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_occluder_polygon_set_cull_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an occluder polygons cull mode. See @enum CanvasOccluderPolygonCullMode@ constants.
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

instance NodeMethod VisualServer
           "canvas_occluder_polygon_set_cull_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_occluder_polygon_set_cull_mode

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

instance NodeMethod VisualServer
           "canvas_occluder_polygon_set_shape"
           '[Rid, PoolVector2Array, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_occluder_polygon_set_shape

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

instance NodeMethod VisualServer
           "canvas_occluder_polygon_set_shape_as_lines"
           '[Rid, PoolVector2Array]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.canvas_occluder_polygon_set_shape_as_lines

{-# NOINLINE bindVisualServer_canvas_set_item_mirroring #-}

-- | A copy of the canvas item will be drawn with a local offset of the mirroring @Vector2@.
bindVisualServer_canvas_set_item_mirroring :: MethodBind
bindVisualServer_canvas_set_item_mirroring
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "canvas_set_item_mirroring" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | A copy of the canvas item will be drawn with a local offset of the mirroring @Vector2@.
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

instance NodeMethod VisualServer "canvas_set_item_mirroring"
           '[Rid, Rid, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_set_item_mirroring

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

instance NodeMethod VisualServer "canvas_set_modulate"
           '[Rid, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.canvas_set_modulate

{-# NOINLINE bindVisualServer_directional_light_create #-}

-- | Creates a directional light and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID can be used in most @light_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this directional light to an instance using @method instance_set_base@ using the returned RID.
bindVisualServer_directional_light_create :: MethodBind
bindVisualServer_directional_light_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "directional_light_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a directional light and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID can be used in most @light_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this directional light to an instance using @method instance_set_base@ using the returned RID.
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

instance NodeMethod VisualServer "directional_light_create" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.directional_light_create

{-# NOINLINE bindVisualServer_draw #-}

-- | Draws a frame. @i@This method is deprecated@/i@, please use @method force_draw@ instead.
bindVisualServer_draw :: MethodBind
bindVisualServer_draw
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Draws a frame. @i@This method is deprecated@/i@, please use @method force_draw@ instead.
draw ::
       (VisualServer :< cls, Object :< cls) =>
       cls -> Maybe Bool -> Maybe Float -> IO ()
draw cls arg1 arg2
  = withVariantArray
      [maybe (VariantBool True) toVariant arg1,
       maybe (VariantReal (0)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_draw (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "draw" '[Maybe Bool, Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.draw

{-# NOINLINE bindVisualServer_environment_create #-}

-- | Creates an environment and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @environment_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_environment_create :: MethodBind
bindVisualServer_environment_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an environment and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @environment_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
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

instance NodeMethod VisualServer "environment_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.environment_create

{-# NOINLINE bindVisualServer_environment_set_adjustment #-}

-- | Sets the values to be used with the "Adjustment" post-process effect. See @Environment@ for more details.
bindVisualServer_environment_set_adjustment :: MethodBind
bindVisualServer_environment_set_adjustment
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_adjustment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the values to be used with the "Adjustment" post-process effect. See @Environment@ for more details.
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

instance NodeMethod VisualServer "environment_set_adjustment"
           '[Rid, Bool, Float, Float, Float, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_adjustment

{-# NOINLINE bindVisualServer_environment_set_ambient_light #-}

-- | Sets the ambient light parameters. See @Environment@ for more details.
bindVisualServer_environment_set_ambient_light :: MethodBind
bindVisualServer_environment_set_ambient_light
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_ambient_light" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the ambient light parameters. See @Environment@ for more details.
environment_set_ambient_light ::
                                (VisualServer :< cls, Object :< cls) =>
                                cls -> Rid -> Color -> Maybe Float -> Maybe Float -> IO ()
environment_set_ambient_light cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantReal (1)) toVariant arg3,
       maybe (VariantReal (0)) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_environment_set_ambient_light
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "environment_set_ambient_light"
           '[Rid, Color, Maybe Float, Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_ambient_light

{-# NOINLINE bindVisualServer_environment_set_background #-}

-- | Sets the @i@BGMode@/i@ of the environment. Equivalent to @Environment.background_mode@.
bindVisualServer_environment_set_background :: MethodBind
bindVisualServer_environment_set_background
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_background" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @i@BGMode@/i@ of the environment. Equivalent to @Environment.background_mode@.
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

instance NodeMethod VisualServer "environment_set_background"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_background

{-# NOINLINE bindVisualServer_environment_set_bg_color #-}

-- | Color displayed for clear areas of the scene (if using Custom color or Color+Sky background modes).
bindVisualServer_environment_set_bg_color :: MethodBind
bindVisualServer_environment_set_bg_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_bg_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Color displayed for clear areas of the scene (if using Custom color or Color+Sky background modes).
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

instance NodeMethod VisualServer "environment_set_bg_color"
           '[Rid, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_bg_color

{-# NOINLINE bindVisualServer_environment_set_bg_energy #-}

-- | Sets the intensity of the background color.
bindVisualServer_environment_set_bg_energy :: MethodBind
bindVisualServer_environment_set_bg_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_bg_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the intensity of the background color.
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

instance NodeMethod VisualServer "environment_set_bg_energy"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_bg_energy

{-# NOINLINE bindVisualServer_environment_set_canvas_max_layer #-}

-- | Sets the maximum layer to use if using Canvas background mode.
bindVisualServer_environment_set_canvas_max_layer :: MethodBind
bindVisualServer_environment_set_canvas_max_layer
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_canvas_max_layer" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the maximum layer to use if using Canvas background mode.
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

instance NodeMethod VisualServer "environment_set_canvas_max_layer"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.environment_set_canvas_max_layer

{-# NOINLINE bindVisualServer_environment_set_dof_blur_far #-}

-- | Sets the values to be used with the "DoF Far Blur" post-process effect. See @Environment@ for more details.
bindVisualServer_environment_set_dof_blur_far :: MethodBind
bindVisualServer_environment_set_dof_blur_far
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_dof_blur_far" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the values to be used with the "DoF Far Blur" post-process effect. See @Environment@ for more details.
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

instance NodeMethod VisualServer "environment_set_dof_blur_far"
           '[Rid, Bool, Float, Float, Float, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_dof_blur_far

{-# NOINLINE bindVisualServer_environment_set_dof_blur_near #-}

-- | Sets the values to be used with the "DoF Near Blur" post-process effect. See @Environment@ for more details.
bindVisualServer_environment_set_dof_blur_near :: MethodBind
bindVisualServer_environment_set_dof_blur_near
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_dof_blur_near" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the values to be used with the "DoF Near Blur" post-process effect. See @Environment@ for more details.
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

instance NodeMethod VisualServer "environment_set_dof_blur_near"
           '[Rid, Bool, Float, Float, Float, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_dof_blur_near

{-# NOINLINE bindVisualServer_environment_set_fog #-}

-- | Sets the variables to be used with the scene fog. See @Environment@ for more details.
bindVisualServer_environment_set_fog :: MethodBind
bindVisualServer_environment_set_fog
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_fog" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the variables to be used with the scene fog. See @Environment@ for more details.
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

instance NodeMethod VisualServer "environment_set_fog"
           '[Rid, Bool, Color, Color, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_fog

{-# NOINLINE bindVisualServer_environment_set_fog_depth #-}

-- | Sets the variables to be used with the fog depth effect. See @Environment@ for more details.
bindVisualServer_environment_set_fog_depth :: MethodBind
bindVisualServer_environment_set_fog_depth
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_fog_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the variables to be used with the fog depth effect. See @Environment@ for more details.
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

instance NodeMethod VisualServer "environment_set_fog_depth"
           '[Rid, Bool, Float, Float, Float, Bool, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_fog_depth

{-# NOINLINE bindVisualServer_environment_set_fog_height #-}

-- | Sets the variables to be used with the fog height effect. See @Environment@ for more details.
bindVisualServer_environment_set_fog_height :: MethodBind
bindVisualServer_environment_set_fog_height
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_fog_height" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the variables to be used with the fog height effect. See @Environment@ for more details.
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

instance NodeMethod VisualServer "environment_set_fog_height"
           '[Rid, Bool, Float, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_fog_height

{-# NOINLINE bindVisualServer_environment_set_glow #-}

-- | Sets the variables to be used with the "glow" post-process effect. See @Environment@ for more details.
bindVisualServer_environment_set_glow :: MethodBind
bindVisualServer_environment_set_glow
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_glow" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the variables to be used with the "glow" post-process effect. See @Environment@ for more details.
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

instance NodeMethod VisualServer "environment_set_glow"
           '[Rid, Bool, Int, Float, Float, Float, Int, Float, Float, Float,
             Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_glow

{-# NOINLINE bindVisualServer_environment_set_sky #-}

-- | Sets the @Sky@ to be used as the environment's background when using @i@BGMode@/i@ sky. Equivalent to @Environment.background_sky@.
bindVisualServer_environment_set_sky :: MethodBind
bindVisualServer_environment_set_sky
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_sky" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Sky@ to be used as the environment's background when using @i@BGMode@/i@ sky. Equivalent to @Environment.background_sky@.
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

instance NodeMethod VisualServer "environment_set_sky" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_sky

{-# NOINLINE bindVisualServer_environment_set_sky_custom_fov #-}

-- | Sets a custom field of view for the background @Sky@. Equivalent to @Environment.background_sky_custom_fov@.
bindVisualServer_environment_set_sky_custom_fov :: MethodBind
bindVisualServer_environment_set_sky_custom_fov
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_sky_custom_fov" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a custom field of view for the background @Sky@. Equivalent to @Environment.background_sky_custom_fov@.
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

instance NodeMethod VisualServer "environment_set_sky_custom_fov"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_sky_custom_fov

{-# NOINLINE bindVisualServer_environment_set_sky_orientation #-}

-- | Sets the rotation of the background @Sky@ expressed as a @Basis@. Equivalent to @Environment.background_sky_orientation@.
bindVisualServer_environment_set_sky_orientation :: MethodBind
bindVisualServer_environment_set_sky_orientation
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_sky_orientation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the rotation of the background @Sky@ expressed as a @Basis@. Equivalent to @Environment.background_sky_orientation@.
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

instance NodeMethod VisualServer "environment_set_sky_orientation"
           '[Rid, Basis]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.environment_set_sky_orientation

{-# NOINLINE bindVisualServer_environment_set_ssao #-}

-- | Sets the variables to be used with the "Screen Space Ambient Occlusion (SSAO)" post-process effect. See @Environment@ for more details.
bindVisualServer_environment_set_ssao :: MethodBind
bindVisualServer_environment_set_ssao
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_ssao" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the variables to be used with the "Screen Space Ambient Occlusion (SSAO)" post-process effect. See @Environment@ for more details.
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

instance NodeMethod VisualServer "environment_set_ssao"
           '[Rid, Bool, Float, Float, Float, Float, Float, Float, Float,
             Color, Int, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_ssao

{-# NOINLINE bindVisualServer_environment_set_ssr #-}

-- | Sets the variables to be used with the "screen space reflections" post-process effect. See @Environment@ for more details.
bindVisualServer_environment_set_ssr :: MethodBind
bindVisualServer_environment_set_ssr
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_ssr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the variables to be used with the "screen space reflections" post-process effect. See @Environment@ for more details.
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

instance NodeMethod VisualServer "environment_set_ssr"
           '[Rid, Bool, Int, Float, Float, Float, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_ssr

{-# NOINLINE bindVisualServer_environment_set_tonemap #-}

-- | Sets the variables to be used with the "tonemap" post-process effect. See @Environment@ for more details.
bindVisualServer_environment_set_tonemap :: MethodBind
bindVisualServer_environment_set_tonemap
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "environment_set_tonemap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the variables to be used with the "tonemap" post-process effect. See @Environment@ for more details.
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

instance NodeMethod VisualServer "environment_set_tonemap"
           '[Rid, Int, Float, Float, Bool, Float, Float, Float, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.environment_set_tonemap

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

instance NodeMethod VisualServer "finish" '[] (IO ()) where
        nodeMethod = Godot.Core.VisualServer.finish

{-# NOINLINE bindVisualServer_force_draw #-}

-- | Forces a frame to be drawn when the function is called. Drawing a frame updates all @Viewport@s that are set to update. Use with extreme caution.
bindVisualServer_force_draw :: MethodBind
bindVisualServer_force_draw
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "force_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Forces a frame to be drawn when the function is called. Drawing a frame updates all @Viewport@s that are set to update. Use with extreme caution.
force_draw ::
             (VisualServer :< cls, Object :< cls) =>
             cls -> Maybe Bool -> Maybe Float -> IO ()
force_draw cls arg1 arg2
  = withVariantArray
      [maybe (VariantBool True) toVariant arg1,
       maybe (VariantReal (0)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_force_draw (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "force_draw"
           '[Maybe Bool, Maybe Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.force_draw

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

instance NodeMethod VisualServer "force_sync" '[] (IO ()) where
        nodeMethod = Godot.Core.VisualServer.force_sync

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

instance NodeMethod VisualServer "free_rid" '[Rid] (IO ()) where
        nodeMethod = Godot.Core.VisualServer.free_rid

{-# NOINLINE bindVisualServer_get_render_info #-}

-- | Returns a certain information, see @enum RenderInfo@ for options.
bindVisualServer_get_render_info :: MethodBind
bindVisualServer_get_render_info
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "get_render_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a certain information, see @enum RenderInfo@ for options.
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

instance NodeMethod VisualServer "get_render_info" '[Int] (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.get_render_info

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

instance NodeMethod VisualServer "get_test_cube" '[] (IO Rid) where
        nodeMethod = Godot.Core.VisualServer.get_test_cube

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

instance NodeMethod VisualServer "get_test_texture" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.get_test_texture

{-# NOINLINE bindVisualServer_get_video_adapter_name #-}

-- | Returns the name of the video adapter (e.g. "GeForce GTX 1080/PCIe/SSE2").
--   				__Note:__ When running a headless or server binary, this function returns an empty string.
bindVisualServer_get_video_adapter_name :: MethodBind
bindVisualServer_get_video_adapter_name
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "get_video_adapter_name" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the name of the video adapter (e.g. "GeForce GTX 1080/PCIe/SSE2").
--   				__Note:__ When running a headless or server binary, this function returns an empty string.
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

instance NodeMethod VisualServer "get_video_adapter_name" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualServer.get_video_adapter_name

{-# NOINLINE bindVisualServer_get_video_adapter_vendor #-}

-- | Returns the vendor of the video adapter (e.g. "NVIDIA Corporation").
--   				__Note:__ When running a headless or server binary, this function returns an empty string.
bindVisualServer_get_video_adapter_vendor :: MethodBind
bindVisualServer_get_video_adapter_vendor
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "get_video_adapter_vendor" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the vendor of the video adapter (e.g. "NVIDIA Corporation").
--   				__Note:__ When running a headless or server binary, this function returns an empty string.
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

instance NodeMethod VisualServer "get_video_adapter_vendor" '[]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualServer.get_video_adapter_vendor

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

instance NodeMethod VisualServer "get_white_texture" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.get_white_texture

{-# NOINLINE bindVisualServer_gi_probe_create #-}

-- | Creates a GI probe and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @gi_probe_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this GI probe to an instance using @method instance_set_base@ using the returned RID.
bindVisualServer_gi_probe_create :: MethodBind
bindVisualServer_gi_probe_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a GI probe and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @gi_probe_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this GI probe to an instance using @method instance_set_base@ using the returned RID.
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

instance NodeMethod VisualServer "gi_probe_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_create

{-# NOINLINE bindVisualServer_gi_probe_get_bias #-}

-- | Returns the bias value for the GI probe. Bias is used to avoid self occlusion. Equivalent to @GIProbeData.bias@.
bindVisualServer_gi_probe_get_bias :: MethodBind
bindVisualServer_gi_probe_get_bias
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the bias value for the GI probe. Bias is used to avoid self occlusion. Equivalent to @GIProbeData.bias@.
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

instance NodeMethod VisualServer "gi_probe_get_bias" '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_get_bias

{-# NOINLINE bindVisualServer_gi_probe_get_bounds #-}

-- | Returns the axis-aligned bounding box that covers the full extent of the GI probe.
bindVisualServer_gi_probe_get_bounds :: MethodBind
bindVisualServer_gi_probe_get_bounds
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the axis-aligned bounding box that covers the full extent of the GI probe.
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

instance NodeMethod VisualServer "gi_probe_get_bounds" '[Rid]
           (IO Aabb)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_get_bounds

{-# NOINLINE bindVisualServer_gi_probe_get_cell_size #-}

-- | Returns the cell size set by @method gi_probe_set_cell_size@.
bindVisualServer_gi_probe_get_cell_size :: MethodBind
bindVisualServer_gi_probe_get_cell_size
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cell size set by @method gi_probe_set_cell_size@.
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

instance NodeMethod VisualServer "gi_probe_get_cell_size" '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_get_cell_size

{-# NOINLINE bindVisualServer_gi_probe_get_dynamic_data #-}

-- | Returns the data used by the GI probe.
bindVisualServer_gi_probe_get_dynamic_data :: MethodBind
bindVisualServer_gi_probe_get_dynamic_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_dynamic_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the data used by the GI probe.
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

instance NodeMethod VisualServer "gi_probe_get_dynamic_data" '[Rid]
           (IO PoolIntArray)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_get_dynamic_data

{-# NOINLINE bindVisualServer_gi_probe_get_dynamic_range #-}

-- | Returns the dynamic range set for this GI probe. Equivalent to @GIProbe.dynamic_range@.
bindVisualServer_gi_probe_get_dynamic_range :: MethodBind
bindVisualServer_gi_probe_get_dynamic_range
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_dynamic_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the dynamic range set for this GI probe. Equivalent to @GIProbe.dynamic_range@.
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

instance NodeMethod VisualServer "gi_probe_get_dynamic_range"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_get_dynamic_range

{-# NOINLINE bindVisualServer_gi_probe_get_energy #-}

-- | Returns the energy multiplier for this GI probe. Equivalent to @GIProbe.energy@.
bindVisualServer_gi_probe_get_energy :: MethodBind
bindVisualServer_gi_probe_get_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the energy multiplier for this GI probe. Equivalent to @GIProbe.energy@.
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

instance NodeMethod VisualServer "gi_probe_get_energy" '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_get_energy

{-# NOINLINE bindVisualServer_gi_probe_get_normal_bias #-}

-- | Returns the normal bias for this GI probe. Equivalent to @GIProbe.normal_bias@.
bindVisualServer_gi_probe_get_normal_bias :: MethodBind
bindVisualServer_gi_probe_get_normal_bias
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_normal_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the normal bias for this GI probe. Equivalent to @GIProbe.normal_bias@.
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

instance NodeMethod VisualServer "gi_probe_get_normal_bias" '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_get_normal_bias

{-# NOINLINE bindVisualServer_gi_probe_get_propagation #-}

-- | Returns the propagation value for this GI probe. Equivalent to @GIProbe.propagation@.
bindVisualServer_gi_probe_get_propagation :: MethodBind
bindVisualServer_gi_probe_get_propagation
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the propagation value for this GI probe. Equivalent to @GIProbe.propagation@.
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

instance NodeMethod VisualServer "gi_probe_get_propagation" '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_get_propagation

{-# NOINLINE bindVisualServer_gi_probe_get_to_cell_xform #-}

-- | Returns the Transform set by @method gi_probe_set_to_cell_xform@.
bindVisualServer_gi_probe_get_to_cell_xform :: MethodBind
bindVisualServer_gi_probe_get_to_cell_xform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_get_to_cell_xform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the Transform set by @method gi_probe_set_to_cell_xform@.
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

instance NodeMethod VisualServer "gi_probe_get_to_cell_xform"
           '[Rid]
           (IO Transform)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_get_to_cell_xform

{-# NOINLINE bindVisualServer_gi_probe_is_compressed #-}

-- | Returns @true@ if the GI probe data associated with this GI probe is compressed. Equivalent to @GIProbe.compress@.
bindVisualServer_gi_probe_is_compressed :: MethodBind
bindVisualServer_gi_probe_is_compressed
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_is_compressed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the GI probe data associated with this GI probe is compressed. Equivalent to @GIProbe.compress@.
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

instance NodeMethod VisualServer "gi_probe_is_compressed" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_is_compressed

{-# NOINLINE bindVisualServer_gi_probe_is_interior #-}

-- | Returns @true@ if the GI probe is set to interior, meaning it does not account for sky light. Equivalent to @GIProbe.interior@.
bindVisualServer_gi_probe_is_interior :: MethodBind
bindVisualServer_gi_probe_is_interior
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_is_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the GI probe is set to interior, meaning it does not account for sky light. Equivalent to @GIProbe.interior@.
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

instance NodeMethod VisualServer "gi_probe_is_interior" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_is_interior

{-# NOINLINE bindVisualServer_gi_probe_set_bias #-}

-- | Sets the bias value to avoid self-occlusion. Equivalent to @GIProbe.bias@.
bindVisualServer_gi_probe_set_bias :: MethodBind
bindVisualServer_gi_probe_set_bias
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the bias value to avoid self-occlusion. Equivalent to @GIProbe.bias@.
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

instance NodeMethod VisualServer "gi_probe_set_bias" '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_set_bias

{-# NOINLINE bindVisualServer_gi_probe_set_bounds #-}

-- | Sets the axis-aligned bounding box that covers the extent of the GI probe.
bindVisualServer_gi_probe_set_bounds :: MethodBind
bindVisualServer_gi_probe_set_bounds
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the axis-aligned bounding box that covers the extent of the GI probe.
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

instance NodeMethod VisualServer "gi_probe_set_bounds" '[Rid, Aabb]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_set_bounds

{-# NOINLINE bindVisualServer_gi_probe_set_cell_size #-}

-- | Sets the size of individual cells within the GI probe.
bindVisualServer_gi_probe_set_cell_size :: MethodBind
bindVisualServer_gi_probe_set_cell_size
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_cell_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of individual cells within the GI probe.
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

instance NodeMethod VisualServer "gi_probe_set_cell_size"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_set_cell_size

{-# NOINLINE bindVisualServer_gi_probe_set_compress #-}

-- | Sets the compression setting for the GI probe data. Compressed data will take up less space but may look worse. Equivalent to @GIProbe.compress@.
bindVisualServer_gi_probe_set_compress :: MethodBind
bindVisualServer_gi_probe_set_compress
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_compress" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the compression setting for the GI probe data. Compressed data will take up less space but may look worse. Equivalent to @GIProbe.compress@.
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

instance NodeMethod VisualServer "gi_probe_set_compress"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_set_compress

{-# NOINLINE bindVisualServer_gi_probe_set_dynamic_data #-}

-- | Sets the data to be used in the GI probe for lighting calculations. Normally this is created and called internally within the @GIProbe@ node. You should not try to set this yourself.
bindVisualServer_gi_probe_set_dynamic_data :: MethodBind
bindVisualServer_gi_probe_set_dynamic_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_dynamic_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the data to be used in the GI probe for lighting calculations. Normally this is created and called internally within the @GIProbe@ node. You should not try to set this yourself.
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

instance NodeMethod VisualServer "gi_probe_set_dynamic_data"
           '[Rid, PoolIntArray]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_set_dynamic_data

{-# NOINLINE bindVisualServer_gi_probe_set_dynamic_range #-}

-- | Sets the dynamic range of the GI probe. Dynamic range sets the limit for how bright lights can be. A smaller range captures greater detail but limits how bright lights can be. Equivalent to @GIProbe.dynamic_range@.
bindVisualServer_gi_probe_set_dynamic_range :: MethodBind
bindVisualServer_gi_probe_set_dynamic_range
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_dynamic_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the dynamic range of the GI probe. Dynamic range sets the limit for how bright lights can be. A smaller range captures greater detail but limits how bright lights can be. Equivalent to @GIProbe.dynamic_range@.
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

instance NodeMethod VisualServer "gi_probe_set_dynamic_range"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_set_dynamic_range

{-# NOINLINE bindVisualServer_gi_probe_set_energy #-}

-- | Sets the energy multiplier for this GI probe. A higher energy makes the indirect light from the GI probe brighter. Equivalent to @GIProbe.energy@.
bindVisualServer_gi_probe_set_energy :: MethodBind
bindVisualServer_gi_probe_set_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the energy multiplier for this GI probe. A higher energy makes the indirect light from the GI probe brighter. Equivalent to @GIProbe.energy@.
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

instance NodeMethod VisualServer "gi_probe_set_energy"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_set_energy

{-# NOINLINE bindVisualServer_gi_probe_set_interior #-}

-- | Sets the interior value of this GI probe. A GI probe set to interior does not include the sky when calculating lighting. Equivalent to @GIProbe.interior@.
bindVisualServer_gi_probe_set_interior :: MethodBind
bindVisualServer_gi_probe_set_interior
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the interior value of this GI probe. A GI probe set to interior does not include the sky when calculating lighting. Equivalent to @GIProbe.interior@.
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

instance NodeMethod VisualServer "gi_probe_set_interior"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_set_interior

{-# NOINLINE bindVisualServer_gi_probe_set_normal_bias #-}

-- | Sets the normal bias for this GI probe. Normal bias behaves similar to the other form of bias and may help reduce self-occlusion. Equivalent to @GIProbe.normal_bias@.
bindVisualServer_gi_probe_set_normal_bias :: MethodBind
bindVisualServer_gi_probe_set_normal_bias
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_normal_bias" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the normal bias for this GI probe. Normal bias behaves similar to the other form of bias and may help reduce self-occlusion. Equivalent to @GIProbe.normal_bias@.
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

instance NodeMethod VisualServer "gi_probe_set_normal_bias"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_set_normal_bias

{-# NOINLINE bindVisualServer_gi_probe_set_propagation #-}

-- | Sets the propagation of light within this GI probe. Equivalent to @GIProbe.propagation@.
bindVisualServer_gi_probe_set_propagation :: MethodBind
bindVisualServer_gi_probe_set_propagation
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_propagation" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the propagation of light within this GI probe. Equivalent to @GIProbe.propagation@.
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

instance NodeMethod VisualServer "gi_probe_set_propagation"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_set_propagation

{-# NOINLINE bindVisualServer_gi_probe_set_to_cell_xform #-}

-- | Sets the to cell @Transform@ for this GI probe.
bindVisualServer_gi_probe_set_to_cell_xform :: MethodBind
bindVisualServer_gi_probe_set_to_cell_xform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "gi_probe_set_to_cell_xform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the to cell @Transform@ for this GI probe.
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

instance NodeMethod VisualServer "gi_probe_set_to_cell_xform"
           '[Rid, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.gi_probe_set_to_cell_xform

{-# NOINLINE bindVisualServer_has_changed #-}

-- | Returns @true@ if changes have been made to the VisualServer's data. @method draw@ is usually called if this happens.
bindVisualServer_has_changed :: MethodBind
bindVisualServer_has_changed
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "has_changed" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if changes have been made to the VisualServer's data. @method draw@ is usually called if this happens.
has_changed ::
              (VisualServer :< cls, Object :< cls) => cls -> IO Bool
has_changed cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_has_changed (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "has_changed" '[] (IO Bool) where
        nodeMethod = Godot.Core.VisualServer.has_changed

{-# NOINLINE bindVisualServer_has_feature #-}

-- | Not yet implemented. Always returns @false@.
bindVisualServer_has_feature :: MethodBind
bindVisualServer_has_feature
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "has_feature" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Not yet implemented. Always returns @false@.
has_feature ::
              (VisualServer :< cls, Object :< cls) => cls -> Int -> IO Bool
has_feature cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_has_feature (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "has_feature" '[Int] (IO Bool)
         where
        nodeMethod = Godot.Core.VisualServer.has_feature

{-# NOINLINE bindVisualServer_has_os_feature #-}

-- | Returns @true@ if the OS supports a certain feature. Features might be @s3tc@, @etc@, @etc2@ and @pvrtc@.
bindVisualServer_has_os_feature :: MethodBind
bindVisualServer_has_os_feature
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "has_os_feature" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if the OS supports a certain feature. Features might be @s3tc@, @etc@, @etc2@ and @pvrtc@.
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

instance NodeMethod VisualServer "has_os_feature" '[GodotString]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisualServer.has_os_feature

{-# NOINLINE bindVisualServer_immediate_begin #-}

-- | Sets up @ImmediateGeometry@ internals to prepare for drawing. Equivalent to @method ImmediateGeometry.begin@.
bindVisualServer_immediate_begin :: MethodBind
bindVisualServer_immediate_begin
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_begin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets up @ImmediateGeometry@ internals to prepare for drawing. Equivalent to @method ImmediateGeometry.begin@.
immediate_begin ::
                  (VisualServer :< cls, Object :< cls) =>
                  cls -> Rid -> Int -> Maybe Rid -> IO ()
immediate_begin cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2, maybe VariantNil toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_begin
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "immediate_begin"
           '[Rid, Int, Maybe Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.immediate_begin

{-# NOINLINE bindVisualServer_immediate_clear #-}

-- | Clears everything that was set up between @method immediate_begin@ and @method immediate_end@. Equivalent to @method ImmediateGeometry.clear@.
bindVisualServer_immediate_clear :: MethodBind
bindVisualServer_immediate_clear
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_clear" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Clears everything that was set up between @method immediate_begin@ and @method immediate_end@. Equivalent to @method ImmediateGeometry.clear@.
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

instance NodeMethod VisualServer "immediate_clear" '[Rid] (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.immediate_clear

{-# NOINLINE bindVisualServer_immediate_color #-}

-- | Sets the color to be used with next vertex. Equivalent to @method ImmediateGeometry.set_color@.
bindVisualServer_immediate_color :: MethodBind
bindVisualServer_immediate_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color to be used with next vertex. Equivalent to @method ImmediateGeometry.set_color@.
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

instance NodeMethod VisualServer "immediate_color" '[Rid, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.immediate_color

{-# NOINLINE bindVisualServer_immediate_create #-}

-- | Creates an immediate geometry and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @immediate_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this immediate geometry to an instance using @method instance_set_base@ using the returned RID.
bindVisualServer_immediate_create :: MethodBind
bindVisualServer_immediate_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an immediate geometry and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @immediate_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this immediate geometry to an instance using @method instance_set_base@ using the returned RID.
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

instance NodeMethod VisualServer "immediate_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.immediate_create

{-# NOINLINE bindVisualServer_immediate_end #-}

-- | Ends drawing the @ImmediateGeometry@ and displays it. Equivalent to @method ImmediateGeometry.end@.
bindVisualServer_immediate_end :: MethodBind
bindVisualServer_immediate_end
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_end" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Ends drawing the @ImmediateGeometry@ and displays it. Equivalent to @method ImmediateGeometry.end@.
immediate_end ::
                (VisualServer :< cls, Object :< cls) => cls -> Rid -> IO ()
immediate_end cls arg1
  = withVariantArray [toVariant arg1]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_immediate_end (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "immediate_end" '[Rid] (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.immediate_end

{-# NOINLINE bindVisualServer_immediate_get_material #-}

-- | Returns the material assigned to the @ImmediateGeometry@.
bindVisualServer_immediate_get_material :: MethodBind
bindVisualServer_immediate_get_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_get_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the material assigned to the @ImmediateGeometry@.
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

instance NodeMethod VisualServer "immediate_get_material" '[Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.immediate_get_material

{-# NOINLINE bindVisualServer_immediate_normal #-}

-- | Sets the normal to be used with next vertex. Equivalent to @method ImmediateGeometry.set_normal@.
bindVisualServer_immediate_normal :: MethodBind
bindVisualServer_immediate_normal
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_normal" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the normal to be used with next vertex. Equivalent to @method ImmediateGeometry.set_normal@.
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

instance NodeMethod VisualServer "immediate_normal" '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.immediate_normal

{-# NOINLINE bindVisualServer_immediate_set_material #-}

-- | Sets the material to be used to draw the @ImmediateGeometry@.
bindVisualServer_immediate_set_material :: MethodBind
bindVisualServer_immediate_set_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_set_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the material to be used to draw the @ImmediateGeometry@.
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

instance NodeMethod VisualServer "immediate_set_material"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.immediate_set_material

{-# NOINLINE bindVisualServer_immediate_tangent #-}

-- | Sets the tangent to be used with next vertex. Equivalent to @method ImmediateGeometry.set_tangent@.
bindVisualServer_immediate_tangent :: MethodBind
bindVisualServer_immediate_tangent
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_tangent" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the tangent to be used with next vertex. Equivalent to @method ImmediateGeometry.set_tangent@.
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

instance NodeMethod VisualServer "immediate_tangent" '[Rid, Plane]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.immediate_tangent

{-# NOINLINE bindVisualServer_immediate_uv #-}

-- | Sets the UV to be used with next vertex. Equivalent to @method ImmediateGeometry.set_uv@.
bindVisualServer_immediate_uv :: MethodBind
bindVisualServer_immediate_uv
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_uv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the UV to be used with next vertex. Equivalent to @method ImmediateGeometry.set_uv@.
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

instance NodeMethod VisualServer "immediate_uv" '[Rid, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.immediate_uv

{-# NOINLINE bindVisualServer_immediate_uv2 #-}

-- | Sets the UV2 to be used with next vertex. Equivalent to @method ImmediateGeometry.set_uv2@.
bindVisualServer_immediate_uv2 :: MethodBind
bindVisualServer_immediate_uv2
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_uv2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the UV2 to be used with next vertex. Equivalent to @method ImmediateGeometry.set_uv2@.
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

instance NodeMethod VisualServer "immediate_uv2" '[Rid, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.immediate_uv2

{-# NOINLINE bindVisualServer_immediate_vertex #-}

-- | Adds the next vertex using the information provided in advance. Equivalent to @method ImmediateGeometry.add_vertex@.
bindVisualServer_immediate_vertex :: MethodBind
bindVisualServer_immediate_vertex
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_vertex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds the next vertex using the information provided in advance. Equivalent to @method ImmediateGeometry.add_vertex@.
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

instance NodeMethod VisualServer "immediate_vertex" '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.immediate_vertex

{-# NOINLINE bindVisualServer_immediate_vertex_2d #-}

-- | Adds the next vertex using the information provided in advance. This is a helper class that calls @method immediate_vertex@ under the hood. Equivalent to @method ImmediateGeometry.add_vertex@.
bindVisualServer_immediate_vertex_2d :: MethodBind
bindVisualServer_immediate_vertex_2d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "immediate_vertex_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds the next vertex using the information provided in advance. This is a helper class that calls @method immediate_vertex@ under the hood. Equivalent to @method ImmediateGeometry.add_vertex@.
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

instance NodeMethod VisualServer "immediate_vertex_2d"
           '[Rid, Vector2]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.immediate_vertex_2d

{-# NOINLINE bindVisualServer_init #-}

-- | Initializes the visual server. This function is called internally by platform-dependent code during engine initialization. If called from a running game, it will not do anything.
bindVisualServer_init :: MethodBind
bindVisualServer_init
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "init" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Initializes the visual server. This function is called internally by platform-dependent code during engine initialization. If called from a running game, it will not do anything.
init :: (VisualServer :< cls, Object :< cls) => cls -> IO ()
init cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_init (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "init" '[] (IO ()) where
        nodeMethod = Godot.Core.VisualServer.init

{-# NOINLINE bindVisualServer_instance_attach_object_instance_id
             #-}

-- | Attaches a unique Object ID to instance. Object ID must be attached to instance for proper culling with @method instances_cull_aabb@, @method instances_cull_convex@, and @method instances_cull_ray@.
bindVisualServer_instance_attach_object_instance_id :: MethodBind
bindVisualServer_instance_attach_object_instance_id
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_attach_object_instance_id" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Attaches a unique Object ID to instance. Object ID must be attached to instance for proper culling with @method instances_cull_aabb@, @method instances_cull_convex@, and @method instances_cull_ray@.
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

instance NodeMethod VisualServer
           "instance_attach_object_instance_id"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.instance_attach_object_instance_id

{-# NOINLINE bindVisualServer_instance_attach_skeleton #-}

-- | Attaches a skeleton to an instance. Removes the previous skeleton from the instance.
bindVisualServer_instance_attach_skeleton :: MethodBind
bindVisualServer_instance_attach_skeleton
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_attach_skeleton" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Attaches a skeleton to an instance. Removes the previous skeleton from the instance.
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

instance NodeMethod VisualServer "instance_attach_skeleton"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.instance_attach_skeleton

{-# NOINLINE bindVisualServer_instance_create #-}

-- | Creates a visual instance and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @instance_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				An instance is a way of placing a 3D object in the scenario. Objects like particles, meshes, and reflection probes need to be associated with an instance to be visible in the scenario using @method instance_set_base@.
bindVisualServer_instance_create :: MethodBind
bindVisualServer_instance_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a visual instance and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @instance_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				An instance is a way of placing a 3D object in the scenario. Objects like particles, meshes, and reflection probes need to be associated with an instance to be visible in the scenario using @method instance_set_base@.
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

instance NodeMethod VisualServer "instance_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.instance_create

{-# NOINLINE bindVisualServer_instance_create2 #-}

-- | Creates a visual instance, adds it to the VisualServer, and sets both base and scenario. It can be accessed with the RID that is returned. This RID will be used in all @instance_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_instance_create2 :: MethodBind
bindVisualServer_instance_create2
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_create2" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a visual instance, adds it to the VisualServer, and sets both base and scenario. It can be accessed with the RID that is returned. This RID will be used in all @instance_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
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

instance NodeMethod VisualServer "instance_create2" '[Rid, Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.instance_create2

{-# NOINLINE bindVisualServer_instance_geometry_set_as_instance_lod
             #-}

-- | Not implemented in Godot 3.x.
bindVisualServer_instance_geometry_set_as_instance_lod ::
                                                       MethodBind
bindVisualServer_instance_geometry_set_as_instance_lod
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_geometry_set_as_instance_lod" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Not implemented in Godot 3.x.
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

instance NodeMethod VisualServer
           "instance_geometry_set_as_instance_lod"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.instance_geometry_set_as_instance_lod

{-# NOINLINE bindVisualServer_instance_geometry_set_cast_shadows_setting
             #-}

-- | Sets the shadow casting setting to one of @enum ShadowCastingSetting@. Equivalent to @GeometryInstance.cast_shadow@.
bindVisualServer_instance_geometry_set_cast_shadows_setting ::
                                                            MethodBind
bindVisualServer_instance_geometry_set_cast_shadows_setting
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_geometry_set_cast_shadows_setting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the shadow casting setting to one of @enum ShadowCastingSetting@. Equivalent to @GeometryInstance.cast_shadow@.
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

instance NodeMethod VisualServer
           "instance_geometry_set_cast_shadows_setting"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.instance_geometry_set_cast_shadows_setting

{-# NOINLINE bindVisualServer_instance_geometry_set_draw_range #-}

-- | Not implemented in Godot 3.x.
bindVisualServer_instance_geometry_set_draw_range :: MethodBind
bindVisualServer_instance_geometry_set_draw_range
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_geometry_set_draw_range" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Not implemented in Godot 3.x.
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

instance NodeMethod VisualServer "instance_geometry_set_draw_range"
           '[Rid, Float, Float, Float, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.instance_geometry_set_draw_range

{-# NOINLINE bindVisualServer_instance_geometry_set_flag #-}

-- | Sets the flag for a given @enum InstanceFlags@. See @enum InstanceFlags@ for more details.
bindVisualServer_instance_geometry_set_flag :: MethodBind
bindVisualServer_instance_geometry_set_flag
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_geometry_set_flag" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the flag for a given @enum InstanceFlags@. See @enum InstanceFlags@ for more details.
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

instance NodeMethod VisualServer "instance_geometry_set_flag"
           '[Rid, Int, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.instance_geometry_set_flag

{-# NOINLINE bindVisualServer_instance_geometry_set_material_override
             #-}

-- | Sets a material that will override the material for all surfaces on the mesh associated with this instance. Equivalent to @GeometryInstance.material_override@.
bindVisualServer_instance_geometry_set_material_override ::
                                                         MethodBind
bindVisualServer_instance_geometry_set_material_override
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_geometry_set_material_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a material that will override the material for all surfaces on the mesh associated with this instance. Equivalent to @GeometryInstance.material_override@.
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

instance NodeMethod VisualServer
           "instance_geometry_set_material_override"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.instance_geometry_set_material_override

{-# NOINLINE bindVisualServer_instance_set_base #-}

-- | Sets the base of the instance. A base can be any of the 3D objects that are created in the VisualServer that can be displayed. For example, any of the light types, mesh, multimesh, immediate geometry, particle system, reflection probe, lightmap capture, and the GI probe are all types that can be set as the base of an instance in order to be displayed in the scenario.
bindVisualServer_instance_set_base :: MethodBind
bindVisualServer_instance_set_base
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_base" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the base of the instance. A base can be any of the 3D objects that are created in the VisualServer that can be displayed. For example, any of the light types, mesh, multimesh, immediate geometry, particle system, reflection probe, lightmap capture, and the GI probe are all types that can be set as the base of an instance in order to be displayed in the scenario.
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

instance NodeMethod VisualServer "instance_set_base" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.instance_set_base

{-# NOINLINE bindVisualServer_instance_set_blend_shape_weight #-}

-- | Sets the weight for a given blend shape associated with this instance.
bindVisualServer_instance_set_blend_shape_weight :: MethodBind
bindVisualServer_instance_set_blend_shape_weight
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_blend_shape_weight" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the weight for a given blend shape associated with this instance.
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

instance NodeMethod VisualServer "instance_set_blend_shape_weight"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.instance_set_blend_shape_weight

{-# NOINLINE bindVisualServer_instance_set_custom_aabb #-}

-- | Sets a custom AABB to use when culling objects from the view frustum. Equivalent to @method GeometryInstance.set_custom_aabb@.
bindVisualServer_instance_set_custom_aabb :: MethodBind
bindVisualServer_instance_set_custom_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a custom AABB to use when culling objects from the view frustum. Equivalent to @method GeometryInstance.set_custom_aabb@.
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

instance NodeMethod VisualServer "instance_set_custom_aabb"
           '[Rid, Aabb]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.instance_set_custom_aabb

{-# NOINLINE bindVisualServer_instance_set_exterior #-}

-- | Function not implemented in Godot 3.x.
bindVisualServer_instance_set_exterior :: MethodBind
bindVisualServer_instance_set_exterior
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_exterior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Function not implemented in Godot 3.x.
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

instance NodeMethod VisualServer "instance_set_exterior"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.instance_set_exterior

{-# NOINLINE bindVisualServer_instance_set_extra_visibility_margin
             #-}

-- | Sets a margin to increase the size of the AABB when culling objects from the view frustum. This allows you avoid culling objects that fall outside the view frustum. Equivalent to @GeometryInstance.extra_cull_margin@.
bindVisualServer_instance_set_extra_visibility_margin :: MethodBind
bindVisualServer_instance_set_extra_visibility_margin
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_extra_visibility_margin" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a margin to increase the size of the AABB when culling objects from the view frustum. This allows you avoid culling objects that fall outside the view frustum. Equivalent to @GeometryInstance.extra_cull_margin@.
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

instance NodeMethod VisualServer
           "instance_set_extra_visibility_margin"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.instance_set_extra_visibility_margin

{-# NOINLINE bindVisualServer_instance_set_layer_mask #-}

-- | Sets the render layers that this instance will be drawn to. Equivalent to @VisualInstance.layers@.
bindVisualServer_instance_set_layer_mask :: MethodBind
bindVisualServer_instance_set_layer_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_layer_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the render layers that this instance will be drawn to. Equivalent to @VisualInstance.layers@.
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

instance NodeMethod VisualServer "instance_set_layer_mask"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.instance_set_layer_mask

{-# NOINLINE bindVisualServer_instance_set_scenario #-}

-- | Sets the scenario that the instance is in. The scenario is the 3D world that the objects will be displayed in.
bindVisualServer_instance_set_scenario :: MethodBind
bindVisualServer_instance_set_scenario
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_scenario" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the scenario that the instance is in. The scenario is the 3D world that the objects will be displayed in.
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

instance NodeMethod VisualServer "instance_set_scenario"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.instance_set_scenario

{-# NOINLINE bindVisualServer_instance_set_surface_material #-}

-- | Sets the material of a specific surface. Equivalent to @method MeshInstance.set_surface_material@.
bindVisualServer_instance_set_surface_material :: MethodBind
bindVisualServer_instance_set_surface_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_surface_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the material of a specific surface. Equivalent to @method MeshInstance.set_surface_material@.
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

instance NodeMethod VisualServer "instance_set_surface_material"
           '[Rid, Int, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.instance_set_surface_material

{-# NOINLINE bindVisualServer_instance_set_transform #-}

-- | Sets the world space transform of the instance. Equivalent to @Spatial.transform@.
bindVisualServer_instance_set_transform :: MethodBind
bindVisualServer_instance_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the world space transform of the instance. Equivalent to @Spatial.transform@.
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

instance NodeMethod VisualServer "instance_set_transform"
           '[Rid, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.instance_set_transform

{-# NOINLINE bindVisualServer_instance_set_use_lightmap #-}

-- | Sets the lightmap to use with this instance.
bindVisualServer_instance_set_use_lightmap :: MethodBind
bindVisualServer_instance_set_use_lightmap
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_use_lightmap" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the lightmap to use with this instance.
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

instance NodeMethod VisualServer "instance_set_use_lightmap"
           '[Rid, Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.instance_set_use_lightmap

{-# NOINLINE bindVisualServer_instance_set_visible #-}

-- | Sets whether an instance is drawn or not. Equivalent to @Spatial.visible@.
bindVisualServer_instance_set_visible :: MethodBind
bindVisualServer_instance_set_visible
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instance_set_visible" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether an instance is drawn or not. Equivalent to @Spatial.visible@.
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

instance NodeMethod VisualServer "instance_set_visible"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.instance_set_visible

{-# NOINLINE bindVisualServer_instances_cull_aabb #-}

-- | Returns an array of object IDs intersecting with the provided AABB. Only visual 3D nodes are considered, such as @MeshInstance@ or @DirectionalLight@. Use @method @GDScript.instance_from_id@ to obtain the actual nodes. A scenario RID must be provided, which is available in the @World@ you want to query. This forces an update for all resources queued to update.
--   				__Warning:__ This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.
bindVisualServer_instances_cull_aabb :: MethodBind
bindVisualServer_instances_cull_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instances_cull_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of object IDs intersecting with the provided AABB. Only visual 3D nodes are considered, such as @MeshInstance@ or @DirectionalLight@. Use @method @GDScript.instance_from_id@ to obtain the actual nodes. A scenario RID must be provided, which is available in the @World@ you want to query. This forces an update for all resources queued to update.
--   				__Warning:__ This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.
instances_cull_aabb ::
                      (VisualServer :< cls, Object :< cls) =>
                      cls -> Aabb -> Maybe Rid -> IO Array
instances_cull_aabb cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe VariantNil toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instances_cull_aabb
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "instances_cull_aabb"
           '[Aabb, Maybe Rid]
           (IO Array)
         where
        nodeMethod = Godot.Core.VisualServer.instances_cull_aabb

{-# NOINLINE bindVisualServer_instances_cull_convex #-}

-- | Returns an array of object IDs intersecting with the provided convex shape. Only visual 3D nodes are considered, such as @MeshInstance@ or @DirectionalLight@. Use @method @GDScript.instance_from_id@ to obtain the actual nodes. A scenario RID must be provided, which is available in the @World@ you want to query. This forces an update for all resources queued to update.
--   				__Warning:__ This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.
bindVisualServer_instances_cull_convex :: MethodBind
bindVisualServer_instances_cull_convex
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instances_cull_convex" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of object IDs intersecting with the provided convex shape. Only visual 3D nodes are considered, such as @MeshInstance@ or @DirectionalLight@. Use @method @GDScript.instance_from_id@ to obtain the actual nodes. A scenario RID must be provided, which is available in the @World@ you want to query. This forces an update for all resources queued to update.
--   				__Warning:__ This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.
instances_cull_convex ::
                        (VisualServer :< cls, Object :< cls) =>
                        cls -> Array -> Maybe Rid -> IO Array
instances_cull_convex cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe VariantNil toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instances_cull_convex
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "instances_cull_convex"
           '[Array, Maybe Rid]
           (IO Array)
         where
        nodeMethod = Godot.Core.VisualServer.instances_cull_convex

{-# NOINLINE bindVisualServer_instances_cull_ray #-}

-- | Returns an array of object IDs intersecting with the provided 3D ray. Only visual 3D nodes are considered, such as @MeshInstance@ or @DirectionalLight@. Use @method @GDScript.instance_from_id@ to obtain the actual nodes. A scenario RID must be provided, which is available in the @World@ you want to query. This forces an update for all resources queued to update.
--   				__Warning:__ This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.
bindVisualServer_instances_cull_ray :: MethodBind
bindVisualServer_instances_cull_ray
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "instances_cull_ray" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns an array of object IDs intersecting with the provided 3D ray. Only visual 3D nodes are considered, such as @MeshInstance@ or @DirectionalLight@. Use @method @GDScript.instance_from_id@ to obtain the actual nodes. A scenario RID must be provided, which is available in the @World@ you want to query. This forces an update for all resources queued to update.
--   				__Warning:__ This function is primarily intended for editor usage. For in-game use cases, prefer physics collision.
instances_cull_ray ::
                     (VisualServer :< cls, Object :< cls) =>
                     cls -> Vector3 -> Vector3 -> Maybe Rid -> IO Array
instances_cull_ray cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2, maybe VariantNil toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_instances_cull_ray
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "instances_cull_ray"
           '[Vector3, Vector3, Maybe Rid]
           (IO Array)
         where
        nodeMethod = Godot.Core.VisualServer.instances_cull_ray

{-# NOINLINE bindVisualServer_light_directional_set_blend_splits
             #-}

-- | If @true@, this directional light will blend between shadow map splits resulting in a smoother transition between them. Equivalent to @DirectionalLight.directional_shadow_blend_splits@.
bindVisualServer_light_directional_set_blend_splits :: MethodBind
bindVisualServer_light_directional_set_blend_splits
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_directional_set_blend_splits" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, this directional light will blend between shadow map splits resulting in a smoother transition between them. Equivalent to @DirectionalLight.directional_shadow_blend_splits@.
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

instance NodeMethod VisualServer
           "light_directional_set_blend_splits"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.light_directional_set_blend_splits

{-# NOINLINE bindVisualServer_light_directional_set_shadow_depth_range_mode
             #-}

-- | Sets the shadow depth range mode for this directional light. Equivalent to @DirectionalLight.directional_shadow_depth_range@. See @enum LightDirectionalShadowDepthRangeMode@ for options.
bindVisualServer_light_directional_set_shadow_depth_range_mode ::
                                                               MethodBind
bindVisualServer_light_directional_set_shadow_depth_range_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_directional_set_shadow_depth_range_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the shadow depth range mode for this directional light. Equivalent to @DirectionalLight.directional_shadow_depth_range@. See @enum LightDirectionalShadowDepthRangeMode@ for options.
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

instance NodeMethod VisualServer
           "light_directional_set_shadow_depth_range_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.light_directional_set_shadow_depth_range_mode

{-# NOINLINE bindVisualServer_light_directional_set_shadow_mode #-}

-- | Sets the shadow mode for this directional light. Equivalent to @DirectionalLight.directional_shadow_mode@. See @enum LightDirectionalShadowMode@ for options.
bindVisualServer_light_directional_set_shadow_mode :: MethodBind
bindVisualServer_light_directional_set_shadow_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_directional_set_shadow_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the shadow mode for this directional light. Equivalent to @DirectionalLight.directional_shadow_mode@. See @enum LightDirectionalShadowMode@ for options.
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

instance NodeMethod VisualServer
           "light_directional_set_shadow_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.light_directional_set_shadow_mode

{-# NOINLINE bindVisualServer_light_omni_set_shadow_detail #-}

-- | Sets whether to use vertical or horizontal detail for this omni light. This can be used to alleviate artifacts in the shadow map. Equivalent to @OmniLight.omni_shadow_detail@.
bindVisualServer_light_omni_set_shadow_detail :: MethodBind
bindVisualServer_light_omni_set_shadow_detail
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_omni_set_shadow_detail" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether to use vertical or horizontal detail for this omni light. This can be used to alleviate artifacts in the shadow map. Equivalent to @OmniLight.omni_shadow_detail@.
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

instance NodeMethod VisualServer "light_omni_set_shadow_detail"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.light_omni_set_shadow_detail

{-# NOINLINE bindVisualServer_light_omni_set_shadow_mode #-}

-- | Sets whether to use a dual paraboloid or a cubemap for the shadow map. Dual paraboloid is faster but may suffer from artifacts. Equivalent to @OmniLight.omni_shadow_mode@.
bindVisualServer_light_omni_set_shadow_mode :: MethodBind
bindVisualServer_light_omni_set_shadow_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_omni_set_shadow_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether to use a dual paraboloid or a cubemap for the shadow map. Dual paraboloid is faster but may suffer from artifacts. Equivalent to @OmniLight.omni_shadow_mode@.
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

instance NodeMethod VisualServer "light_omni_set_shadow_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.light_omni_set_shadow_mode

{-# NOINLINE bindVisualServer_light_set_color #-}

-- | Sets the color of the light. Equivalent to @Light.light_color@.
bindVisualServer_light_set_color :: MethodBind
bindVisualServer_light_set_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color of the light. Equivalent to @Light.light_color@.
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

instance NodeMethod VisualServer "light_set_color" '[Rid, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.light_set_color

{-# NOINLINE bindVisualServer_light_set_cull_mask #-}

-- | Sets the cull mask for this Light. Lights only affect objects in the selected layers. Equivalent to @Light.light_cull_mask@.
bindVisualServer_light_set_cull_mask :: MethodBind
bindVisualServer_light_set_cull_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the cull mask for this Light. Lights only affect objects in the selected layers. Equivalent to @Light.light_cull_mask@.
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

instance NodeMethod VisualServer "light_set_cull_mask" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.light_set_cull_mask

{-# NOINLINE bindVisualServer_light_set_negative #-}

-- | If @true@, light will subtract light instead of adding light. Equivalent to @Light.light_negative@.
bindVisualServer_light_set_negative :: MethodBind
bindVisualServer_light_set_negative
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_negative" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, light will subtract light instead of adding light. Equivalent to @Light.light_negative@.
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

instance NodeMethod VisualServer "light_set_negative" '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.light_set_negative

{-# NOINLINE bindVisualServer_light_set_param #-}

-- | Sets the specified light parameter. See @enum LightParam@ for options. Equivalent to @method Light.set_param@.
bindVisualServer_light_set_param :: MethodBind
bindVisualServer_light_set_param
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the specified light parameter. See @enum LightParam@ for options. Equivalent to @method Light.set_param@.
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

instance NodeMethod VisualServer "light_set_param"
           '[Rid, Int, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.light_set_param

{-# NOINLINE bindVisualServer_light_set_projector #-}

-- | Not implemented in Godot 3.x.
bindVisualServer_light_set_projector :: MethodBind
bindVisualServer_light_set_projector
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_projector" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Not implemented in Godot 3.x.
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

instance NodeMethod VisualServer "light_set_projector" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.light_set_projector

{-# NOINLINE bindVisualServer_light_set_reverse_cull_face_mode #-}

-- | If @true@, reverses the backface culling of the mesh. This can be useful when you have a flat mesh that has a light behind it. If you need to cast a shadow on both sides of the mesh, set the mesh to use double sided shadows with @method instance_geometry_set_cast_shadows_setting@. Equivalent to @Light.shadow_reverse_cull_face@.
bindVisualServer_light_set_reverse_cull_face_mode :: MethodBind
bindVisualServer_light_set_reverse_cull_face_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_reverse_cull_face_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, reverses the backface culling of the mesh. This can be useful when you have a flat mesh that has a light behind it. If you need to cast a shadow on both sides of the mesh, set the mesh to use double sided shadows with @method instance_geometry_set_cast_shadows_setting@. Equivalent to @Light.shadow_reverse_cull_face@.
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

instance NodeMethod VisualServer "light_set_reverse_cull_face_mode"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.light_set_reverse_cull_face_mode

{-# NOINLINE bindVisualServer_light_set_shadow #-}

-- | If @true@, light will cast shadows. Equivalent to @Light.shadow_enabled@.
bindVisualServer_light_set_shadow :: MethodBind
bindVisualServer_light_set_shadow
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_shadow" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, light will cast shadows. Equivalent to @Light.shadow_enabled@.
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

instance NodeMethod VisualServer "light_set_shadow" '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.light_set_shadow

{-# NOINLINE bindVisualServer_light_set_shadow_color #-}

-- | Sets the color of the shadow cast by the light. Equivalent to @Light.shadow_color@.
bindVisualServer_light_set_shadow_color :: MethodBind
bindVisualServer_light_set_shadow_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_shadow_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color of the shadow cast by the light. Equivalent to @Light.shadow_color@.
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

instance NodeMethod VisualServer "light_set_shadow_color"
           '[Rid, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.light_set_shadow_color

{-# NOINLINE bindVisualServer_light_set_use_gi #-}

-- | Sets whether GI probes capture light information from this light.
bindVisualServer_light_set_use_gi :: MethodBind
bindVisualServer_light_set_use_gi
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "light_set_use_gi" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets whether GI probes capture light information from this light.
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

instance NodeMethod VisualServer "light_set_use_gi" '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.light_set_use_gi

{-# NOINLINE bindVisualServer_lightmap_capture_create #-}

-- | Creates a lightmap capture and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @lightmap_capture_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this lightmap capture to an instance using @method instance_set_base@ using the returned RID.
bindVisualServer_lightmap_capture_create :: MethodBind
bindVisualServer_lightmap_capture_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a lightmap capture and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @lightmap_capture_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this lightmap capture to an instance using @method instance_set_base@ using the returned RID.
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

instance NodeMethod VisualServer "lightmap_capture_create" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.lightmap_capture_create

{-# NOINLINE bindVisualServer_lightmap_capture_get_bounds #-}

-- | Returns the size of the lightmap capture area.
bindVisualServer_lightmap_capture_get_bounds :: MethodBind
bindVisualServer_lightmap_capture_get_bounds
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_get_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the size of the lightmap capture area.
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

instance NodeMethod VisualServer "lightmap_capture_get_bounds"
           '[Rid]
           (IO Aabb)
         where
        nodeMethod = Godot.Core.VisualServer.lightmap_capture_get_bounds

{-# NOINLINE bindVisualServer_lightmap_capture_get_energy #-}

-- | Returns the energy multiplier used by the lightmap capture.
bindVisualServer_lightmap_capture_get_energy :: MethodBind
bindVisualServer_lightmap_capture_get_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_get_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the energy multiplier used by the lightmap capture.
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

instance NodeMethod VisualServer "lightmap_capture_get_energy"
           '[Rid]
           (IO Float)
         where
        nodeMethod = Godot.Core.VisualServer.lightmap_capture_get_energy

{-# NOINLINE bindVisualServer_lightmap_capture_get_octree #-}

-- | Returns the octree used by the lightmap capture.
bindVisualServer_lightmap_capture_get_octree :: MethodBind
bindVisualServer_lightmap_capture_get_octree
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_get_octree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the octree used by the lightmap capture.
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

instance NodeMethod VisualServer "lightmap_capture_get_octree"
           '[Rid]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.VisualServer.lightmap_capture_get_octree

{-# NOINLINE bindVisualServer_lightmap_capture_get_octree_cell_subdiv
             #-}

-- | Returns the cell subdivision amount used by this lightmap capture's octree.
bindVisualServer_lightmap_capture_get_octree_cell_subdiv ::
                                                         MethodBind
bindVisualServer_lightmap_capture_get_octree_cell_subdiv
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_get_octree_cell_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cell subdivision amount used by this lightmap capture's octree.
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

instance NodeMethod VisualServer
           "lightmap_capture_get_octree_cell_subdiv"
           '[Rid]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualServer.lightmap_capture_get_octree_cell_subdiv

{-# NOINLINE bindVisualServer_lightmap_capture_get_octree_cell_transform
             #-}

-- | Returns the cell transform for this lightmap capture's octree.
bindVisualServer_lightmap_capture_get_octree_cell_transform ::
                                                            MethodBind
bindVisualServer_lightmap_capture_get_octree_cell_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_get_octree_cell_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the cell transform for this lightmap capture's octree.
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

instance NodeMethod VisualServer
           "lightmap_capture_get_octree_cell_transform"
           '[Rid]
           (IO Transform)
         where
        nodeMethod
          = Godot.Core.VisualServer.lightmap_capture_get_octree_cell_transform

{-# NOINLINE bindVisualServer_lightmap_capture_set_bounds #-}

-- | Sets the size of the area covered by the lightmap capture. Equivalent to @BakedLightmapData.bounds@.
bindVisualServer_lightmap_capture_set_bounds :: MethodBind
bindVisualServer_lightmap_capture_set_bounds
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_set_bounds" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the area covered by the lightmap capture. Equivalent to @BakedLightmapData.bounds@.
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

instance NodeMethod VisualServer "lightmap_capture_set_bounds"
           '[Rid, Aabb]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.lightmap_capture_set_bounds

{-# NOINLINE bindVisualServer_lightmap_capture_set_energy #-}

-- | Sets the energy multiplier for this lightmap capture. Equivalent to @BakedLightmapData.energy@.
bindVisualServer_lightmap_capture_set_energy :: MethodBind
bindVisualServer_lightmap_capture_set_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_set_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the energy multiplier for this lightmap capture. Equivalent to @BakedLightmapData.energy@.
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

instance NodeMethod VisualServer "lightmap_capture_set_energy"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.lightmap_capture_set_energy

{-# NOINLINE bindVisualServer_lightmap_capture_set_octree #-}

-- | Sets the octree to be used by this lightmap capture. This function is normally used by the @BakedLightmap@ node. Equivalent to @BakedLightmapData.octree@.
bindVisualServer_lightmap_capture_set_octree :: MethodBind
bindVisualServer_lightmap_capture_set_octree
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_set_octree" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the octree to be used by this lightmap capture. This function is normally used by the @BakedLightmap@ node. Equivalent to @BakedLightmapData.octree@.
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

instance NodeMethod VisualServer "lightmap_capture_set_octree"
           '[Rid, PoolByteArray]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.lightmap_capture_set_octree

{-# NOINLINE bindVisualServer_lightmap_capture_set_octree_cell_subdiv
             #-}

-- | Sets the subdivision level of this lightmap capture's octree. Equivalent to @BakedLightmapData.cell_subdiv@.
bindVisualServer_lightmap_capture_set_octree_cell_subdiv ::
                                                         MethodBind
bindVisualServer_lightmap_capture_set_octree_cell_subdiv
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_set_octree_cell_subdiv" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the subdivision level of this lightmap capture's octree. Equivalent to @BakedLightmapData.cell_subdiv@.
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

instance NodeMethod VisualServer
           "lightmap_capture_set_octree_cell_subdiv"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.lightmap_capture_set_octree_cell_subdiv

{-# NOINLINE bindVisualServer_lightmap_capture_set_octree_cell_transform
             #-}

-- | Sets the octree cell transform for this lightmap capture's octree. Equivalent to @BakedLightmapData.cell_space_transform@.
bindVisualServer_lightmap_capture_set_octree_cell_transform ::
                                                            MethodBind
bindVisualServer_lightmap_capture_set_octree_cell_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "lightmap_capture_set_octree_cell_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the octree cell transform for this lightmap capture's octree. Equivalent to @BakedLightmapData.cell_space_transform@.
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

instance NodeMethod VisualServer
           "lightmap_capture_set_octree_cell_transform"
           '[Rid, Transform]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.lightmap_capture_set_octree_cell_transform

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

instance NodeMethod VisualServer "make_sphere_mesh"
           '[Int, Int, Float]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.make_sphere_mesh

{-# NOINLINE bindVisualServer_material_create #-}

-- | Creates an empty material and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @material_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_material_create :: MethodBind
bindVisualServer_material_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an empty material and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @material_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
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

instance NodeMethod VisualServer "material_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.material_create

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

instance NodeMethod VisualServer "material_get_param"
           '[Rid, GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.VisualServer.material_get_param

{-# NOINLINE bindVisualServer_material_get_param_default #-}

-- | Returns the default value for the param if available. Otherwise returns an empty @Variant@.
bindVisualServer_material_get_param_default :: MethodBind
bindVisualServer_material_get_param_default
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_get_param_default" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the default value for the param if available. Otherwise returns an empty @Variant@.
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

instance NodeMethod VisualServer "material_get_param_default"
           '[Rid, GodotString]
           (IO GodotVariant)
         where
        nodeMethod = Godot.Core.VisualServer.material_get_param_default

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

instance NodeMethod VisualServer "material_get_shader" '[Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.material_get_shader

{-# NOINLINE bindVisualServer_material_set_line_width #-}

-- | Sets a material's line width.
bindVisualServer_material_set_line_width :: MethodBind
bindVisualServer_material_set_line_width
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_set_line_width" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a material's line width.
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

instance NodeMethod VisualServer "material_set_line_width"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.material_set_line_width

{-# NOINLINE bindVisualServer_material_set_next_pass #-}

-- | Sets an object's next material.
bindVisualServer_material_set_next_pass :: MethodBind
bindVisualServer_material_set_next_pass
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_set_next_pass" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets an object's next material.
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

instance NodeMethod VisualServer "material_set_next_pass"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.material_set_next_pass

{-# NOINLINE bindVisualServer_material_set_param #-}

-- | Sets a material's parameter.
bindVisualServer_material_set_param :: MethodBind
bindVisualServer_material_set_param
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "material_set_param" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a material's parameter.
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

instance NodeMethod VisualServer "material_set_param"
           '[Rid, GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.material_set_param

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

instance NodeMethod VisualServer "material_set_render_priority"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.material_set_render_priority

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

instance NodeMethod VisualServer "material_set_shader" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.material_set_shader

{-# NOINLINE bindVisualServer_mesh_add_surface_from_arrays #-}

-- | Adds a surface generated from the Arrays to a mesh. See @enum PrimitiveType@ constants for types.
bindVisualServer_mesh_add_surface_from_arrays :: MethodBind
bindVisualServer_mesh_add_surface_from_arrays
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_add_surface_from_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Adds a surface generated from the Arrays to a mesh. See @enum PrimitiveType@ constants for types.
mesh_add_surface_from_arrays ::
                               (VisualServer :< cls, Object :< cls) =>
                               cls -> Rid -> Int -> Array -> Maybe Array -> Maybe Int -> IO ()
mesh_add_surface_from_arrays cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       defaultedVariant VariantArray V.empty arg4,
       maybe (VariantInt (97280)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call
           bindVisualServer_mesh_add_surface_from_arrays
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "mesh_add_surface_from_arrays"
           '[Rid, Int, Array, Maybe Array, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.mesh_add_surface_from_arrays

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

instance NodeMethod VisualServer "mesh_clear" '[Rid] (IO ()) where
        nodeMethod = Godot.Core.VisualServer.mesh_clear

{-# NOINLINE bindVisualServer_mesh_create #-}

-- | Creates a new mesh and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @mesh_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this mesh to an instance using @method instance_set_base@ using the returned RID.
bindVisualServer_mesh_create :: MethodBind
bindVisualServer_mesh_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new mesh and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @mesh_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this mesh to an instance using @method instance_set_base@ using the returned RID.
mesh_create ::
              (VisualServer :< cls, Object :< cls) => cls -> IO Rid
mesh_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_mesh_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "mesh_create" '[] (IO Rid) where
        nodeMethod = Godot.Core.VisualServer.mesh_create

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

instance NodeMethod VisualServer "mesh_get_blend_shape_count"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_get_blend_shape_count

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

instance NodeMethod VisualServer "mesh_get_blend_shape_mode" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_get_blend_shape_mode

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

instance NodeMethod VisualServer "mesh_get_custom_aabb" '[Rid]
           (IO Aabb)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_get_custom_aabb

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

instance NodeMethod VisualServer "mesh_get_surface_count" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_get_surface_count

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

instance NodeMethod VisualServer "mesh_remove_surface" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.mesh_remove_surface

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

instance NodeMethod VisualServer "mesh_set_blend_shape_count"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.mesh_set_blend_shape_count

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

instance NodeMethod VisualServer "mesh_set_blend_shape_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.mesh_set_blend_shape_mode

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

instance NodeMethod VisualServer "mesh_set_custom_aabb"
           '[Rid, Aabb]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.mesh_set_custom_aabb

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

instance NodeMethod VisualServer "mesh_surface_get_aabb"
           '[Rid, Int]
           (IO Aabb)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_get_aabb

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

instance NodeMethod VisualServer "mesh_surface_get_array"
           '[Rid, Int]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_get_array

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

instance NodeMethod VisualServer "mesh_surface_get_array_index_len"
           '[Rid, Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualServer.mesh_surface_get_array_index_len

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

instance NodeMethod VisualServer "mesh_surface_get_array_len"
           '[Rid, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_get_array_len

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

instance NodeMethod VisualServer "mesh_surface_get_arrays"
           '[Rid, Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_get_arrays

{-# NOINLINE bindVisualServer_mesh_surface_get_blend_shape_arrays
             #-}

-- | Returns a mesh's surface's arrays for blend shapes.
bindVisualServer_mesh_surface_get_blend_shape_arrays :: MethodBind
bindVisualServer_mesh_surface_get_blend_shape_arrays
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_blend_shape_arrays" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a mesh's surface's arrays for blend shapes.
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

instance NodeMethod VisualServer
           "mesh_surface_get_blend_shape_arrays"
           '[Rid, Int]
           (IO Array)
         where
        nodeMethod
          = Godot.Core.VisualServer.mesh_surface_get_blend_shape_arrays

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

instance NodeMethod VisualServer "mesh_surface_get_format"
           '[Rid, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_get_format

{-# NOINLINE bindVisualServer_mesh_surface_get_format_offset #-}

-- | Function is unused in Godot 3.x.
bindVisualServer_mesh_surface_get_format_offset :: MethodBind
bindVisualServer_mesh_surface_get_format_offset
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_format_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Function is unused in Godot 3.x.
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

instance NodeMethod VisualServer "mesh_surface_get_format_offset"
           '[Int, Int, Int, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_get_format_offset

{-# NOINLINE bindVisualServer_mesh_surface_get_format_stride #-}

-- | Function is unused in Godot 3.x.
bindVisualServer_mesh_surface_get_format_stride :: MethodBind
bindVisualServer_mesh_surface_get_format_stride
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_get_format_stride" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Function is unused in Godot 3.x.
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

instance NodeMethod VisualServer "mesh_surface_get_format_stride"
           '[Int, Int, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_get_format_stride

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

instance NodeMethod VisualServer "mesh_surface_get_index_array"
           '[Rid, Int]
           (IO PoolByteArray)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_get_index_array

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

instance NodeMethod VisualServer "mesh_surface_get_material"
           '[Rid, Int]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_get_material

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

instance NodeMethod VisualServer "mesh_surface_get_primitive_type"
           '[Rid, Int]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualServer.mesh_surface_get_primitive_type

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

instance NodeMethod VisualServer "mesh_surface_get_skeleton_aabb"
           '[Rid, Int]
           (IO Array)
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_get_skeleton_aabb

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

instance NodeMethod VisualServer "mesh_surface_set_material"
           '[Rid, Int, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_set_material

{-# NOINLINE bindVisualServer_mesh_surface_update_region #-}

-- | Updates a specific region of a vertex buffer for the specified surface. Warning: this function alters the vertex buffer directly with no safety mechanisms, you can easily corrupt your mesh.
bindVisualServer_mesh_surface_update_region :: MethodBind
bindVisualServer_mesh_surface_update_region
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "mesh_surface_update_region" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Updates a specific region of a vertex buffer for the specified surface. Warning: this function alters the vertex buffer directly with no safety mechanisms, you can easily corrupt your mesh.
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

instance NodeMethod VisualServer "mesh_surface_update_region"
           '[Rid, Int, Int, PoolByteArray]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.mesh_surface_update_region

{-# NOINLINE bindVisualServer_multimesh_allocate #-}

-- | Allocates space for the multimesh data. Format parameters determine how the data will be stored by OpenGL. See @enum MultimeshTransformFormat@, @enum MultimeshColorFormat@, and @enum MultimeshCustomDataFormat@ for usage. Equivalent to @MultiMesh.instance_count@.
bindVisualServer_multimesh_allocate :: MethodBind
bindVisualServer_multimesh_allocate
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_allocate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allocates space for the multimesh data. Format parameters determine how the data will be stored by OpenGL. See @enum MultimeshTransformFormat@, @enum MultimeshColorFormat@, and @enum MultimeshCustomDataFormat@ for usage. Equivalent to @MultiMesh.instance_count@.
multimesh_allocate ::
                     (VisualServer :< cls, Object :< cls) =>
                     cls -> Rid -> Int -> Int -> Int -> Maybe Int -> IO ()
multimesh_allocate cls arg1 arg2 arg3 arg4 arg5
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       maybe (VariantInt (0)) toVariant arg5]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_multimesh_allocate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "multimesh_allocate"
           '[Rid, Int, Int, Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.multimesh_allocate

{-# NOINLINE bindVisualServer_multimesh_create #-}

-- | Creates a new multimesh on the VisualServer and returns an @RID@ handle. This RID will be used in all @multimesh_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this multimesh to an instance using @method instance_set_base@ using the returned RID.
bindVisualServer_multimesh_create :: MethodBind
bindVisualServer_multimesh_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new multimesh on the VisualServer and returns an @RID@ handle. This RID will be used in all @multimesh_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this multimesh to an instance using @method instance_set_base@ using the returned RID.
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

instance NodeMethod VisualServer "multimesh_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.multimesh_create

{-# NOINLINE bindVisualServer_multimesh_get_aabb #-}

-- | Calculates and returns the axis-aligned bounding box that encloses all instances within the multimesh.
bindVisualServer_multimesh_get_aabb :: MethodBind
bindVisualServer_multimesh_get_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_get_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calculates and returns the axis-aligned bounding box that encloses all instances within the multimesh.
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

instance NodeMethod VisualServer "multimesh_get_aabb" '[Rid]
           (IO Aabb)
         where
        nodeMethod = Godot.Core.VisualServer.multimesh_get_aabb

{-# NOINLINE bindVisualServer_multimesh_get_instance_count #-}

-- | Returns the number of instances allocated for this multimesh.
bindVisualServer_multimesh_get_instance_count :: MethodBind
bindVisualServer_multimesh_get_instance_count
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_get_instance_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of instances allocated for this multimesh.
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

instance NodeMethod VisualServer "multimesh_get_instance_count"
           '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.multimesh_get_instance_count

{-# NOINLINE bindVisualServer_multimesh_get_mesh #-}

-- | Returns the RID of the mesh that will be used in drawing this multimesh.
bindVisualServer_multimesh_get_mesh :: MethodBind
bindVisualServer_multimesh_get_mesh
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_get_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the RID of the mesh that will be used in drawing this multimesh.
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

instance NodeMethod VisualServer "multimesh_get_mesh" '[Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.multimesh_get_mesh

{-# NOINLINE bindVisualServer_multimesh_get_visible_instances #-}

-- | Returns the number of visible instances for this multimesh.
bindVisualServer_multimesh_get_visible_instances :: MethodBind
bindVisualServer_multimesh_get_visible_instances
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_get_visible_instances" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of visible instances for this multimesh.
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

instance NodeMethod VisualServer "multimesh_get_visible_instances"
           '[Rid]
           (IO Int)
         where
        nodeMethod
          = Godot.Core.VisualServer.multimesh_get_visible_instances

{-# NOINLINE bindVisualServer_multimesh_instance_get_color #-}

-- | Returns the color by which the specified instance will be modulated.
bindVisualServer_multimesh_instance_get_color :: MethodBind
bindVisualServer_multimesh_instance_get_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_get_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the color by which the specified instance will be modulated.
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

instance NodeMethod VisualServer "multimesh_instance_get_color"
           '[Rid, Int]
           (IO Color)
         where
        nodeMethod = Godot.Core.VisualServer.multimesh_instance_get_color

{-# NOINLINE bindVisualServer_multimesh_instance_get_custom_data
             #-}

-- | Returns the custom data associated with the specified instance.
bindVisualServer_multimesh_instance_get_custom_data :: MethodBind
bindVisualServer_multimesh_instance_get_custom_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_get_custom_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the custom data associated with the specified instance.
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

instance NodeMethod VisualServer
           "multimesh_instance_get_custom_data"
           '[Rid, Int]
           (IO Color)
         where
        nodeMethod
          = Godot.Core.VisualServer.multimesh_instance_get_custom_data

{-# NOINLINE bindVisualServer_multimesh_instance_get_transform #-}

-- | Returns the @Transform@ of the specified instance.
bindVisualServer_multimesh_instance_get_transform :: MethodBind
bindVisualServer_multimesh_instance_get_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Transform@ of the specified instance.
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

instance NodeMethod VisualServer "multimesh_instance_get_transform"
           '[Rid, Int]
           (IO Transform)
         where
        nodeMethod
          = Godot.Core.VisualServer.multimesh_instance_get_transform

{-# NOINLINE bindVisualServer_multimesh_instance_get_transform_2d
             #-}

-- | Returns the @Transform2D@ of the specified instance. For use when the multimesh is set to use 2D transforms.
bindVisualServer_multimesh_instance_get_transform_2d :: MethodBind
bindVisualServer_multimesh_instance_get_transform_2d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_get_transform_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Transform2D@ of the specified instance. For use when the multimesh is set to use 2D transforms.
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

instance NodeMethod VisualServer
           "multimesh_instance_get_transform_2d"
           '[Rid, Int]
           (IO Transform2d)
         where
        nodeMethod
          = Godot.Core.VisualServer.multimesh_instance_get_transform_2d

{-# NOINLINE bindVisualServer_multimesh_instance_set_color #-}

-- | Sets the color by which this instance will be modulated. Equivalent to @method MultiMesh.set_instance_color@.
bindVisualServer_multimesh_instance_set_color :: MethodBind
bindVisualServer_multimesh_instance_set_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_set_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the color by which this instance will be modulated. Equivalent to @method MultiMesh.set_instance_color@.
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

instance NodeMethod VisualServer "multimesh_instance_set_color"
           '[Rid, Int, Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.multimesh_instance_set_color

{-# NOINLINE bindVisualServer_multimesh_instance_set_custom_data
             #-}

-- | Sets the custom data for this instance. Custom data is passed as a @Color@, but is interpreted as a @vec4@ in the shader. Equivalent to @method MultiMesh.set_instance_custom_data@.
bindVisualServer_multimesh_instance_set_custom_data :: MethodBind
bindVisualServer_multimesh_instance_set_custom_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_set_custom_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the custom data for this instance. Custom data is passed as a @Color@, but is interpreted as a @vec4@ in the shader. Equivalent to @method MultiMesh.set_instance_custom_data@.
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

instance NodeMethod VisualServer
           "multimesh_instance_set_custom_data"
           '[Rid, Int, Color]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.multimesh_instance_set_custom_data

{-# NOINLINE bindVisualServer_multimesh_instance_set_transform #-}

-- | Sets the @Transform@ for this instance. Equivalent to @method MultiMesh.set_instance_transform@.
bindVisualServer_multimesh_instance_set_transform :: MethodBind
bindVisualServer_multimesh_instance_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Transform@ for this instance. Equivalent to @method MultiMesh.set_instance_transform@.
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

instance NodeMethod VisualServer "multimesh_instance_set_transform"
           '[Rid, Int, Transform]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.multimesh_instance_set_transform

{-# NOINLINE bindVisualServer_multimesh_instance_set_transform_2d
             #-}

-- | Sets the @Transform2D@ for this instance. For use when multimesh is used in 2D. Equivalent to @method MultiMesh.set_instance_transform_2d@.
bindVisualServer_multimesh_instance_set_transform_2d :: MethodBind
bindVisualServer_multimesh_instance_set_transform_2d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_instance_set_transform_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Transform2D@ for this instance. For use when multimesh is used in 2D. Equivalent to @method MultiMesh.set_instance_transform_2d@.
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

instance NodeMethod VisualServer
           "multimesh_instance_set_transform_2d"
           '[Rid, Int, Transform2d]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.multimesh_instance_set_transform_2d

{-# NOINLINE bindVisualServer_multimesh_set_as_bulk_array #-}

-- | Sets all data related to the instances in one go. This is especially useful when loading the data from disk or preparing the data from GDNative.
--   
--   				All data is packed in one large float array. An array may look like this: Transform for instance 1, color data for instance 1, custom data for instance 1, transform for instance 2, color data for instance 2, etc.
--   
--   				@Transform@ is stored as 12 floats, @Transform2D@ is stored as 8 floats, @COLOR_8BIT@ / @CUSTOM_DATA_8BIT@ is stored as 1 float (4 bytes as is) and @COLOR_FLOAT@ / @CUSTOM_DATA_FLOAT@ is stored as 4 floats.
bindVisualServer_multimesh_set_as_bulk_array :: MethodBind
bindVisualServer_multimesh_set_as_bulk_array
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_set_as_bulk_array" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets all data related to the instances in one go. This is especially useful when loading the data from disk or preparing the data from GDNative.
--   
--   				All data is packed in one large float array. An array may look like this: Transform for instance 1, color data for instance 1, custom data for instance 1, transform for instance 2, color data for instance 2, etc.
--   
--   				@Transform@ is stored as 12 floats, @Transform2D@ is stored as 8 floats, @COLOR_8BIT@ / @CUSTOM_DATA_8BIT@ is stored as 1 float (4 bytes as is) and @COLOR_FLOAT@ / @CUSTOM_DATA_FLOAT@ is stored as 4 floats.
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

instance NodeMethod VisualServer "multimesh_set_as_bulk_array"
           '[Rid, PoolRealArray]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.multimesh_set_as_bulk_array

{-# NOINLINE bindVisualServer_multimesh_set_mesh #-}

-- | Sets the mesh to be drawn by the multimesh. Equivalent to @MultiMesh.mesh@.
bindVisualServer_multimesh_set_mesh :: MethodBind
bindVisualServer_multimesh_set_mesh
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_set_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the mesh to be drawn by the multimesh. Equivalent to @MultiMesh.mesh@.
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

instance NodeMethod VisualServer "multimesh_set_mesh" '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.multimesh_set_mesh

{-# NOINLINE bindVisualServer_multimesh_set_visible_instances #-}

-- | Sets the number of instances visible at a given time. If -1, all instances that have been allocated are drawn. Equivalent to @MultiMesh.visible_instance_count@.
bindVisualServer_multimesh_set_visible_instances :: MethodBind
bindVisualServer_multimesh_set_visible_instances
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "multimesh_set_visible_instances" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the number of instances visible at a given time. If -1, all instances that have been allocated are drawn. Equivalent to @MultiMesh.visible_instance_count@.
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

instance NodeMethod VisualServer "multimesh_set_visible_instances"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.multimesh_set_visible_instances

{-# NOINLINE bindVisualServer_omni_light_create #-}

-- | Creates a new omni light and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID can be used in most @light_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this omni light to an instance using @method instance_set_base@ using the returned RID.
bindVisualServer_omni_light_create :: MethodBind
bindVisualServer_omni_light_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "omni_light_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a new omni light and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID can be used in most @light_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this omni light to an instance using @method instance_set_base@ using the returned RID.
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

instance NodeMethod VisualServer "omni_light_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.omni_light_create

{-# NOINLINE bindVisualServer_particles_create #-}

-- | Creates a particle system and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @particles_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach these particles to an instance using @method instance_set_base@ using the returned RID.
bindVisualServer_particles_create :: MethodBind
bindVisualServer_particles_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a particle system and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @particles_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach these particles to an instance using @method instance_set_base@ using the returned RID.
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

instance NodeMethod VisualServer "particles_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.particles_create

{-# NOINLINE bindVisualServer_particles_get_current_aabb #-}

-- | Calculates and returns the axis-aligned bounding box that contains all the particles. Equivalent to @method Particles.capture_aabb@.
bindVisualServer_particles_get_current_aabb :: MethodBind
bindVisualServer_particles_get_current_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_get_current_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Calculates and returns the axis-aligned bounding box that contains all the particles. Equivalent to @method Particles.capture_aabb@.
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

instance NodeMethod VisualServer "particles_get_current_aabb"
           '[Rid]
           (IO Aabb)
         where
        nodeMethod = Godot.Core.VisualServer.particles_get_current_aabb

{-# NOINLINE bindVisualServer_particles_get_emitting #-}

-- | Returns @true@ if particles are currently set to emitting.
bindVisualServer_particles_get_emitting :: MethodBind
bindVisualServer_particles_get_emitting
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_get_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if particles are currently set to emitting.
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

instance NodeMethod VisualServer "particles_get_emitting" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisualServer.particles_get_emitting

{-# NOINLINE bindVisualServer_particles_is_inactive #-}

-- | Returns @true@ if particles are not emitting and particles are set to inactive.
bindVisualServer_particles_is_inactive :: MethodBind
bindVisualServer_particles_is_inactive
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_is_inactive" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns @true@ if particles are not emitting and particles are set to inactive.
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

instance NodeMethod VisualServer "particles_is_inactive" '[Rid]
           (IO Bool)
         where
        nodeMethod = Godot.Core.VisualServer.particles_is_inactive

{-# NOINLINE bindVisualServer_particles_request_process #-}

-- | Add particle system to list of particle systems that need to be updated. Update will take place on the next frame, or on the next call to @method instances_cull_aabb@, @method instances_cull_convex@, or @method instances_cull_ray@.
bindVisualServer_particles_request_process :: MethodBind
bindVisualServer_particles_request_process
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_request_process" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Add particle system to list of particle systems that need to be updated. Update will take place on the next frame, or on the next call to @method instances_cull_aabb@, @method instances_cull_convex@, or @method instances_cull_ray@.
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

instance NodeMethod VisualServer "particles_request_process" '[Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_request_process

{-# NOINLINE bindVisualServer_particles_restart #-}

-- | Reset the particles on the next update. Equivalent to @method Particles.restart@.
bindVisualServer_particles_restart :: MethodBind
bindVisualServer_particles_restart
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_restart" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Reset the particles on the next update. Equivalent to @method Particles.restart@.
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

instance NodeMethod VisualServer "particles_restart" '[Rid] (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_restart

{-# NOINLINE bindVisualServer_particles_set_amount #-}

-- | Sets the number of particles to be drawn and allocates the memory for them. Equivalent to @Particles.amount@.
bindVisualServer_particles_set_amount :: MethodBind
bindVisualServer_particles_set_amount
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_amount" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the number of particles to be drawn and allocates the memory for them. Equivalent to @Particles.amount@.
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

instance NodeMethod VisualServer "particles_set_amount" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_amount

{-# NOINLINE bindVisualServer_particles_set_custom_aabb #-}

-- | Sets a custom axis-aligned bounding box for the particle system. Equivalent to @Particles.visibility_aabb@.
bindVisualServer_particles_set_custom_aabb :: MethodBind
bindVisualServer_particles_set_custom_aabb
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_custom_aabb" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a custom axis-aligned bounding box for the particle system. Equivalent to @Particles.visibility_aabb@.
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

instance NodeMethod VisualServer "particles_set_custom_aabb"
           '[Rid, Aabb]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_custom_aabb

{-# NOINLINE bindVisualServer_particles_set_draw_order #-}

-- | Sets the draw order of the particles to one of the named enums from @enum ParticlesDrawOrder@. See @enum ParticlesDrawOrder@ for options. Equivalent to @Particles.draw_order@.
bindVisualServer_particles_set_draw_order :: MethodBind
bindVisualServer_particles_set_draw_order
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_draw_order" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the draw order of the particles to one of the named enums from @enum ParticlesDrawOrder@. See @enum ParticlesDrawOrder@ for options. Equivalent to @Particles.draw_order@.
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

instance NodeMethod VisualServer "particles_set_draw_order"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_draw_order

{-# NOINLINE bindVisualServer_particles_set_draw_pass_mesh #-}

-- | Sets the mesh to be used for the specified draw pass. Equivalent to @Particles.draw_pass_1@, @Particles.draw_pass_2@, @Particles.draw_pass_3@, and @Particles.draw_pass_4@.
bindVisualServer_particles_set_draw_pass_mesh :: MethodBind
bindVisualServer_particles_set_draw_pass_mesh
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_draw_pass_mesh" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the mesh to be used for the specified draw pass. Equivalent to @Particles.draw_pass_1@, @Particles.draw_pass_2@, @Particles.draw_pass_3@, and @Particles.draw_pass_4@.
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

instance NodeMethod VisualServer "particles_set_draw_pass_mesh"
           '[Rid, Int, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_draw_pass_mesh

{-# NOINLINE bindVisualServer_particles_set_draw_passes #-}

-- | Sets the number of draw passes to use. Equivalent to @Particles.draw_passes@.
bindVisualServer_particles_set_draw_passes :: MethodBind
bindVisualServer_particles_set_draw_passes
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_draw_passes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the number of draw passes to use. Equivalent to @Particles.draw_passes@.
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

instance NodeMethod VisualServer "particles_set_draw_passes"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_draw_passes

{-# NOINLINE bindVisualServer_particles_set_emission_transform #-}

-- | Sets the @Transform@ that will be used by the particles when they first emit.
bindVisualServer_particles_set_emission_transform :: MethodBind
bindVisualServer_particles_set_emission_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_emission_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Transform@ that will be used by the particles when they first emit.
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

instance NodeMethod VisualServer "particles_set_emission_transform"
           '[Rid, Transform]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.particles_set_emission_transform

{-# NOINLINE bindVisualServer_particles_set_emitting #-}

-- | If @true@, particles will emit over time. Setting to false does not reset the particles, but only stops their emission. Equivalent to @Particles.emitting@.
bindVisualServer_particles_set_emitting :: MethodBind
bindVisualServer_particles_set_emitting
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_emitting" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, particles will emit over time. Setting to false does not reset the particles, but only stops their emission. Equivalent to @Particles.emitting@.
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

instance NodeMethod VisualServer "particles_set_emitting"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_emitting

{-# NOINLINE bindVisualServer_particles_set_explosiveness_ratio #-}

-- | Sets the explosiveness ratio. Equivalent to @Particles.explosiveness@.
bindVisualServer_particles_set_explosiveness_ratio :: MethodBind
bindVisualServer_particles_set_explosiveness_ratio
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_explosiveness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the explosiveness ratio. Equivalent to @Particles.explosiveness@.
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

instance NodeMethod VisualServer
           "particles_set_explosiveness_ratio"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.particles_set_explosiveness_ratio

{-# NOINLINE bindVisualServer_particles_set_fixed_fps #-}

-- | Sets the frame rate that the particle system rendering will be fixed to. Equivalent to @Particles.fixed_fps@.
bindVisualServer_particles_set_fixed_fps :: MethodBind
bindVisualServer_particles_set_fixed_fps
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_fixed_fps" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the frame rate that the particle system rendering will be fixed to. Equivalent to @Particles.fixed_fps@.
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

instance NodeMethod VisualServer "particles_set_fixed_fps"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_fixed_fps

{-# NOINLINE bindVisualServer_particles_set_fractional_delta #-}

-- | If @true@, uses fractional delta which smooths the movement of the particles. Equivalent to @Particles.fract_delta@.
bindVisualServer_particles_set_fractional_delta :: MethodBind
bindVisualServer_particles_set_fractional_delta
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_fractional_delta" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, uses fractional delta which smooths the movement of the particles. Equivalent to @Particles.fract_delta@.
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

instance NodeMethod VisualServer "particles_set_fractional_delta"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_fractional_delta

{-# NOINLINE bindVisualServer_particles_set_lifetime #-}

-- | Sets the lifetime of each particle in the system. Equivalent to @Particles.lifetime@.
bindVisualServer_particles_set_lifetime :: MethodBind
bindVisualServer_particles_set_lifetime
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_lifetime" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the lifetime of each particle in the system. Equivalent to @Particles.lifetime@.
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

instance NodeMethod VisualServer "particles_set_lifetime"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_lifetime

{-# NOINLINE bindVisualServer_particles_set_one_shot #-}

-- | If @true@, particles will emit once and then stop. Equivalent to @Particles.one_shot@.
bindVisualServer_particles_set_one_shot :: MethodBind
bindVisualServer_particles_set_one_shot
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_one_shot" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, particles will emit once and then stop. Equivalent to @Particles.one_shot@.
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

instance NodeMethod VisualServer "particles_set_one_shot"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_one_shot

{-# NOINLINE bindVisualServer_particles_set_pre_process_time #-}

-- | Sets the preprocess time for the particles animation. This lets you delay starting an animation until after the particles have begun emitting. Equivalent to @Particles.preprocess@.
bindVisualServer_particles_set_pre_process_time :: MethodBind
bindVisualServer_particles_set_pre_process_time
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_pre_process_time" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the preprocess time for the particles animation. This lets you delay starting an animation until after the particles have begun emitting. Equivalent to @Particles.preprocess@.
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

instance NodeMethod VisualServer "particles_set_pre_process_time"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_pre_process_time

{-# NOINLINE bindVisualServer_particles_set_process_material #-}

-- | Sets the material for processing the particles. Note: this is not the material used to draw the materials. Equivalent to @Particles.process_material@.
bindVisualServer_particles_set_process_material :: MethodBind
bindVisualServer_particles_set_process_material
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_process_material" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the material for processing the particles. Note: this is not the material used to draw the materials. Equivalent to @Particles.process_material@.
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

instance NodeMethod VisualServer "particles_set_process_material"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_process_material

{-# NOINLINE bindVisualServer_particles_set_randomness_ratio #-}

-- | Sets the emission randomness ratio. This randomizes the emission of particles within their phase. Equivalent to @Particles.randomness@.
bindVisualServer_particles_set_randomness_ratio :: MethodBind
bindVisualServer_particles_set_randomness_ratio
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_randomness_ratio" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the emission randomness ratio. This randomizes the emission of particles within their phase. Equivalent to @Particles.randomness@.
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

instance NodeMethod VisualServer "particles_set_randomness_ratio"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_randomness_ratio

{-# NOINLINE bindVisualServer_particles_set_speed_scale #-}

-- | Sets the speed scale of the particle system. Equivalent to @Particles.speed_scale@.
bindVisualServer_particles_set_speed_scale :: MethodBind
bindVisualServer_particles_set_speed_scale
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_speed_scale" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the speed scale of the particle system. Equivalent to @Particles.speed_scale@.
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

instance NodeMethod VisualServer "particles_set_speed_scale"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.particles_set_speed_scale

{-# NOINLINE bindVisualServer_particles_set_use_local_coordinates
             #-}

-- | If @true@, particles use local coordinates. If @false@ they use global coordinates. Equivalent to @Particles.local_coords@.
bindVisualServer_particles_set_use_local_coordinates :: MethodBind
bindVisualServer_particles_set_use_local_coordinates
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "particles_set_use_local_coordinates" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, particles use local coordinates. If @false@ they use global coordinates. Equivalent to @Particles.local_coords@.
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

instance NodeMethod VisualServer
           "particles_set_use_local_coordinates"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.particles_set_use_local_coordinates

{-# NOINLINE bindVisualServer_reflection_probe_create #-}

-- | Creates a reflection probe and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @reflection_probe_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this reflection probe to an instance using @method instance_set_base@ using the returned RID.
bindVisualServer_reflection_probe_create :: MethodBind
bindVisualServer_reflection_probe_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a reflection probe and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @reflection_probe_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this reflection probe to an instance using @method instance_set_base@ using the returned RID.
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

instance NodeMethod VisualServer "reflection_probe_create" '[]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.reflection_probe_create

{-# NOINLINE bindVisualServer_reflection_probe_set_as_interior #-}

-- | If @true@, reflections will ignore sky contribution. Equivalent to @ReflectionProbe.interior_enable@.
bindVisualServer_reflection_probe_set_as_interior :: MethodBind
bindVisualServer_reflection_probe_set_as_interior
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_as_interior" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, reflections will ignore sky contribution. Equivalent to @ReflectionProbe.interior_enable@.
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

instance NodeMethod VisualServer "reflection_probe_set_as_interior"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.reflection_probe_set_as_interior

{-# NOINLINE bindVisualServer_reflection_probe_set_cull_mask #-}

-- | Sets the render cull mask for this reflection probe. Only instances with a matching cull mask will be rendered by this probe. Equivalent to @ReflectionProbe.cull_mask@.
bindVisualServer_reflection_probe_set_cull_mask :: MethodBind
bindVisualServer_reflection_probe_set_cull_mask
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_cull_mask" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the render cull mask for this reflection probe. Only instances with a matching cull mask will be rendered by this probe. Equivalent to @ReflectionProbe.cull_mask@.
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

instance NodeMethod VisualServer "reflection_probe_set_cull_mask"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.reflection_probe_set_cull_mask

{-# NOINLINE bindVisualServer_reflection_probe_set_enable_box_projection
             #-}

-- | If @true@, uses box projection. This can make reflections look more correct in certain situations. Equivalent to @ReflectionProbe.box_projection@.
bindVisualServer_reflection_probe_set_enable_box_projection ::
                                                            MethodBind
bindVisualServer_reflection_probe_set_enable_box_projection
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_enable_box_projection" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, uses box projection. This can make reflections look more correct in certain situations. Equivalent to @ReflectionProbe.box_projection@.
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

instance NodeMethod VisualServer
           "reflection_probe_set_enable_box_projection"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.reflection_probe_set_enable_box_projection

{-# NOINLINE bindVisualServer_reflection_probe_set_enable_shadows
             #-}

-- | If @true@, computes shadows in the reflection probe. This makes the reflection much slower to compute. Equivalent to @ReflectionProbe.enable_shadows@.
bindVisualServer_reflection_probe_set_enable_shadows :: MethodBind
bindVisualServer_reflection_probe_set_enable_shadows
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_enable_shadows" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, computes shadows in the reflection probe. This makes the reflection much slower to compute. Equivalent to @ReflectionProbe.enable_shadows@.
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

instance NodeMethod VisualServer
           "reflection_probe_set_enable_shadows"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.reflection_probe_set_enable_shadows

{-# NOINLINE bindVisualServer_reflection_probe_set_extents #-}

-- | Sets the size of the area that the reflection probe will capture. Equivalent to @ReflectionProbe.extents@.
bindVisualServer_reflection_probe_set_extents :: MethodBind
bindVisualServer_reflection_probe_set_extents
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_extents" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the area that the reflection probe will capture. Equivalent to @ReflectionProbe.extents@.
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

instance NodeMethod VisualServer "reflection_probe_set_extents"
           '[Rid, Vector3]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.reflection_probe_set_extents

{-# NOINLINE bindVisualServer_reflection_probe_set_intensity #-}

-- | Sets the intensity of the reflection probe. Intensity modulates the strength of the reflection. Equivalent to @ReflectionProbe.intensity@.
bindVisualServer_reflection_probe_set_intensity :: MethodBind
bindVisualServer_reflection_probe_set_intensity
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_intensity" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the intensity of the reflection probe. Intensity modulates the strength of the reflection. Equivalent to @ReflectionProbe.intensity@.
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

instance NodeMethod VisualServer "reflection_probe_set_intensity"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.reflection_probe_set_intensity

{-# NOINLINE bindVisualServer_reflection_probe_set_interior_ambient
             #-}

-- | Sets the ambient light color for this reflection probe when set to interior mode. Equivalent to @ReflectionProbe.interior_ambient_color@.
bindVisualServer_reflection_probe_set_interior_ambient ::
                                                       MethodBind
bindVisualServer_reflection_probe_set_interior_ambient
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_interior_ambient" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the ambient light color for this reflection probe when set to interior mode. Equivalent to @ReflectionProbe.interior_ambient_color@.
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

instance NodeMethod VisualServer
           "reflection_probe_set_interior_ambient"
           '[Rid, Color]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.reflection_probe_set_interior_ambient

{-# NOINLINE bindVisualServer_reflection_probe_set_interior_ambient_energy
             #-}

-- | Sets the energy multiplier for this reflection probes ambient light contribution when set to interior mode. Equivalent to @ReflectionProbe.interior_ambient_energy@.
bindVisualServer_reflection_probe_set_interior_ambient_energy ::
                                                              MethodBind
bindVisualServer_reflection_probe_set_interior_ambient_energy
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_interior_ambient_energy" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the energy multiplier for this reflection probes ambient light contribution when set to interior mode. Equivalent to @ReflectionProbe.interior_ambient_energy@.
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

instance NodeMethod VisualServer
           "reflection_probe_set_interior_ambient_energy"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.reflection_probe_set_interior_ambient_energy

{-# NOINLINE bindVisualServer_reflection_probe_set_interior_ambient_probe_contribution
             #-}

-- | Sets the contribution value for how much the reflection affects the ambient light for this reflection probe when set to interior mode. Useful so that ambient light matches the color of the room. Equivalent to @ReflectionProbe.interior_ambient_contrib@.
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

-- | Sets the contribution value for how much the reflection affects the ambient light for this reflection probe when set to interior mode. Useful so that ambient light matches the color of the room. Equivalent to @ReflectionProbe.interior_ambient_contrib@.
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

instance NodeMethod VisualServer
           "reflection_probe_set_interior_ambient_probe_contribution"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.reflection_probe_set_interior_ambient_probe_contribution

{-# NOINLINE bindVisualServer_reflection_probe_set_max_distance #-}

-- | Sets the max distance away from the probe an object can be before it is culled. Equivalent to @ReflectionProbe.max_distance@.
bindVisualServer_reflection_probe_set_max_distance :: MethodBind
bindVisualServer_reflection_probe_set_max_distance
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_max_distance" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the max distance away from the probe an object can be before it is culled. Equivalent to @ReflectionProbe.max_distance@.
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

instance NodeMethod VisualServer
           "reflection_probe_set_max_distance"
           '[Rid, Float]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.reflection_probe_set_max_distance

{-# NOINLINE bindVisualServer_reflection_probe_set_origin_offset
             #-}

-- | Sets the origin offset to be used when this reflection probe is in box project mode. Equivalent to @ReflectionProbe.origin_offset@.
bindVisualServer_reflection_probe_set_origin_offset :: MethodBind
bindVisualServer_reflection_probe_set_origin_offset
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_origin_offset" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the origin offset to be used when this reflection probe is in box project mode. Equivalent to @ReflectionProbe.origin_offset@.
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

instance NodeMethod VisualServer
           "reflection_probe_set_origin_offset"
           '[Rid, Vector3]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.reflection_probe_set_origin_offset

{-# NOINLINE bindVisualServer_reflection_probe_set_update_mode #-}

-- | Sets how often the reflection probe updates. Can either be once or every frame. See @enum ReflectionProbeUpdateMode@ for options.
bindVisualServer_reflection_probe_set_update_mode :: MethodBind
bindVisualServer_reflection_probe_set_update_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "reflection_probe_set_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets how often the reflection probe updates. Can either be once or every frame. See @enum ReflectionProbeUpdateMode@ for options.
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

instance NodeMethod VisualServer "reflection_probe_set_update_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.reflection_probe_set_update_mode

{-# NOINLINE bindVisualServer_request_frame_drawn_callback #-}

-- | Schedules a callback to the corresponding named @method@ on @where@ after a frame has been drawn.
--   				The callback method must use only 1 argument which will be called with @userdata@.
bindVisualServer_request_frame_drawn_callback :: MethodBind
bindVisualServer_request_frame_drawn_callback
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "request_frame_drawn_callback" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Schedules a callback to the corresponding named @method@ on @where@ after a frame has been drawn.
--   				The callback method must use only 1 argument which will be called with @userdata@.
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

instance NodeMethod VisualServer "request_frame_drawn_callback"
           '[Object, GodotString, GodotVariant]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.request_frame_drawn_callback

{-# NOINLINE bindVisualServer_scenario_create #-}

-- | Creates a scenario and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @scenario_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				The scenario is the 3D world that all the visual instances exist in.
bindVisualServer_scenario_create :: MethodBind
bindVisualServer_scenario_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "scenario_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a scenario and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @scenario_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				The scenario is the 3D world that all the visual instances exist in.
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

instance NodeMethod VisualServer "scenario_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.scenario_create

{-# NOINLINE bindVisualServer_scenario_set_debug #-}

-- | Sets the @enum ScenarioDebugMode@ for this scenario. See @enum ScenarioDebugMode@ for options.
bindVisualServer_scenario_set_debug :: MethodBind
bindVisualServer_scenario_set_debug
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "scenario_set_debug" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @enum ScenarioDebugMode@ for this scenario. See @enum ScenarioDebugMode@ for options.
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

instance NodeMethod VisualServer "scenario_set_debug" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.scenario_set_debug

{-# NOINLINE bindVisualServer_scenario_set_environment #-}

-- | Sets the environment that will be used with this scenario.
bindVisualServer_scenario_set_environment :: MethodBind
bindVisualServer_scenario_set_environment
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "scenario_set_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the environment that will be used with this scenario.
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

instance NodeMethod VisualServer "scenario_set_environment"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.scenario_set_environment

{-# NOINLINE bindVisualServer_scenario_set_fallback_environment #-}

-- | Sets the fallback environment to be used by this scenario. The fallback environment is used if no environment is set. Internally, this is used by the editor to provide a default environment.
bindVisualServer_scenario_set_fallback_environment :: MethodBind
bindVisualServer_scenario_set_fallback_environment
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "scenario_set_fallback_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the fallback environment to be used by this scenario. The fallback environment is used if no environment is set. Internally, this is used by the editor to provide a default environment.
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

instance NodeMethod VisualServer
           "scenario_set_fallback_environment"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.scenario_set_fallback_environment

{-# NOINLINE bindVisualServer_scenario_set_reflection_atlas_size
             #-}

-- | Sets the size of the reflection atlas shared by all reflection probes in this scenario.
bindVisualServer_scenario_set_reflection_atlas_size :: MethodBind
bindVisualServer_scenario_set_reflection_atlas_size
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "scenario_set_reflection_atlas_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the reflection atlas shared by all reflection probes in this scenario.
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

instance NodeMethod VisualServer
           "scenario_set_reflection_atlas_size"
           '[Rid, Int, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.scenario_set_reflection_atlas_size

{-# NOINLINE bindVisualServer_set_boot_image #-}

-- | Sets a boot image. The color defines the background color. If @scale@ is @true@, the image will be scaled to fit the screen size. If @use_filter@ is @true@, the image will be scaled with linear interpolation. If @use_filter@ is @false@, the image will be scaled with nearest-neighbor interpolation.
bindVisualServer_set_boot_image :: MethodBind
bindVisualServer_set_boot_image
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "set_boot_image" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a boot image. The color defines the background color. If @scale@ is @true@, the image will be scaled to fit the screen size. If @use_filter@ is @true@, the image will be scaled with linear interpolation. If @use_filter@ is @false@, the image will be scaled with nearest-neighbor interpolation.
set_boot_image ::
                 (VisualServer :< cls, Object :< cls) =>
                 cls -> Image -> Color -> Bool -> Maybe Bool -> IO ()
set_boot_image cls arg1 arg2 arg3 arg4
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3,
       maybe (VariantBool True) toVariant arg4]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_set_boot_image (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "set_boot_image"
           '[Image, Color, Bool, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.set_boot_image

{-# NOINLINE bindVisualServer_set_debug_generate_wireframes #-}

-- | If @true@, the engine will generate wireframes for use with the wireframe debug mode.
bindVisualServer_set_debug_generate_wireframes :: MethodBind
bindVisualServer_set_debug_generate_wireframes
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "set_debug_generate_wireframes" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the engine will generate wireframes for use with the wireframe debug mode.
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

instance NodeMethod VisualServer "set_debug_generate_wireframes"
           '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.set_debug_generate_wireframes

{-# NOINLINE bindVisualServer_set_default_clear_color #-}

-- | Sets the default clear color which is used when a specific clear color has not been selected.
bindVisualServer_set_default_clear_color :: MethodBind
bindVisualServer_set_default_clear_color
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "set_default_clear_color" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the default clear color which is used when a specific clear color has not been selected.
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

instance NodeMethod VisualServer "set_default_clear_color" '[Color]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.set_default_clear_color

{-# NOINLINE bindVisualServer_shader_create #-}

-- | Creates an empty shader and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @shader_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_shader_create :: MethodBind
bindVisualServer_shader_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "shader_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an empty shader and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @shader_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
shader_create ::
                (VisualServer :< cls, Object :< cls) => cls -> IO Rid
shader_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_shader_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "shader_create" '[] (IO Rid) where
        nodeMethod = Godot.Core.VisualServer.shader_create

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

instance NodeMethod VisualServer "shader_get_code" '[Rid]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualServer.shader_get_code

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

instance NodeMethod VisualServer "shader_get_default_texture_param"
           '[Rid, GodotString]
           (IO Rid)
         where
        nodeMethod
          = Godot.Core.VisualServer.shader_get_default_texture_param

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

instance NodeMethod VisualServer "shader_get_param_list" '[Rid]
           (IO Array)
         where
        nodeMethod = Godot.Core.VisualServer.shader_get_param_list

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

instance NodeMethod VisualServer "shader_set_code"
           '[Rid, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.shader_set_code

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

instance NodeMethod VisualServer "shader_set_default_texture_param"
           '[Rid, GodotString, Rid]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.shader_set_default_texture_param

{-# NOINLINE bindVisualServer_skeleton_allocate #-}

-- | Allocates the GPU buffers for this skeleton.
bindVisualServer_skeleton_allocate :: MethodBind
bindVisualServer_skeleton_allocate
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_allocate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allocates the GPU buffers for this skeleton.
skeleton_allocate ::
                    (VisualServer :< cls, Object :< cls) =>
                    cls -> Rid -> Int -> Maybe Bool -> IO ()
skeleton_allocate cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantBool False) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_skeleton_allocate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "skeleton_allocate"
           '[Rid, Int, Maybe Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.skeleton_allocate

{-# NOINLINE bindVisualServer_skeleton_bone_get_transform #-}

-- | Returns the @Transform@ set for a specific bone of this skeleton.
bindVisualServer_skeleton_bone_get_transform :: MethodBind
bindVisualServer_skeleton_bone_get_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_bone_get_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Transform@ set for a specific bone of this skeleton.
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

instance NodeMethod VisualServer "skeleton_bone_get_transform"
           '[Rid, Int]
           (IO Transform)
         where
        nodeMethod = Godot.Core.VisualServer.skeleton_bone_get_transform

{-# NOINLINE bindVisualServer_skeleton_bone_get_transform_2d #-}

-- | Returns the @Transform2D@ set for a specific bone of this skeleton.
bindVisualServer_skeleton_bone_get_transform_2d :: MethodBind
bindVisualServer_skeleton_bone_get_transform_2d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_bone_get_transform_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the @Transform2D@ set for a specific bone of this skeleton.
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

instance NodeMethod VisualServer "skeleton_bone_get_transform_2d"
           '[Rid, Int]
           (IO Transform2d)
         where
        nodeMethod = Godot.Core.VisualServer.skeleton_bone_get_transform_2d

{-# NOINLINE bindVisualServer_skeleton_bone_set_transform #-}

-- | Sets the @Transform@ for a specific bone of this skeleton.
bindVisualServer_skeleton_bone_set_transform :: MethodBind
bindVisualServer_skeleton_bone_set_transform
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_bone_set_transform" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Transform@ for a specific bone of this skeleton.
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

instance NodeMethod VisualServer "skeleton_bone_set_transform"
           '[Rid, Int, Transform]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.skeleton_bone_set_transform

{-# NOINLINE bindVisualServer_skeleton_bone_set_transform_2d #-}

-- | Sets the @Transform2D@ for a specific bone of this skeleton.
bindVisualServer_skeleton_bone_set_transform_2d :: MethodBind
bindVisualServer_skeleton_bone_set_transform_2d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_bone_set_transform_2d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the @Transform2D@ for a specific bone of this skeleton.
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

instance NodeMethod VisualServer "skeleton_bone_set_transform_2d"
           '[Rid, Int, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.skeleton_bone_set_transform_2d

{-# NOINLINE bindVisualServer_skeleton_create #-}

-- | Creates a skeleton and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @skeleton_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_skeleton_create :: MethodBind
bindVisualServer_skeleton_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a skeleton and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @skeleton_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
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

instance NodeMethod VisualServer "skeleton_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.skeleton_create

{-# NOINLINE bindVisualServer_skeleton_get_bone_count #-}

-- | Returns the number of bones allocated for this skeleton.
bindVisualServer_skeleton_get_bone_count :: MethodBind
bindVisualServer_skeleton_get_bone_count
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "skeleton_get_bone_count" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the number of bones allocated for this skeleton.
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

instance NodeMethod VisualServer "skeleton_get_bone_count" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.skeleton_get_bone_count

{-# NOINLINE bindVisualServer_sky_create #-}

-- | Creates an empty sky and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @sky_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_sky_create :: MethodBind
bindVisualServer_sky_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "sky_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an empty sky and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @sky_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
sky_create :: (VisualServer :< cls, Object :< cls) => cls -> IO Rid
sky_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_sky_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "sky_create" '[] (IO Rid) where
        nodeMethod = Godot.Core.VisualServer.sky_create

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

instance NodeMethod VisualServer "sky_set_texture" '[Rid, Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.sky_set_texture

{-# NOINLINE bindVisualServer_spot_light_create #-}

-- | Creates a spot light and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID can be used in most @light_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this spot light to an instance using @method instance_set_base@ using the returned RID.
bindVisualServer_spot_light_create :: MethodBind
bindVisualServer_spot_light_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "spot_light_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates a spot light and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID can be used in most @light_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
--   				To place in a scene, attach this spot light to an instance using @method instance_set_base@ using the returned RID.
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

instance NodeMethod VisualServer "spot_light_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.spot_light_create

{-# NOINLINE bindVisualServer_sync #-}

-- | Not implemented in Godot 3.x.
bindVisualServer_sync :: MethodBind
bindVisualServer_sync
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "sync" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Not implemented in Godot 3.x.
sync :: (VisualServer :< cls, Object :< cls) => cls -> IO ()
sync cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_sync (upcast cls) arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "sync" '[] (IO ()) where
        nodeMethod = Godot.Core.VisualServer.sync

{-# NOINLINE bindVisualServer_texture_allocate #-}

-- | Allocates the GPU memory for the texture.
bindVisualServer_texture_allocate :: MethodBind
bindVisualServer_texture_allocate
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_allocate" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Allocates the GPU memory for the texture.
texture_allocate ::
                   (VisualServer :< cls, Object :< cls) =>
                   cls -> Rid -> Int -> Int -> Int -> Int -> Int -> Maybe Int -> IO ()
texture_allocate cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6,
       maybe (VariantInt (7)) toVariant arg7]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_allocate
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "texture_allocate"
           '[Rid, Int, Int, Int, Int, Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.texture_allocate

{-# NOINLINE bindVisualServer_texture_bind #-}

-- | Binds the texture to a texture slot.
bindVisualServer_texture_bind :: MethodBind
bindVisualServer_texture_bind
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_bind" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Binds the texture to a texture slot.
texture_bind ::
               (VisualServer :< cls, Object :< cls) => cls -> Rid -> Int -> IO ()
texture_bind cls arg1 arg2
  = withVariantArray [toVariant arg1, toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_bind (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "texture_bind" '[Rid, Int] (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.texture_bind

{-# NOINLINE bindVisualServer_texture_create #-}

-- | Creates an empty texture and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @texture_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_texture_create :: MethodBind
bindVisualServer_texture_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an empty texture and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @texture_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
texture_create ::
                 (VisualServer :< cls, Object :< cls) => cls -> IO Rid
texture_create cls
  = withVariantArray []
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_create (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "texture_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.texture_create

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
                            cls -> Image -> Maybe Int -> IO Rid
texture_create_from_image cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (7)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_create_from_image
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "texture_create_from_image"
           '[Image, Maybe Int]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.texture_create_from_image

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

instance NodeMethod VisualServer "texture_debug_usage" '[]
           (IO Array)
         where
        nodeMethod = Godot.Core.VisualServer.texture_debug_usage

{-# NOINLINE bindVisualServer_texture_get_data #-}

-- | Returns a copy of a texture's image unless it's a CubeMap, in which case it returns the @RID@ of the image at one of the cubes sides.
bindVisualServer_texture_get_data :: MethodBind
bindVisualServer_texture_get_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a copy of a texture's image unless it's a CubeMap, in which case it returns the @RID@ of the image at one of the cubes sides.
texture_get_data ::
                   (VisualServer :< cls, Object :< cls) =>
                   cls -> Rid -> Maybe Int -> IO Image
texture_get_data cls arg1 arg2
  = withVariantArray
      [toVariant arg1, maybe (VariantInt (0)) toVariant arg2]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_get_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "texture_get_data"
           '[Rid, Maybe Int]
           (IO Image)
         where
        nodeMethod = Godot.Core.VisualServer.texture_get_data

{-# NOINLINE bindVisualServer_texture_get_depth #-}

-- | Returns the depth of the texture.
bindVisualServer_texture_get_depth :: MethodBind
bindVisualServer_texture_get_depth
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_depth" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the depth of the texture.
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

instance NodeMethod VisualServer "texture_get_depth" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.texture_get_depth

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

instance NodeMethod VisualServer "texture_get_flags" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.texture_get_flags

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

instance NodeMethod VisualServer "texture_get_format" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.texture_get_format

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

instance NodeMethod VisualServer "texture_get_height" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.texture_get_height

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

instance NodeMethod VisualServer "texture_get_path" '[Rid]
           (IO GodotString)
         where
        nodeMethod = Godot.Core.VisualServer.texture_get_path

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

instance NodeMethod VisualServer "texture_get_texid" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.texture_get_texid

{-# NOINLINE bindVisualServer_texture_get_type #-}

-- | Returns the type of the texture, can be any of the @enum TextureType@.
bindVisualServer_texture_get_type :: MethodBind
bindVisualServer_texture_get_type
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_get_type" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns the type of the texture, can be any of the @enum TextureType@.
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

instance NodeMethod VisualServer "texture_get_type" '[Rid] (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.texture_get_type

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

instance NodeMethod VisualServer "texture_get_width" '[Rid]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.texture_get_width

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
                   cls -> Rid -> Image -> Maybe Int -> IO ()
texture_set_data cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1, toVariant arg2,
       maybe (VariantInt (0)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_set_data
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "texture_set_data"
           '[Rid, Image, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.texture_set_data

{-# NOINLINE bindVisualServer_texture_set_data_partial #-}

-- | Sets a part of the data for a texture. Warning: this function calls the underlying graphics API directly and may corrupt your texture if used improperly.
bindVisualServer_texture_set_data_partial :: MethodBind
bindVisualServer_texture_set_data_partial
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_set_data_partial" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a part of the data for a texture. Warning: this function calls the underlying graphics API directly and may corrupt your texture if used improperly.
texture_set_data_partial ::
                           (VisualServer :< cls, Object :< cls) =>
                           cls ->
                             Rid ->
                               Image ->
                                 Int -> Int -> Int -> Int -> Int -> Int -> Int -> Maybe Int -> IO ()
texture_set_data_partial cls arg1 arg2 arg3 arg4 arg5 arg6 arg7
  arg8 arg9 arg10
  = withVariantArray
      [toVariant arg1, toVariant arg2, toVariant arg3, toVariant arg4,
       toVariant arg5, toVariant arg6, toVariant arg7, toVariant arg8,
       toVariant arg9, maybe (VariantInt (0)) toVariant arg10]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_texture_set_data_partial
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "texture_set_data_partial"
           '[Rid, Image, Int, Int, Int, Int, Int, Int, Int, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.texture_set_data_partial

{-# NOINLINE bindVisualServer_texture_set_flags #-}

-- | Sets the texture's flags. See @enum TextureFlags@ for options.
bindVisualServer_texture_set_flags :: MethodBind
bindVisualServer_texture_set_flags
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_set_flags" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the texture's flags. See @enum TextureFlags@ for options.
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

instance NodeMethod VisualServer "texture_set_flags" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.texture_set_flags

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

instance NodeMethod VisualServer "texture_set_path"
           '[Rid, GodotString]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.texture_set_path

{-# NOINLINE bindVisualServer_texture_set_shrink_all_x2_on_set_data
             #-}

-- | If @true@, sets internal processes to shrink all image data to half the size.
bindVisualServer_texture_set_shrink_all_x2_on_set_data ::
                                                       MethodBind
bindVisualServer_texture_set_shrink_all_x2_on_set_data
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_set_shrink_all_x2_on_set_data" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, sets internal processes to shrink all image data to half the size.
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

instance NodeMethod VisualServer
           "texture_set_shrink_all_x2_on_set_data"
           '[Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.texture_set_shrink_all_x2_on_set_data

{-# NOINLINE bindVisualServer_texture_set_size_override #-}

-- | Resizes the texture to the specified dimensions.
bindVisualServer_texture_set_size_override :: MethodBind
bindVisualServer_texture_set_size_override
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "texture_set_size_override" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Resizes the texture to the specified dimensions.
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

instance NodeMethod VisualServer "texture_set_size_override"
           '[Rid, Int, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.texture_set_size_override

{-# NOINLINE bindVisualServer_textures_keep_original #-}

-- | If @true@, the image will be stored in the texture's images array if overwritten.
bindVisualServer_textures_keep_original :: MethodBind
bindVisualServer_textures_keep_original
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "textures_keep_original" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the image will be stored in the texture's images array if overwritten.
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

instance NodeMethod VisualServer "textures_keep_original" '[Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.textures_keep_original

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

instance NodeMethod VisualServer "viewport_attach_camera"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_attach_camera

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

instance NodeMethod VisualServer "viewport_attach_canvas"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_attach_canvas

{-# NOINLINE bindVisualServer_viewport_attach_to_screen #-}

-- | Copies viewport to a region of the screen specified by @rect@. If @Viewport.render_direct_to_screen@ is @true@, then viewport does not use a framebuffer and the contents of the viewport are rendered directly to screen. However, note that the root viewport is drawn last, therefore it will draw over the screen. Accordingly, you must set the root viewport to an area that does not cover the area that you have attached this viewport to.
--   				For example, you can set the root viewport to not render at all with the following code:
--   				
--   @
--   
--   				func _ready():
--   				    get_viewport().set_attach_to_screen_rect(Rect2())
--   				    $Viewport.set_attach_to_screen_rect(Rect2(0, 0, 600, 600))
--   				
--   @
--   
--   				Using this can result in significant optimization, especially on lower-end devices. However, it comes at the cost of having to manage your viewports manually. For a further optimization see, @method viewport_set_render_direct_to_screen@.
bindVisualServer_viewport_attach_to_screen :: MethodBind
bindVisualServer_viewport_attach_to_screen
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_attach_to_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Copies viewport to a region of the screen specified by @rect@. If @Viewport.render_direct_to_screen@ is @true@, then viewport does not use a framebuffer and the contents of the viewport are rendered directly to screen. However, note that the root viewport is drawn last, therefore it will draw over the screen. Accordingly, you must set the root viewport to an area that does not cover the area that you have attached this viewport to.
--   				For example, you can set the root viewport to not render at all with the following code:
--   				
--   @
--   
--   				func _ready():
--   				    get_viewport().set_attach_to_screen_rect(Rect2())
--   				    $Viewport.set_attach_to_screen_rect(Rect2(0, 0, 600, 600))
--   				
--   @
--   
--   				Using this can result in significant optimization, especially on lower-end devices. However, it comes at the cost of having to manage your viewports manually. For a further optimization see, @method viewport_set_render_direct_to_screen@.
viewport_attach_to_screen ::
                            (VisualServer :< cls, Object :< cls) =>
                            cls -> Rid -> Maybe Rect2 -> Maybe Int -> IO ()
viewport_attach_to_screen cls arg1 arg2 arg3
  = withVariantArray
      [toVariant arg1,
       defaultedVariant VariantRect2 (V2 (V2 0 0) (V2 0 0)) arg2,
       maybe (VariantInt (0)) toVariant arg3]
      (\ (arrPtr, len) ->
         godot_method_bind_call bindVisualServer_viewport_attach_to_screen
           (upcast cls)
           arrPtr
           len
           >>= \ (err, res) -> throwIfErr err >> fromGodotVariant res)

instance NodeMethod VisualServer "viewport_attach_to_screen"
           '[Rid, Maybe Rect2, Maybe Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_attach_to_screen

{-# NOINLINE bindVisualServer_viewport_create #-}

-- | Creates an empty viewport and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @viewport_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
bindVisualServer_viewport_create :: MethodBind
bindVisualServer_viewport_create
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_create" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Creates an empty viewport and adds it to the VisualServer. It can be accessed with the RID that is returned. This RID will be used in all @viewport_*@ VisualServer functions.
--   				Once finished with your RID, you will want to free the RID using the VisualServer's @method free_rid@ static method.
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

instance NodeMethod VisualServer "viewport_create" '[] (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.viewport_create

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

instance NodeMethod VisualServer "viewport_detach" '[Rid] (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_detach

{-# NOINLINE bindVisualServer_viewport_get_render_info #-}

-- | Returns a viewport's render information. For options, see the @enum ViewportRenderInfo@ constants.
bindVisualServer_viewport_get_render_info :: MethodBind
bindVisualServer_viewport_get_render_info
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_get_render_info" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Returns a viewport's render information. For options, see the @enum ViewportRenderInfo@ constants.
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

instance NodeMethod VisualServer "viewport_get_render_info"
           '[Rid, Int]
           (IO Int)
         where
        nodeMethod = Godot.Core.VisualServer.viewport_get_render_info

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

instance NodeMethod VisualServer "viewport_get_texture" '[Rid]
           (IO Rid)
         where
        nodeMethod = Godot.Core.VisualServer.viewport_get_texture

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

instance NodeMethod VisualServer "viewport_remove_canvas"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_remove_canvas

{-# NOINLINE bindVisualServer_viewport_set_active #-}

-- | If @true@, sets the viewport active, else sets it inactive.
bindVisualServer_viewport_set_active :: MethodBind
bindVisualServer_viewport_set_active
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_active" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, sets the viewport active, else sets it inactive.
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

instance NodeMethod VisualServer "viewport_set_active" '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_active

{-# NOINLINE bindVisualServer_viewport_set_canvas_stacking #-}

-- | Sets the stacking order for a viewport's canvas.
--   				@layer@ is the actual canvas layer, while @sublayer@ specifies the stacking order of the canvas among those in the same layer.
bindVisualServer_viewport_set_canvas_stacking :: MethodBind
bindVisualServer_viewport_set_canvas_stacking
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_canvas_stacking" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the stacking order for a viewport's canvas.
--   				@layer@ is the actual canvas layer, while @sublayer@ specifies the stacking order of the canvas among those in the same layer.
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

instance NodeMethod VisualServer "viewport_set_canvas_stacking"
           '[Rid, Rid, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_canvas_stacking

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

instance NodeMethod VisualServer "viewport_set_canvas_transform"
           '[Rid, Rid, Transform2d]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_canvas_transform

{-# NOINLINE bindVisualServer_viewport_set_clear_mode #-}

-- | Sets the clear mode of a viewport. See @enum ViewportClearMode@ for options.
bindVisualServer_viewport_set_clear_mode :: MethodBind
bindVisualServer_viewport_set_clear_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_clear_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the clear mode of a viewport. See @enum ViewportClearMode@ for options.
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

instance NodeMethod VisualServer "viewport_set_clear_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_clear_mode

{-# NOINLINE bindVisualServer_viewport_set_debug_draw #-}

-- | Sets the debug draw mode of a viewport. See @enum ViewportDebugDraw@ for options.
bindVisualServer_viewport_set_debug_draw :: MethodBind
bindVisualServer_viewport_set_debug_draw
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_debug_draw" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the debug draw mode of a viewport. See @enum ViewportDebugDraw@ for options.
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

instance NodeMethod VisualServer "viewport_set_debug_draw"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_debug_draw

{-# NOINLINE bindVisualServer_viewport_set_disable_3d #-}

-- | If @true@, a viewport's 3D rendering is disabled.
bindVisualServer_viewport_set_disable_3d :: MethodBind
bindVisualServer_viewport_set_disable_3d
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_disable_3d" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, a viewport's 3D rendering is disabled.
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

instance NodeMethod VisualServer "viewport_set_disable_3d"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_disable_3d

{-# NOINLINE bindVisualServer_viewport_set_disable_environment #-}

-- | If @true@, rendering of a viewport's environment is disabled.
bindVisualServer_viewport_set_disable_environment :: MethodBind
bindVisualServer_viewport_set_disable_environment
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_disable_environment" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, rendering of a viewport's environment is disabled.
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

instance NodeMethod VisualServer "viewport_set_disable_environment"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.viewport_set_disable_environment

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

instance NodeMethod VisualServer
           "viewport_set_global_canvas_transform"
           '[Rid, Transform2d]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.viewport_set_global_canvas_transform

{-# NOINLINE bindVisualServer_viewport_set_hdr #-}

-- | If @true@, the viewport renders to hdr.
bindVisualServer_viewport_set_hdr :: MethodBind
bindVisualServer_viewport_set_hdr
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_hdr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport renders to hdr.
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

instance NodeMethod VisualServer "viewport_set_hdr" '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_hdr

{-# NOINLINE bindVisualServer_viewport_set_hide_canvas #-}

-- | If @true@, the viewport's canvas is not rendered.
bindVisualServer_viewport_set_hide_canvas :: MethodBind
bindVisualServer_viewport_set_hide_canvas
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_hide_canvas" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport's canvas is not rendered.
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

instance NodeMethod VisualServer "viewport_set_hide_canvas"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_hide_canvas

{-# NOINLINE bindVisualServer_viewport_set_hide_scenario #-}

-- | Currently unimplemented in Godot 3.x.
bindVisualServer_viewport_set_hide_scenario :: MethodBind
bindVisualServer_viewport_set_hide_scenario
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_hide_scenario" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Currently unimplemented in Godot 3.x.
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

instance NodeMethod VisualServer "viewport_set_hide_scenario"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_hide_scenario

{-# NOINLINE bindVisualServer_viewport_set_msaa #-}

-- | Sets the anti-aliasing mode. See @enum ViewportMSAA@ for options.
bindVisualServer_viewport_set_msaa :: MethodBind
bindVisualServer_viewport_set_msaa
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_msaa" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the anti-aliasing mode. See @enum ViewportMSAA@ for options.
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

instance NodeMethod VisualServer "viewport_set_msaa" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_msaa

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

instance NodeMethod VisualServer "viewport_set_parent_viewport"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_parent_viewport

{-# NOINLINE bindVisualServer_viewport_set_render_direct_to_screen
             #-}

-- | If @true@, render the contents of the viewport directly to screen. This allows a low-level optimization where you can skip drawing a viewport to the root viewport. While this optimization can result in a significant increase in speed (especially on older devices), it comes at a cost of usability. When this is enabled, you cannot read from the viewport or from the @SCREEN_TEXTURE@. You also lose the benefit of certain window settings, such as the various stretch modes. Another consequence to be aware of is that in 2D the rendering happens in window coordinates, so if you have a viewport that is double the size of the window, and you set this, then only the portion that fits within the window will be drawn, no automatic scaling is possible, even if your game scene is significantly larger than the window size.
bindVisualServer_viewport_set_render_direct_to_screen :: MethodBind
bindVisualServer_viewport_set_render_direct_to_screen
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_render_direct_to_screen" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, render the contents of the viewport directly to screen. This allows a low-level optimization where you can skip drawing a viewport to the root viewport. While this optimization can result in a significant increase in speed (especially on older devices), it comes at a cost of usability. When this is enabled, you cannot read from the viewport or from the @SCREEN_TEXTURE@. You also lose the benefit of certain window settings, such as the various stretch modes. Another consequence to be aware of is that in 2D the rendering happens in window coordinates, so if you have a viewport that is double the size of the window, and you set this, then only the portion that fits within the window will be drawn, no automatic scaling is possible, even if your game scene is significantly larger than the window size.
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

instance NodeMethod VisualServer
           "viewport_set_render_direct_to_screen"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.viewport_set_render_direct_to_screen

{-# NOINLINE bindVisualServer_viewport_set_scenario #-}

-- | Sets a viewport's scenario.
--   				The scenario contains information about the @enum ScenarioDebugMode@, environment information, reflection atlas etc.
bindVisualServer_viewport_set_scenario :: MethodBind
bindVisualServer_viewport_set_scenario
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_scenario" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets a viewport's scenario.
--   				The scenario contains information about the @enum ScenarioDebugMode@, environment information, reflection atlas etc.
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

instance NodeMethod VisualServer "viewport_set_scenario"
           '[Rid, Rid]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_scenario

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

instance NodeMethod VisualServer
           "viewport_set_shadow_atlas_quadrant_subdivision"
           '[Rid, Int, Int]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.viewport_set_shadow_atlas_quadrant_subdivision

{-# NOINLINE bindVisualServer_viewport_set_shadow_atlas_size #-}

-- | Sets the size of the shadow atlas's images (used for omni and spot lights). The value will be rounded up to the nearest power of 2.
bindVisualServer_viewport_set_shadow_atlas_size :: MethodBind
bindVisualServer_viewport_set_shadow_atlas_size
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_shadow_atlas_size" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the size of the shadow atlas's images (used for omni and spot lights). The value will be rounded up to the nearest power of 2.
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

instance NodeMethod VisualServer "viewport_set_shadow_atlas_size"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_shadow_atlas_size

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

instance NodeMethod VisualServer "viewport_set_size"
           '[Rid, Int, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_size

{-# NOINLINE bindVisualServer_viewport_set_transparent_background
             #-}

-- | If @true@, the viewport renders its background as transparent.
bindVisualServer_viewport_set_transparent_background :: MethodBind
bindVisualServer_viewport_set_transparent_background
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_transparent_background" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport renders its background as transparent.
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

instance NodeMethod VisualServer
           "viewport_set_transparent_background"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod
          = Godot.Core.VisualServer.viewport_set_transparent_background

{-# NOINLINE bindVisualServer_viewport_set_update_mode #-}

-- | Sets when the viewport should be updated. See @enum ViewportUpdateMode@ constants for options.
bindVisualServer_viewport_set_update_mode :: MethodBind
bindVisualServer_viewport_set_update_mode
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_update_mode" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets when the viewport should be updated. See @enum ViewportUpdateMode@ constants for options.
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

instance NodeMethod VisualServer "viewport_set_update_mode"
           '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_update_mode

{-# NOINLINE bindVisualServer_viewport_set_usage #-}

-- | Sets the viewport's 2D/3D mode. See @enum ViewportUsage@ constants for options.
bindVisualServer_viewport_set_usage :: MethodBind
bindVisualServer_viewport_set_usage
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_usage" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | Sets the viewport's 2D/3D mode. See @enum ViewportUsage@ constants for options.
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

instance NodeMethod VisualServer "viewport_set_usage" '[Rid, Int]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_usage

{-# NOINLINE bindVisualServer_viewport_set_use_arvr #-}

-- | If @true@, the viewport uses augmented or virtual reality technologies. See @ARVRInterface@.
bindVisualServer_viewport_set_use_arvr :: MethodBind
bindVisualServer_viewport_set_use_arvr
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_use_arvr" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport uses augmented or virtual reality technologies. See @ARVRInterface@.
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

instance NodeMethod VisualServer "viewport_set_use_arvr"
           '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_use_arvr

{-# NOINLINE bindVisualServer_viewport_set_vflip #-}

-- | If @true@, the viewport's rendering is flipped vertically.
bindVisualServer_viewport_set_vflip :: MethodBind
bindVisualServer_viewport_set_vflip
  = unsafePerformIO $
      withCString "VisualServer" $
        \ clsNamePtr ->
          withCString "viewport_set_vflip" $
            \ methodNamePtr ->
              godot_method_bind_get_method clsNamePtr methodNamePtr

-- | If @true@, the viewport's rendering is flipped vertically.
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

instance NodeMethod VisualServer "viewport_set_vflip" '[Rid, Bool]
           (IO ())
         where
        nodeMethod = Godot.Core.VisualServer.viewport_set_vflip