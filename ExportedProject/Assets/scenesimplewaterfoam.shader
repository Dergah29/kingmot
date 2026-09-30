Shader "DianDian/Scene/Simple Water Foam" {
	Properties {
		[Header(Foam)] _FoamColor ("泡沫颜色", Vector) = (1,1,1,1)
		_FoamTex ("泡沫纹理", 2D) = "white" {}
		_FoamInterval ("泡沫间隔", Float) = 300
		_FoamSpeed ("泡沫速度", Float) = 1
		_FoamPower ("泡沫强度", Float) = 1
		_FoamAttenuation ("泡沫衰减", Float) = 1
		[Space(10)] [Header(Distort)] _FoamDistortTex ("泡沫遮罩纹理", 2D) = "white" {}
		_DistortSpeed ("扰动速度", Float) = 1
		_DistortScale ("扰动强度", Float) = 1
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