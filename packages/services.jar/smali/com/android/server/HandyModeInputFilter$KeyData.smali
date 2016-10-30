.class Lcom/android/server/HandyModeInputFilter$KeyData;
.super Ljava/lang/Object;
.source "HandyModeInputFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/HandyModeInputFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "KeyData"
.end annotation


# instance fields
.field isSended:Z

.field keyEvent:Landroid/view/KeyEvent;

.field policyFlags:I


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
