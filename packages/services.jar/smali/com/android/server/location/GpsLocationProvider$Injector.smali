.class Lcom/android/server/location/GpsLocationProvider$Injector;
.super Ljava/lang/Object;
.source "GpsLocationProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/location/GpsLocationProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Injector"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static appendUidExtra(Lcom/android/server/location/GpsLocationProvider;Landroid/content/Intent;)V
    .locals 4
    .param p0, "provider"    # Lcom/android/server/location/GpsLocationProvider;
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v3, 0x0

    .line 102
    invoke-virtual {p0}, Lcom/android/server/location/GpsLocationProvider;->getClientSource()Landroid/os/WorkSource;

    move-result-object v0

    .line 103
    .local v0, "clientSource":Landroid/os/WorkSource;
    invoke-virtual {p0}, Lcom/android/server/location/GpsLocationProvider;->getNavigating()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/os/WorkSource;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 104
    const-string v1, "android.intent.extra.UID"

    invoke-virtual {v0, v3}, Landroid/os/WorkSource;->get(I)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 105
    const-string v1, "android.intent.extra.PACKAGES"

    invoke-virtual {v0, v3}, Landroid/os/WorkSource;->getName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 107
    :cond_0
    return-void
.end method
