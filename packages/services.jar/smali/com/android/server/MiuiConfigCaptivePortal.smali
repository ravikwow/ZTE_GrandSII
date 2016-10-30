.class public Lcom/android/server/MiuiConfigCaptivePortal;
.super Ljava/lang/Object;
.source "MiuiConfigCaptivePortal.java"


# static fields
.field private static final CN_CAPTIVE_PORTAL_SERVER:Ljava/lang/String; = "connect.rom.miui.com"

.field private static final CN_OPERATOR:Ljava/lang/String; = "460"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final getCaptivePortalServer(Landroid/content/Context;Ljava/lang/String;)Ljava/net/URL;
    .locals 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 22
    const-string v7, "phone"

    invoke-virtual {p0, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/telephony/TelephonyManager;

    .line 23
    .local v6, "telephonyManager":Landroid/telephony/TelephonyManager;
    invoke-virtual {v6}, Landroid/telephony/TelephonyManager;->getNetworkOperator()Ljava/lang/String;

    move-result-object v2

    .line 24
    .local v2, "networkOperator":Ljava/lang/String;
    const/4 v3, 0x0

    .line 27
    .local v3, "reUrl":Ljava/net/URL;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_0

    const-string v7, "CN"

    invoke-static {v7}, Lmiui/os/Build;->checkRegion(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    :cond_0
    invoke-static {v2}, Lcom/android/server/MiuiConfigCaptivePortal;->isCnFromOperator(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 30
    :cond_1
    :try_start_0
    new-instance v4, Ljava/net/URL;

    const-string v7, "http"

    const-string v8, "connect.rom.miui.com"

    const-string v9, "/generate_204"

    invoke-direct {v4, v7, v8, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_4

    .end local v3    # "reUrl":Ljava/net/URL;
    .local v4, "reUrl":Ljava/net/URL;
    move-object v3, v4

    .line 57
    .end local v4    # "reUrl":Ljava/net/URL;
    .restart local v3    # "reUrl":Ljava/net/URL;
    :goto_0
    return-object v3

    .line 33
    :cond_2
    if-eqz p1, :cond_3

    const-string v7, "http"

    invoke-virtual {p1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 34
    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "captive_portal_server"

    invoke-static {v7, v8}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 37
    .local v5, "server":Ljava/lang/String;
    if-nez v5, :cond_4

    .line 39
    :try_start_1
    const-string v7, "com.android.server.connectivity.NetworkMonitor"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const-string v8, "DEFAULT_SERVER"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 40
    .local v1, "dsFiled":Ljava/lang/reflect/Field;
    const/4 v7, 0x1

    invoke-virtual {v1, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 41
    const/4 v7, 0x0

    invoke-virtual {v1, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    move-object v0, v7

    check-cast v0, Ljava/lang/String;

    move-object v5, v0
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 48
    .end local v1    # "dsFiled":Ljava/lang/reflect/Field;
    :cond_4
    :goto_1
    :try_start_2
    new-instance v4, Ljava/net/URL;

    const-string v7, "http"

    const-string v8, "/generate_204"

    invoke-direct {v4, v7, v5, v8}, Ljava/net/URL;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_1

    .end local v3    # "reUrl":Ljava/net/URL;
    .restart local v4    # "reUrl":Ljava/net/URL;
    move-object v3, v4

    .line 50
    .end local v4    # "reUrl":Ljava/net/URL;
    .restart local v3    # "reUrl":Ljava/net/URL;
    goto :goto_0

    .line 53
    .end local v5    # "server":Ljava/lang/String;
    :cond_5
    :try_start_3
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_0

    .end local v3    # "reUrl":Ljava/net/URL;
    .restart local v4    # "reUrl":Ljava/net/URL;
    move-object v3, v4

    .line 55
    .end local v4    # "reUrl":Ljava/net/URL;
    .restart local v3    # "reUrl":Ljava/net/URL;
    goto :goto_0

    .line 54
    :catch_0
    move-exception v7

    goto :goto_0

    .line 49
    .restart local v5    # "server":Ljava/lang/String;
    :catch_1
    move-exception v7

    goto :goto_0

    .line 43
    :catch_2
    move-exception v7

    goto :goto_1

    .line 42
    :catch_3
    move-exception v7

    goto :goto_1

    .line 31
    .end local v5    # "server":Ljava/lang/String;
    :catch_4
    move-exception v7

    goto :goto_0
.end method

.method static isCnFromOperator(Ljava/lang/String;)Z
    .locals 3
    .param p0, "operator"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x3

    .line 61
    const-string v0, ""

    .line 62
    .local v0, "mcc":Ljava/lang/String;
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, v2, :cond_0

    .line 63
    const/4 v1, 0x0

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 65
    :cond_0
    const-string v1, "460"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method
