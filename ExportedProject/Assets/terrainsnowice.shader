Shader "DianDian/Terrain/SnowIce" {
	Properties {
		_MaskTex ("Mask", 2D) = "black" {}
		[Header(Snow)] _SnowColor1 ("SnowColor1", Vector) = (1,1,1,1)
		_SnowColor2 ("SnowColor2", Vector) = (1,1,1,1)
		_SnowColor3 ("SnowColor3", Vector) = (1,1,1,1)
		[Header(Ice)] _IceMaskTex ("IceMask(rg:Crack, b:Shallow)", 2D) = "white" {}
		_IceColor ("IceColor", Vector) = (1,1,1,1)
		_ShallowColor ("ShallowColor", Vector) = (1,1,1,1)
		_CrackColor ("CrackColor", Vector) = (1,1,1,1)
		_CrackUnderColor ("CrackUnderColor", Vector) = (1,1,1,1)
		_ShallowTilingAndOffset ("Shallow Tiling And Offset", Vector) = (1,1,0,0)
		_LayerOffset ("Layer Offset(xy:Offset, zw:Strength)", Vector) = (0,0,0,0)
		[Header(Smoothness)] _SmoothnessTex ("Smoothness Tex", 2D) = "black" {}
		_SmoothnessScale ("Smoothness Scale", Range(0, 1)) = 0.5
		_SmoothnessRoughness ("Smoothness Roughness", Range(0, 1)) = 0.02
		_SpecularStrength ("Specular Strength", Range(0, 1)) = 0
		_SmoothnessScaleSnow ("Smoothness Scale Snow", Range(0, 1)) = 0.5
		_SmoothnessRoughnessSnow ("Smoothness Roughness Snow", Range(0, 1)) = 0.02
		_SpecularStrengthSnow ("Specular Strength Snow", Range(0, 1)) = 0
		_OffsetFactor ("OffsetFactor", Float) = 0
		_OffsetUnits ("OffsetUnits", Float) = 0
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