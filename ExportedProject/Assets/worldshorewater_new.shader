Shader "DianDian/World/ShoreWater_New" {
	Properties {
		[Header(Base)] [NoScaleOffset] _MainTex ("Texture", 2D) = "white" {}
		[NoScaleOffset] _MaskTex ("Mask(r:alpha, g:water, b:foam, a:deep)", 2D) = "white" {}
		[Header(Color)] _ShallowColor ("Shallow Color", Vector) = (1,1,1,1)
		_ShallowColor2 ("Shallow Color2", Vector) = (1,1,1,1)
		_DeepColor ("Deep Color", Vector) = (1,1,1,1)
		_DeepColor2 ("Deep Color2", Vector) = (1,1,1,1)
		_NoiseTex ("Noise", 2D) = "white" {}
		[Header(Normal)] _NormalTex ("Normal", 2D) = "bump" {}
		_NormalUVParam ("Normal UV Move(xy:dir1, zw:dir2)", Vector) = (1,1,1,1)
		_NormalStrength ("Normal Strength", Range(0, 1)) = 1
		[Header(Wave)] _WaveParamA ("xy:dir, z:amplitude, w:length", Vector) = (0,0,0,0)
		_Speed ("Speed", Range(0, 4)) = 1
		[Header(Foam)] _FoamColor ("Foam Color", Vector) = (1,1,1,1)
		_FoamParam ("Foam Param(x:width, y:speed, z:cycle, w:blur)", Vector) = (0.3,0.2,1,0.1)
		_FoamTexParam ("FoamTex Param(xy:tiling, zw:offset)", Vector) = (1,1,0,0)
		_FoamAttenuation ("Foam Attenuation", Range(0.8, 0.99)) = 0.9
		[Header(Specular)] _SpecularPower ("Specular Power", Range(0.1, 2048)) = 16
		_SpecularStrength ("Specular Strength", Range(0, 1)) = 0
		_SpecularNormalStrength ("Specular Normal Strength", Range(0, 1)) = 0
		_LightDir ("LightDir", Vector) = (1,1,0,0)
		[Header(Sky)] [HDR] _SkyBase ("Base", Vector) = (1,1,1,1)
		[HDR] _SkyAwayFromSun ("Away From Sun", Vector) = (1,1,1,1)
		_SkyDirectionality ("Directionality", Range(0, 0.99)) = 0.875
		[Header(Reflection)] _ReflectionStrength ("Reflection Strength", Range(0, 1)) = 0.7
		_FresnelPower ("Fresnel Power", Range(1, 20)) = 5
		_RefractiveIndexOfAir ("Refractive Index of Air", Range(1, 2)) = 1
		_RefractiveIndexOfWater ("Refractive Index of Water", Range(1, 2)) = 1.333
		[Header(Shadow)] _NLStrength ("NL Strength", Range(0, 1)) = 0.25
		[HideInInspector] _Offset ("_Offset", Vector) = (1,1,0,0)
		[HideInInspector] _Fade ("Fade", Vector) = (0,0,0,0)
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