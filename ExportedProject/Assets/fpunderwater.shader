Shader "Hidden/PostProcess/FPUnderWater" {
	Properties {
		_WaterColor ("WaterColor", Vector) = (0.463,1,0.933,1)
		_DepthColor ("DepthColor", Vector) = (0,0.2,0.5,1)
		_FogSmooth ("FogSmooth", Range(0, 0.1)) = 0.01
		_MainTex ("MainTex", 2D) = "white" {}
		_CausticsTex ("CausticsTex", 2D) = "white" {}
		_CauStrength ("Caustics Strength", Float) = 100
		_NoiseTex ("NoiseTex", 2D) = "white" {}
		_CullNoise ("CullNoise", Range(0, 1)) = 0.9
		_WetHeight ("WerHeight", Range(0.05, 1)) = 0.097
		_Disturtion ("Disturtion", Range(0, 0.1)) = 0.03
		_WaveSpeed1 ("WaveSpeed1", Float) = 0.7
		_VaveSpeed2 ("VaveSpeed2", Float) = -0.8
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