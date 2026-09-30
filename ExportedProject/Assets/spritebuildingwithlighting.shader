Shader "DianDian/Building/SpriteBuildingWithLighting" {
	Properties {
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		[HideInInspector] _LightingTex ("Lighting Texture", 2D) = "black" {}
		[HideInInspector] _RendererColor ("RendererColor", Vector) = (1,1,1,1)
		[HideInInspector] _Flip ("Flip", Vector) = (1,1,1,1)
		[HideInInspector] _Lighting1Color ("Lighting 1 Color", Vector) = (1,1,1,1)
		[HideInInspector] _Lighting2Color ("Lighting 2 Color", Vector) = (1,1,1,1)
		[HideInInspector] _Lighting3Color ("Lighting 3 Color", Vector) = (1,1,1,1)
		[HideInInspector] _Lighting4Color ("Lighting 4 Color", Vector) = (1,1,1,1)
		[HideInInspector] _Lighting1Extra ("Lighting 1 Extra(r:enable,g:is lighting)", Vector) = (1,1,0,0)
		[HideInInspector] _Lighting2Extra ("Lighting 2 Extra(r:enable,g:is lighting)", Vector) = (1,1,0,0)
		[HideInInspector] _Lighting3Extra ("Lighting 3 Extra(r:enable,g:is lighting)", Vector) = (1,1,0,0)
		[HideInInspector] _Lighting4Extra ("Lighting 4 Extra(r:enable,g:is lighting)", Vector) = (1,1,0,0)
		[NoScaleOffset] _BlinkTex ("Blink Tex", 2D) = "white" {}
		_Blink ("Blink(x:Blink Speed, y:Splash Speed, zw:Splash Range)", Vector) = (1,1,0.75,1)
		_Intensity ("Intensity", Range(0.1, 10)) = 1
		[HideInInspector] _EnableBlink ("Enable Blink", Float) = 0
		[HideInInspector] _EnableLighting ("Enable Lighting", Float) = 0
		[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
		[Header(Other)] [Toggle] _SetGray ("SetGray", Float) = 0
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