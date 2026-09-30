Shader "DianDian/PBR" {
	Properties {
		_Color ("Color", Vector) = (0.5,0.5,0.5,1)
		_MainTex ("MainTex", 2D) = "white" {}
		[NoScaleOffset] [Normal] _BumpMap ("Normal Map", 2D) = "bump" {}
		_BumpScale ("BumpScale", Float) = 1
		[NoScaleOffset] _MetallicGlossMap ("Mask(R:Metallic)(G:Occlusion)(B:Smoothness)(A:Emission)", 2D) = "white" {}
		[Gamma] _Metallic ("Metallic Scale", Range(0, 1)) = 0
		_Glossiness ("Smoothness Scale", Range(0, 1)) = 0.5
		_OcclusionStrength ("Occlusion Strength", Range(0, 1)) = 1
		_EmissionColor ("Emission", Vector) = (0,0,0,1)
		[Toggle] _Use_Detail ("Use Detail", Float) = 0
		[NoScaleOffset] _DetailMask ("Detail Mask", 2D) = "white" {}
		_DetailAlbedoMap ("Detail Albedo x2", 2D) = "grey" {}
		[NoScaleOffset] [Normal] _DetailNormalMap ("Normal Map", 2D) = "bump" {}
		_DetailNormalMapScale ("Scale", Float) = 1
		_Cutoff ("Alpha Cutoff", Range(0, 1)) = 0.5
		[HideInInspector] _Mode ("__mode", Float) = 0
		[HideInInspector] _SrcBlend ("__src", Float) = 1
		[HideInInspector] _DstBlend ("__dst", Float) = 0
		[HideInInspector] _ZWrite ("__zw", Float) = 1
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
			float4 _Color;

			struct Fragment_Stage_Input
			{
				float2 uv : TEXCOORD0;
			};

			float4 frag(Fragment_Stage_Input input) : SV_TARGET
			{
				return _MainTex.Sample(sampler_MainTex, input.uv.xy) * _Color;
			}

			ENDHLSL
		}
	}
	//CustomEditor "DDRenderPipeline.PBRShaderGUI"
}