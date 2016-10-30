.class final Lcom/android/server/HandyMode$5;
.super Ljava/lang/Object;
.source "HandyMode.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/HandyMode;->refreshStatus()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$mode:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 196
    iput p1, p0, Lcom/android/server/HandyMode$5;->val$mode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 198
    iget v0, p0, Lcom/android/server/HandyMode$5;->val$mode:I

    invoke-static {v0}, Lcom/android/server/HandyMode;->changeMode(I)V

    .line 199
    return-void
.end method
