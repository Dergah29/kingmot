Shader "KingshotRepair/CartoonTree"
{
    Properties
    {
        _BaseColor ("Main Color", Color) = (0.52,0.52,0.52,1)
        _MiddleColor ("Middle Color", Color) = (0.44,0.44,0.43,1)
        _DarkColor ("Dark Color", Color) = (0.4,0.4,0.4,1)
        _ShadowColor ("Shadow Color", Color) = (0.06,0.29,0.38,1)
        _NoiseMap ("Noise Tex", 2D) = "white" {}
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            sampler2D _NoiseMap;
            float4 _NoiseMap_ST;
            fixed4 _BaseColor;
            fixed4 _MiddleColor;
            fixed4 _DarkColor;

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float3 normal : TEXCOORD0;
                float2 uv : TEXCOORD1;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.normal = UnityObjectToWorldNormal(v.normal);
                o.uv = TRANSFORM_TEX(v.uv, _NoiseMap);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                float3 n = normalize(i.normal);
                float lightValue = saturate(dot(n, normalize(float3(0.4, 0.8, 0.3))));

                fixed3 col;

                if (lightValue > 0.65)
                    col = _BaseColor.rgb;
                else if (lightValue > 0.3)
                    col = _MiddleColor.rgb;
                else
                    col = _DarkColor.rgb;

                return fixed4(col, 1.0);
            }
            ENDCG
        }
    }

    Fallback "Diffuse"
}