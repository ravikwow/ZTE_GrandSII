.class final Lcom/android/server/power/ButtonLightController$1;
.super Landroid/database/ContentObserver;
.source "ButtonLightController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/power/ButtonLightController;->setButtonLight(Landroid/content/Context;Landroid/os/Handler;Lcom/android/server/LightsService$Light;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/os/Handler;Landroid/content/Context;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Handler;

    .prologue
    .line 29
    iput-object p2, p0, Lcom/android/server/power/ButtonLightController$1;->val$context:Landroid/content/Context;

    invoke-direct {p0, p1}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 1
    .param p1, "selfChange"    # Z
    .param p2, "uri"    # Landroid/net/Uri;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/android/server/power/ButtonLightController$1;->val$context:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/server/power/ButtonLightController;->updateButtonLightTimeout(Landroid/content/Context;)V

    .line 33
    return-void
.end method
