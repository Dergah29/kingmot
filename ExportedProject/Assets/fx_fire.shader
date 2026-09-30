Shader "630VFX/fx_Fire" {
	Properties {
		[Enum(Less,2,Disabled,0)] _ZTestMode ("ZTest Mode", Float) = 2
		_Color ("Color", Vector) = (1,1,1,1)
		_EmissIndensity ("EmissIndensity", Float) = 10
		_GradientTex ("GradientTex", 2D) = "white" {}
		_Noise ("Noise", 2D) = "white" {}
		_NoiseU ("NoiseU", Float) = 0
		_NoiseV ("NoiseV", Float) = 0
		_Softness ("Softness", Range(0, 3)) = 1.373843
		_Alpha ("Alpha", 2D) = "white" {}
		_Float0 ("Float 0", Float) = 0
		[HideInInspector] _texcoord ("", 2D) = "white" {}
		[HideInInspector] __dirty ("", Float) = 1
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType"="Opaque" }
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

			float4 _Color;

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return _Color; // RGBA
			}

			ENDHLSL
		}
	}
	Fallback "Diffuse"
	//CustomEditor "ASEMaterialInspector"
}