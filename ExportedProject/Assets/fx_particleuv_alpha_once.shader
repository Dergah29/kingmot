Shader "jxm/Fx_ParticleUV_aipha_once" {
	Properties {
		_main_tex ("main_tex", 2D) = "white" {}
		[HDR] _color ("color", Vector) = (0.5,0.5,0.5,1)
		_opactiy_tex ("opactiy_tex", 2D) = "white" {}
		_dissvo_tex ("dissvo_tex", 2D) = "white" {}
		[MaterialToggle] _node_4296 ("node_4296", Float) = 1
		[MaterialToggle] _uv_switch ("uv_switch", Float) = 0
		[HideInInspector] _Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
			};

			struct Vertex_Stage_Output
			{
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return float4(1.0, 1.0, 1.0, 1.0); // RGBA
			}

			ENDHLSL
		}
	}
	//CustomEditor "ShaderForgeMaterialInspector"
}