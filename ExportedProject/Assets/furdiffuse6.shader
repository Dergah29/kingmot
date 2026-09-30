Shader "DianDian/Fur/FurDiffuse6" {
	Properties {
		[Header(Main)] _MainCol ("Main Color", Vector) = (1,1,1,1)
		_MainTex ("MainTex", 2D) = "white" {}
		[Header(Fur)] _FurTex ("FurTex", 2D) = "white" {}
		_FurLength ("Fur Length", Range(0, 1)) = 0.1
		_FurStrength ("Fur Strength", Range(0, 2)) = 0.11
		_FurThickness ("Fur Thickness", Range(0.01, 10)) = 1
		_FurShadowStrength ("Fur Shadow Strength", Range(0, 1)) = 0.25
		[Header(Gravity)] _GravityGlobal ("Gravity Global", Vector) = (0,0,0,0)
		_GravityLocal ("Gravity Local", Vector) = (0,0,0,0)
		[Header(Specular)] _SpecularCol ("Specular Color", Vector) = (1,1,1,1)
		_SpecularPow ("Specular Pow", Range(0.01, 256)) = 5
		[Header(Rim)] _RimColor ("Rim Color", Vector) = (0,0,0,1)
		_RimPow ("Rim Pow", Range(0, 8)) = 6
		[Header(Env Lighting)] [KeywordEnum(Off, On)] _EnvGradiant ("Use Env Gradiant", Float) = 1
		_EnvUpCol ("Env Up Color", Vector) = (0.7,0.9,1,1)
		_EnvSideCol ("Env Side Col", Vector) = (0.7,0.9,1,1)
		_EnvDownCol ("Env Down Col", Vector) = (0.7,0.9,1,1)
		_EnvStrength ("Env Strength", Range(0, 1)) = 1
		[Header(Shadow)] [KeywordEnum(Off, On)] _Shadow ("Use Shadow", Float) = 1
		_ShadowStrength ("Shadow Strength", Range(0, 1)) = 1
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
			float4 _MainTex_ST;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct Vertex_Stage_Output
			{
				float2 uv : TEXCOORD0;
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.uv = (input.uv.xy * _MainTex_ST.xy) + _MainTex_ST.zw;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			Texture2D<float4> _MainTex;
			SamplerState sampler_MainTex;

			struct Fragment_Stage_Input
			{
				float2 uv : TEXCOORD0;
			};

			float4 frag(Fragment_Stage_Input input) : SV_TARGET
			{
				return _MainTex.Sample(sampler_MainTex, input.uv.xy);
			}

			ENDHLSL
		}
	}
}