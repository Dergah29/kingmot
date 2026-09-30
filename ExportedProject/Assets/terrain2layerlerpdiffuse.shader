Shader "DianDian/Terrain/2 Layer Lerp Diffuse" {
	Properties {
		[NoScaleOffset] _ControlMap ("Control Map", 2D) = "black" {}
		[NoScaleOffset] _Splat11 ("Splat 1", 2D) = "black" {}
		[NoScaleOffset] _Splat12 ("Splat 2", 2D) = "black" {}
		_Tiling1 ("Tiling x:Control, y:Splat1, z:Splat2", Vector) = (1,1,1,0)
		[NoScaleOffset] _Splat21 ("Splat 1", 2D) = "black" {}
		[NoScaleOffset] _Splat22 ("Splat 2", 2D) = "black" {}
		_Tiling2 ("Tiling x:Control, y:Splat1, z:Splat2", Vector) = (1,1,1,0)
		[KeywordEnum(Off, On)] _Sand ("Use Sand", Float) = 0
		_SandTex ("Sand Tex", 2D) = "white" {}
		_SpecularPower ("Specular Power", Range(0.1, 2048)) = 16
		_SpecularStrength ("Specular Strength", Range(0, 1)) = 0
		[KeywordEnum(Off, On)] _Edge ("Use Edge", Float) = 0
		[NoScaleOffset] _EdgeTex ("Edge Tex", 2D) = "white" {}
		_EdgeChannel1 ("Edge Channel 1", Vector) = (1,0,0,0)
		_EdgeChannel2 ("Edge Channel 2", Vector) = (1,0,0,0)
		_TerrainLerp ("Terrain Lerp", Range(0, 1)) = 0
		_Width ("Width", Float) = 1200
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
	//CustomEditor "CenturyGame.GameEditor.TerrainLerpDiffuseShader"
}