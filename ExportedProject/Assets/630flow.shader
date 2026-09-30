Shader "aseShader/630Flow" {
	Properties {
		_FlowColor ("FlowColor", Vector) = (1,1,1,1)
		_FlowEmiss ("FlowEmiss", 2D) = "white" {}
		_Rotator ("Rotator", Float) = 0.5
		_FlowIntensity ("FlowIntensity", Float) = 0.2
		_FlowTilling ("FlowTilling", Vector) = (1,0.5,0,0)
		_Speed ("Speed", Vector) = (0,0.35,0,0)
		_AlphaTex ("AlphaTex", 2D) = "white" {}
		_AlphaU ("AlphaU", Float) = 0
		_AlphaV ("AlphaV", Float) = 0
		_DistortionTex ("DistortionTex", 2D) = "white" {}
		_DistortionU ("DistortionU", Float) = 0
		_DistortionV ("DistortionV", Float) = 0
		_DistortionIndensity ("DistortionIndensity", Float) = 0
		[HideInInspector] _texcoord ("", 2D) = "white" {}
		[HideInInspector] __dirty ("", Float) = 1
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
	Fallback "Diffuse"
	//CustomEditor "ASEMaterialInspector"
}