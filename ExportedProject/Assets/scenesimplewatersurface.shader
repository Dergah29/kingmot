Shader "DianDian/Scene/Simple Water Surface" {
	Properties {
		[Header(Water Color)] _WaveColor ("水波颜色", Vector) = (0.44,0.95,0.36,1)
		_WaterColor ("水颜色", Vector) = (0,0.05,0.19,1)
		_ShallowColor ("浅处颜色", Vector) = (0.44,0.95,0.36,1)
		_ColorScope ("颜色深度坡度", Float) = 20
		_ColorLerp ("颜色深度渐变", Float) = 0.5
		_ColorMaskTex ("颜色遮罩纹理", 2D) = "white" {}
		_DeepColor ("深色颜色", Vector) = (1,1,1,1)
		[Space(10)] [Header(High Light Point)] _WaveParamA ("WaveParamA => xy:方向, z:浪高, w:高光带位置", Vector) = (0,0,0,0)
		_WaveParamB ("WaveParamB => xy:方向, z:浪高, w:高光带范围", Vector) = (0,0,0,0)
		[Space(10)] [Header(Normal)] _NormalTex ("Normal(Tiling可调高光点大小)", 2D) = "bump" {}
		_NormalUVParam ("Normal UV Move(xy:浪A方向和流速, zw:浪B方向和流速)", Vector) = (1,1,1,1)
		_NormalStrength ("Normal Strength", Range(0, 1)) = 1
		_ViewDir ("View Direction", Vector) = (0,0,1,0)
		[Space(10)] [Header(Specular)] _SpecularPower ("Specular Power(可调高光点曝度)", Range(0.1, 2048)) = 16
		_SpecularStrength ("Specular Strength", Range(0, 1)) = 0
		_SpecularNormalStrength ("Specular Normal Strength", Range(0, 1)) = 0
		[HDR] _SpecularColor ("Specular Color", Vector) = (1,1,1,1)
		[Space(10)] [Header(UnderWater)] _UnderWaterDistortX ("水下偏移X", Float) = 0.05
		_UnderWaterDistortY ("水下偏移Y", Float) = 0.001
		_UnderWaterDistortStrength ("水下扰动强度", Range(0, 1)) = 1
		[Space(10)] [Header(Edge)] _EdgeRange ("泡沫边缘范围", Float) = 0.01
		[HDR] _EdgeColor ("泡沫颜色", Vector) = (1,1,1,1)
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