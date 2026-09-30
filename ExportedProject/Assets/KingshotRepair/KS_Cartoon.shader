Shader "KingshotRepair/Cartoon"
{
    Properties
    {
        _BaseMap ("Base Map", 2D) = "white" {}
        _BaseColor ("Base Color", Color) = (1,1,1,1)
        _MiddleColor ("Middle Color", Color) = (1,1,1,1)
        _MiddleRange ("Middle Range", Range(0,1)) = 0
        _MiddleEdge ("Middle Edge", Range(0,1)) = 0
        _DarkColor ("Dark Color", Color) = (0.45,0.45,0.45,1)
        _DarkRange ("Dark Range", Range(0,1)) = 0
        _DarkEdge ("Dark Edge", Range(0,1)) = 0
        _ShadowStrength ("Shadow Strength", Range(0,1)) = 0.7
        _ShadowColor ("Shadow Color", Color) = (0.42,0.57,0.8,1)
    }

    SubShader
    {
        Tags
        {
            "RenderType"="Opaque"
            "Queue"="Geometry"
        }

        LOD 200
        Cull Back
        ZWrite On

        Pass
        {
            Tags { "LightMode"="ForwardBase" }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            sampler2D _BaseMap;
            float4 _BaseMap_ST;
            fixed4 _BaseColor;
            fixed4 _MiddleColor;
            fixed4 _DarkColor;
            fixed4 _ShadowColor;
            float _ShadowStrength;

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float3 normal : NORMAL;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
                float3 normal : TEXCOORD1;
            };

            v2f vert(appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _BaseMap);
                o.normal = UnityObjectToWorldNormal(v.normal);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                fixed4 tex = tex2D(_BaseMap, i.uv);

                float3 n = normalize(i.normal);

                float3 lightDir =
                    normalize(float3(0.35, 0.8, 0.45));

                float lightAmount =
                    saturate(dot(n, lightDir));

                float toon =
                    lightAmount > 0.55 ? 1.0 :
                    lightAmount > 0.25 ? 0.78 :
                    0.58;

                fixed3 baseCol =
                    tex.rgb * _BaseColor.rgb;

                fixed3 shadowCol =
                    lerp(
                        baseCol,
                        baseCol * _ShadowColor.rgb,
                        _ShadowStrength
                    );

                fixed3 finalCol =
                    lerp(shadowCol, baseCol, toon);

                return fixed4(finalCol, tex.a);
            }
            ENDCG
        }
    }

    FallBack "Diffuse"
}