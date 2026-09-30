Shader "DianDian/Build/BuildInter_AOShadow" {
	Properties {
		[Header(Main)] _MainCol ("Main Color", Vector) = (1,1,1,1)
		_MainTex ("MainTex(RGB:Main Color)(A:Alpha)", 2D) = "white" {}
		[Header(Normal Map)] [KeywordEnum(Off, On)] _NormalMap ("Use Normal Map", Float) = 0
		[NoScaleOffset] [Normal] _BumpMap ("Normal Map", 2D) = "bump" {}
		[Header(Mask Map)] [KeywordEnum(Off, On)] _MaskMap ("Use Mask Map", Float) = 0
		[NoScaleOffset] _MetallicGlossMap ("Mask(R:Metallic)(G:Occlusion)(B:Smoothness)(A:Emission)", 2D) = "black" {}
		[Gamma] _Metallic ("Metallic Scale", Range(0, 1)) = 0
		[Gamma] _BaseMetallicLerp ("Base Metallic Lerp", Range(0, 1)) = 1
		_Glossiness ("Smoothness Scale", Range(0, 1)) = 0.5
		_OcclusionStrength ("Occlusion Strength", Range(0, 1)) = 1
		_EmissionColor ("Emission", Vector) = (0,0,0,1)
		[Header(Alpha)] [KeywordEnum(Off, On)] _AlphaTest ("Use Alpha Cutoff", Float) = 0
		_Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
		[Header(Reflections)] [KeywordEnum(Off, On, MatCap)] _Reflections ("Use Reflections", Float) = 0
		[NoScaleOffset] _MatCapMap ("MatCap Map", 2D) = "white" {}
		_MatCapStrength ("MatCap Strength", Range(0.01, 10)) = 1
		[Header(PointLight)] [KeywordEnum(Off, On)] _PointLight ("Use PointLight", Float) = 0
		[Header(Shadow Map)] [KeywordEnum(Off, On)] _UseShadow ("Use Shadow", Float) = 0
		_ShadowReadMask ("Shadow ReadMask", Vector) = (0,0,0,0)
		_ShadowStrength ("Shadow Strength", Range(0, 1)) = 0.5
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