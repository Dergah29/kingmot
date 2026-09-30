Shader "DianDian/TD/LiquidBottle" {
	Properties {
		_Plane ("Plane", Vector) = (0,1,0,0)
		_MinY ("MinY", Float) = 0
		[Header(Base)] [HDR] _LiquidColor ("Liquid Color", Vector) = (1,1,1,1)
		[HDR] _LiquidTopColor ("Liquid Top Color", Vector) = (1,1,1,1)
		_Range ("Range", Float) = 10
		_BoundRange ("Bound Range", Range(0, 0.4)) = 0.1
		_BoundPow ("Bound Pow", Range(0, 2)) = 1
		[Header(Specular)] _Smoothness ("Smoothness", Range(0, 1)) = 0.5
		[Header(Reflections)] [NoScaleOffset] _MatCapMap ("MatCap Map", 2D) = "white" {}
		_MatCapStrength ("MatCap Strength", Range(0.01, 10)) = 1
		_FresnelParam ("Fresnel Param(R:Min G:Max, BA:Top)", Vector) = (0.1,1,0,0)
		[Header(Refraction)] [Toggle] _UseRefraction ("Use Refraction", Float) = 0
		[NoScaleOffset] _EnvironmentMap ("Environment Map", Cube) = "" {}
		_EnvironmentStrength ("Environment Strength", Range(0.01, 10)) = 1
		[Header(Wave)] _NormalTex ("Normal", 2D) = "bump" {}
		_NormalStrength ("Normal Strength", Range(0.0001, 2)) = 1
		_WaveSpeed ("Wave Speed", Vector) = (0,1,1,0)
		_WaveCrest ("Wave Crest", Float) = 1
		_WavePow ("Wave Pow", Range(0, 2)) = 1
		_WaveStrength ("Wave Strength", Range(0, 1)) = 1
		[Header(TopColor)] [Toggle] _UseTopCol ("Use Top Color", Float) = 0
		[HDR] _TopColor ("Top Color", Vector) = (1,1,1,1)
		_TopAlpha ("Top Alpha", Range(0, 1)) = 1
		_TopRange ("Top Range", Range(0, 1)) = 0.5
		_TopEdge ("Top Edge", Range(0, 1)) = 0
		[Toggle] _UseTopDepth ("Use Top Depth", Float) = 0
		[Header(Rim)] [KeywordEnum(Off, On)] _UseRim ("Use Rim", Float) = 0
		[HDR] _RimColor ("Rim Color", Vector) = (1,1,1,1)
		_RimRange ("Rim Range", Range(0, 1)) = 0.5
		_RimEdge ("Rim Edge", Range(0, 1)) = 0
		[Header(Sparkling)] [Toggle] _UseSparkling ("Use Sparkling", Float) = 0
		_SparklingMap ("Sparkling Map", 2D) = "black" {}
		[HDR] _SparklingCol ("Sparkling Color", Vector) = (1,1,1,1)
		_SparklingSpeed ("Sparkling Speed", Float) = 0
		[Header(Rendering)] [Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("Src Blend", Float) = 1
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("Dst Blend", Float) = 0
		[Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Float) = 1
		_Stencil ("Stencil ID", Float) = 0
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