Shader "DianDian/Common/TexturePlanarShadow" {
	Properties {
		[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("SrcBlend", Float) = 5
		[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("DstBlend", Float) = 10
		_ShadowMask ("Shadow Mask(RGBA)", Vector) = (1,1,1,1)
		[Header(Planar Shadow)] _ShadowColor ("阴影颜色", Vector) = (1,1,1,1)
		_ShadowStrength ("Shadow Strength", Range(0, 1)) = 0.5
		[KeywordEnum(Off, On)] _CustomLightDir ("自定义灯光方向", Float) = 1
		_LightDir ("灯光方向", Vector) = (2,-1.85,-1.75,1)
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