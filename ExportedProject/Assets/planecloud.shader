Shader "DianDian/TD/PlaneCloud" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_NormalStrength ("Normal Strength", Range(0.0001, 2)) = 1
		_Alpha ("Alpha", Range(0, 4)) = 1
		_BrightCol ("Bright Color", Vector) = (1,1,1,1)
		[HDR] _DarkCol ("Dark Color", Vector) = (0.6,0.6,0.6,1)
		[HDR] _EmissionCol ("Emission Color", Vector) = (1,1,1,1)
		_EmissionStrength ("Emission Strength", Range(0, 1)) = 1
		_Offset ("Offset", Range(0.001, 0.2)) = 0.001
		_OffsetClamp ("Offset Clamp", Range(0.01, 1)) = 0.03
		_LambertMul ("Lambert Mul", Range(0, 1)) = 1
		_DeltaMul ("Delta Mul", Range(0, 8)) = 1
		[Header(Noise)] _NoiseTex ("NoiseTex", 2D) = "white" {}
		_NoiseSpeed ("Noise Speed", Range(-1, 1)) = 1
		_NoiseOffset ("Noise Offset", Range(0, 0.2)) = 0.1
		[Header(BG)] _BgTex ("Background", 2D) = "black" {}
		_BGAlpha ("Background Alpha", Range(0, 1)) = 1
		[Header(Shadow)] _Stencil ("Shadow Stencil ID", Float) = 0
		_ShadowCol ("Shadow Color", Vector) = (0.5,0.5,0.5,1)
		[Header(PointLight)] _PointCol ("Point Color", Vector) = (1,1,1,1)
		_PointCol2 ("Point Color", Vector) = (1,1,1,1)
		_PointPow ("Point Pow", Range(0.001, 8)) = 1
		_PointStrength ("Point Strength", Range(0, 8)) = 1
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