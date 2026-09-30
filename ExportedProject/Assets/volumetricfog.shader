Shader "DianDian/City/VolumetricFog" {
	Properties {
		[NoScaleOffset] _MainTex ("Mask", 2D) = "white" {}
		[NoScaleOffset] _NoiseTex ("Noise", 2D) = "white" {}
		[KeywordEnum(Off, On)] _VolumetricFog ("Use Volumetric Fog", Float) = 1
		_FogTiling ("Fog Tiling", Vector) = (0.005,0.005,0.008,0.008)
		_FogSpeed ("Fog Speed", Vector) = (0.03,0.03,0.01,0.01)
		_LowFogSpeed ("Low Fog Speed", Vector) = (0.03,0.03,0.01,0.01)
		_FogColor ("Fog Color", Vector) = (1,1,1,1)
		_NoiseColor ("Noise Color", Vector) = (0,0,0,1)
		_ColorDensity ("Color Density", Range(0, 1)) = 1
		_AlphaDensity ("AlphaDensity", Range(0, 1)) = 0.01
		_FogStart ("Fog Start", Float) = 0
		_FogEnd ("Fog End", Float) = 1
		_HighPower ("High Power", Range(0.1, 10)) = 1
		_FogDensity ("Fog Density", Range(0.1, 2)) = 1
		_Level ("Level", Range(0, 3)) = 0
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