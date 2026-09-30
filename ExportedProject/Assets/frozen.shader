Shader "DianDian/Build/Frozen" {
	Properties {
		_MainColor ("MainColor", Vector) = (1,1,1,1)
		_MainColor2 ("MainColor2", Vector) = (1,1,1,1)
		_NormalTex ("Normal", 2D) = "bump" {}
		_NormalStrength ("Normal Strength", Range(0.0001, 2)) = 1
		_NoiseTex ("Noise(RGB:noise, A:mask)", 2D) = "white" {}
		_SpecularPower ("Specular Power", Range(0.1, 2048)) = 16
		_SpecularStrength ("Specular Strength", Range(0, 1)) = 0
		[Toggle] _UseShadowA ("Use Shadow A Channel", Float) = 0
		_ShadowStrength ("Shadow Strength", Range(0, 1)) = 0.5
		[KeywordEnum(Off, On)] _UseAttenBase ("Use AttenBase", Float) = 0
		_AttenBase ("Atten Base", Range(0.0001, 1)) = 0.0001
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
}