.class public Lcom/android/server/HandyModeInputFilter;
.super Landroid/view/InputFilter;
.source "HandyModeInputFilter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/HandyModeInputFilter$ClickableRect;,
        Lcom/android/server/HandyModeInputFilter$H;,
        Lcom/android/server/HandyModeInputFilter$KeyData;
    }
.end annotation


# static fields
.field static ENTERED_LISTEN_COMBINATION_KEYS:[[I

.field static NOT_ENTERED_LISTEN_COMBINATION_KEYS:[[I

.field private static sEdgeDistance:F


# instance fields
.field private mClickingRect:Lcom/android/server/HandyModeInputFilter$ClickableRect;

.field mHandler:Lcom/android/server/HandyModeInputFilter$H;

.field mOutsideClickableRects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/server/HandyModeInputFilter$ClickableRect;",
            ">;"
        }
    .end annotation
.end field

.field mPendingKeys:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/android/server/HandyModeInputFilter$KeyData;",
            ">;"
        }
    .end annotation
.end field

.field private mTempPointerCoords:[Landroid/view/MotionEvent$PointerCoords;

.field private mTempPointerProperties:[Landroid/view/MotionEvent$PointerProperties;

.field private mWasInside:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x2

    .line 26
    new-array v0, v2, [[I

    new-array v1, v2, [I

    fill-array-data v1, :array_0

    aput-object v1, v0, v3

    new-array v1, v2, [I

    fill-array-data v1, :array_1

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/server/HandyModeInputFilter;->NOT_ENTERED_LISTEN_COMBINATION_KEYS:[[I

    .line 32
    const/4 v0, 0x4

    new-array v0, v0, [[I

    new-array v1, v2, [I

    fill-array-data v1, :array_2

    aput-object v1, v0, v3

    new-array v1, v2, [I

    fill-array-data v1, :array_3

    aput-object v1, v0, v4

    new-array v1, v2, [I

    fill-array-data v1, :array_4

    aput-object v1, v0, v2

    const/4 v1, 0x3

    new-array v2, v2, [I

    fill-array-data v2, :array_5

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/server/HandyModeInputFilter;->ENTERED_LISTEN_COMBINATION_KEYS:[[I

    return-void

    .line 26
    :array_0
    .array-data 4
        0x3
        0x4
    .end array-data

    :array_1
    .array-data 4
        0x3
        0x52
    .end array-data

    .line 32
    :array_2
    .array-data 4
        0x3
        0x4
    .end array-data

    :array_3
    .array-data 4
        0x3
        0x52
    .end array-data

    :array_4
    .array-data 4
        0x4
        0x3
    .end array-data

    :array_5
    .array-data 4
        0x52
        0x3
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 86
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/view/InputFilter;-><init>(Landroid/os/Looper;)V

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/HandyModeInputFilter;->mOutsideClickableRects:Ljava/util/List;

    .line 87
    new-instance v0, Lcom/android/server/HandyModeInputFilter$H;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/server/HandyModeInputFilter$H;-><init>(Lcom/android/server/HandyModeInputFilter;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/server/HandyModeInputFilter;->mHandler:Lcom/android/server/HandyModeInputFilter$H;

    .line 89
    const/high16 v0, 0x41a00000    # 20.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v0, v1

    sput v0, Lcom/android/server/HandyModeInputFilter;->sEdgeDistance:F

    .line 90
    return-void
.end method

.method private findClickableRect(FF)Lcom/android/server/HandyModeInputFilter$ClickableRect;
    .locals 5
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 204
    iget-object v2, p0, Lcom/android/server/HandyModeInputFilter;->mOutsideClickableRects:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/HandyModeInputFilter$ClickableRect;

    .line 205
    .local v0, "c":Lcom/android/server/HandyModeInputFilter$ClickableRect;
    iget-object v2, v0, Lcom/android/server/HandyModeInputFilter$ClickableRect;->mRect:Landroid/graphics/Rect;

    float-to-int v3, p1

    float-to-int v4, p2

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->contains(II)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 209
    .end local v0    # "c":Lcom/android/server/HandyModeInputFilter$ClickableRect;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getTempPointerCoordsWithMinSize(I)[Landroid/view/MotionEvent$PointerCoords;
    .locals 5
    .param p1, "size"    # I

    .prologue
    const/4 v3, 0x0

    .line 222
    iget-object v4, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    array-length v1, v4

    .line 223
    .local v1, "oldSize":I
    :goto_0
    if-ge v1, p1, :cond_0

    .line 224
    iget-object v2, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    .line 225
    .local v2, "oldTempPointerCoords":[Landroid/view/MotionEvent$PointerCoords;
    new-array v4, p1, [Landroid/view/MotionEvent$PointerCoords;

    iput-object v4, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    .line 226
    if-eqz v2, :cond_0

    .line 227
    iget-object v4, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    invoke-static {v2, v3, v4, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 230
    .end local v2    # "oldTempPointerCoords":[Landroid/view/MotionEvent$PointerCoords;
    :cond_0
    move v0, v1

    .local v0, "i":I
    :goto_1
    if-ge v0, p1, :cond_2

    .line 231
    iget-object v3, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    new-instance v4, Landroid/view/MotionEvent$PointerCoords;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerCoords;-><init>()V

    aput-object v4, v3, v0

    .line 230
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0    # "i":I
    .end local v1    # "oldSize":I
    :cond_1
    move v1, v3

    .line 222
    goto :goto_0

    .line 233
    .restart local v0    # "i":I
    .restart local v1    # "oldSize":I
    :cond_2
    iget-object v3, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerCoords:[Landroid/view/MotionEvent$PointerCoords;

    return-object v3
.end method

.method private getTempPointerPropertiesWithMinSize(I)[Landroid/view/MotionEvent$PointerProperties;
    .locals 5
    .param p1, "size"    # I

    .prologue
    const/4 v3, 0x0

    .line 237
    iget-object v4, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerProperties:[Landroid/view/MotionEvent$PointerProperties;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerProperties:[Landroid/view/MotionEvent$PointerProperties;

    array-length v1, v4

    .line 238
    .local v1, "oldSize":I
    :goto_0
    if-ge v1, p1, :cond_0

    .line 239
    iget-object v2, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerProperties:[Landroid/view/MotionEvent$PointerProperties;

    .line 240
    .local v2, "oldTempPointerProperties":[Landroid/view/MotionEvent$PointerProperties;
    new-array v4, p1, [Landroid/view/MotionEvent$PointerProperties;

    iput-object v4, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerProperties:[Landroid/view/MotionEvent$PointerProperties;

    .line 241
    if-eqz v2, :cond_0

    .line 242
    iget-object v4, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerProperties:[Landroid/view/MotionEvent$PointerProperties;

    invoke-static {v2, v3, v4, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 245
    .end local v2    # "oldTempPointerProperties":[Landroid/view/MotionEvent$PointerProperties;
    :cond_0
    move v0, v1

    .local v0, "i":I
    :goto_1
    if-ge v0, p1, :cond_2

    .line 246
    iget-object v3, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerProperties:[Landroid/view/MotionEvent$PointerProperties;

    new-instance v4, Landroid/view/MotionEvent$PointerProperties;

    invoke-direct {v4}, Landroid/view/MotionEvent$PointerProperties;-><init>()V

    aput-object v4, v3, v0

    .line 245
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0    # "i":I
    .end local v1    # "oldSize":I
    :cond_1
    move v1, v3

    .line 237
    goto :goto_0

    .line 248
    .restart local v0    # "i":I
    .restart local v1    # "oldSize":I
    :cond_2
    iget-object v3, p0, Lcom/android/server/HandyModeInputFilter;->mTempPointerProperties:[Landroid/view/MotionEvent$PointerProperties;

    return-object v3
.end method

.method private isTouchInside(FF)Z
    .locals 2
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    const/4 v1, 0x0

    .line 213
    cmpl-float v0, p1, v1

    if-lez v0, :cond_0

    sget v0, Lcom/android/server/HandyMode;->sScreenWidth:I

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    cmpl-float v0, p2, v1

    if-lez v0, :cond_0

    sget v0, Lcom/android/server/HandyMode;->sScreenHeight:I

    int-to-float v0, v0

    cmpg-float v0, p2, v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isTouchInsideOrEdge(FF)Z
    .locals 2
    .param p1, "x"    # F
    .param p2, "y"    # F

    .prologue
    .line 217
    sget v0, Lcom/android/server/HandyModeInputFilter;->sEdgeDistance:F

    neg-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    sget v0, Lcom/android/server/HandyMode;->sScreenWidth:I

    int-to-float v0, v0

    sget v1, Lcom/android/server/HandyModeInputFilter;->sEdgeDistance:F

    add-float/2addr v0, v1

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    sget v0, Lcom/android/server/HandyModeInputFilter;->sEdgeDistance:F

    neg-float v0, v0

    cmpl-float v0, p2, v0

    if-lez v0, :cond_0

    sget v0, Lcom/android/server/HandyMode;->sScreenHeight:I

    int-to-float v0, v0

    cmpg-float v0, p2, v0

    if-gez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private needDelayKey(Z)Z
    .locals 1
    .param p1, "isSecondKey"    # Z

    .prologue
    .line 257
    invoke-direct {p0}, Lcom/android/server/HandyModeInputFilter;->needShowDialog()Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private needShowDialog()Z
    .locals 1

    .prologue
    .line 252
    invoke-static {}, Lcom/android/server/HandyMode;->getMode()I

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/server/HandyMode;->sHandyModeUtils:Lmiui/util/HandyModeUtils;

    invoke-virtual {v0}, Lmiui/util/HandyModeUtils;->isEnterDirect()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private declared-synchronized onKeyEvent(Landroid/view/KeyEvent;I)V
    .locals 12
    .param p1, "keyEvent"    # Landroid/view/KeyEvent;
    .param p2, "policyFlags"    # I

    .prologue
    const/4 v3, -0x1

    const/4 v2, 0x0

    const/4 v5, 0x1

    .line 265
    monitor-enter p0

    const/4 v9, 0x0

    .line 266
    .local v9, "needDelay":Z
    const/4 v10, 0x0

    .line 267
    .local v10, "needTrigger":Z
    const/4 v7, 0x0

    .line 268
    .local v7, "isSecondKey":Z
    :try_start_0
    iget-object v0, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 323
    :cond_0
    :goto_0
    if-nez v9, :cond_1

    .line 324
    invoke-super {p0, p1, p2}, Landroid/view/InputFilter;->onInputEvent(Landroid/view/InputEvent;I)V

    .line 327
    :cond_1
    if-eqz v10, :cond_2

    .line 328
    invoke-virtual {p0}, Lcom/android/server/HandyModeInputFilter;->triggerCombinationClick()V

    .line 329
    invoke-virtual {p0}, Lcom/android/server/HandyModeInputFilter;->clearPendingList()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 331
    :cond_2
    monitor-exit p0

    return-void

    .line 270
    :pswitch_0
    :try_start_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/server/HandyModeInputFilter;->checkKeyNeedListen(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 272
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/server/HandyModeInputFilter;->needDelayKey(Z)Z

    move-result v9

    .line 273
    invoke-virtual {p1}, Landroid/view/KeyEvent;->copy()Landroid/view/KeyEvent;

    move-result-object v1

    const/4 v3, -0x1

    const/4 v4, 0x1

    if-nez v9, :cond_3

    :goto_1
    move-object v0, p0

    move v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/HandyModeInputFilter;->addPendingData(Landroid/view/KeyEvent;IIZZ)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 265
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_3
    move v5, v2

    .line 273
    goto :goto_1

    .line 278
    :pswitch_1
    :try_start_2
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v5, :cond_4

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    iget-object v0, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/HandyModeInputFilter$KeyData;

    iget-object v0, v0, Lcom/android/server/HandyModeInputFilter$KeyData;->keyEvent:Landroid/view/KeyEvent;

    invoke-virtual {v0}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    if-eq v1, v0, :cond_5

    :cond_4
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_7

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/server/HandyModeInputFilter;->checkSecondKey(I)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 282
    :cond_5
    invoke-direct {p0, v7}, Lcom/android/server/HandyModeInputFilter;->needDelayKey(Z)Z

    move-result v9

    .line 283
    invoke-virtual {p1}, Landroid/view/KeyEvent;->copy()Landroid/view/KeyEvent;

    move-result-object v1

    const/4 v3, -0x1

    const/4 v4, 0x0

    if-nez v9, :cond_6

    :goto_2
    move-object v0, p0

    move v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/HandyModeInputFilter;->addPendingData(Landroid/view/KeyEvent;IIZZ)V

    goto :goto_0

    :cond_6
    move v5, v2

    goto :goto_2

    .line 285
    :cond_7
    invoke-virtual {p0}, Lcom/android/server/HandyModeInputFilter;->flushPending()V

    goto :goto_0

    .line 291
    :pswitch_2
    iget-object v0, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/HandyModeInputFilter$KeyData;

    iget-object v6, v0, Lcom/android/server/HandyModeInputFilter$KeyData;->keyEvent:Landroid/view/KeyEvent;

    .line 292
    .local v6, "firstKeyEvent":Landroid/view/KeyEvent;
    iget-object v0, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/HandyModeInputFilter$KeyData;

    iget-object v8, v0, Lcom/android/server/HandyModeInputFilter$KeyData;->keyEvent:Landroid/view/KeyEvent;

    .line 293
    .local v8, "lastKeyEvent":Landroid/view/KeyEvent;
    invoke-virtual {v8}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v5, :cond_8

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_8

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/server/HandyModeInputFilter;->checkSecondKey(I)Z

    move-result v7

    if-nez v7, :cond_9

    :cond_8
    invoke-virtual {v8}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_c

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v5, :cond_c

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {v6}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    if-ne v0, v1, :cond_c

    .line 300
    :cond_9
    invoke-direct {p0, v7}, Lcom/android/server/HandyModeInputFilter;->needDelayKey(Z)Z

    move-result v9

    .line 301
    invoke-virtual {p1}, Landroid/view/KeyEvent;->copy()Landroid/view/KeyEvent;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_a

    :goto_3
    const/4 v4, 0x1

    if-nez v9, :cond_b

    :goto_4
    move-object v0, p0

    move v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/HandyModeInputFilter;->addPendingData(Landroid/view/KeyEvent;IIZZ)V

    goto/16 :goto_0

    :cond_a
    move v3, v5

    goto :goto_3

    :cond_b
    move v5, v2

    goto :goto_4

    .line 304
    :cond_c
    invoke-virtual {p0}, Lcom/android/server/HandyModeInputFilter;->flushPending()V

    goto/16 :goto_0

    .line 310
    .end local v6    # "firstKeyEvent":Landroid/view/KeyEvent;
    .end local v8    # "lastKeyEvent":Landroid/view/KeyEvent;
    :pswitch_3
    iget-object v0, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/HandyModeInputFilter$KeyData;

    iget-object v11, v0, Lcom/android/server/HandyModeInputFilter$KeyData;->keyEvent:Landroid/view/KeyEvent;

    .line 311
    .local v11, "pendingKeyEvent":Landroid/view/KeyEvent;
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v5, :cond_e

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {v11}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    if-ne v0, v1, :cond_e

    .line 313
    const/4 v10, 0x1

    .line 314
    const/4 v9, 0x1

    .line 315
    invoke-virtual {p1}, Landroid/view/KeyEvent;->copy()Landroid/view/KeyEvent;

    move-result-object v1

    const/4 v3, -0x1

    const/4 v4, 0x1

    if-nez v9, :cond_d

    :goto_5
    move-object v0, p0

    move v2, p2

    invoke-virtual/range {v0 .. v5}, Lcom/android/server/HandyModeInputFilter;->addPendingData(Landroid/view/KeyEvent;IIZZ)V

    goto/16 :goto_0

    :cond_d
    move v5, v2

    goto :goto_5

    .line 317
    :cond_e
    invoke-virtual {p0}, Lcom/android/server/HandyModeInputFilter;->flushPending()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 268
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private onMotionEvent(Landroid/view/MotionEvent;I)V
    .locals 25
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "policyFlags"    # I

    .prologue
    .line 131
    invoke-static {}, Lcom/android/server/HandyMode;->getMode()I

    move-result v20

    .line 132
    .local v20, "mode":I
    if-eqz v20, :cond_9

    .line 133
    const/high16 v3, 0x3f800000    # 1.0f

    sget v4, Lcom/android/server/HandyMode;->sScale:F

    div-float v22, v3, v4

    .line 135
    .local v22, "scaleInverse":F
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v8

    .line 136
    .local v8, "pointerCount":I
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/android/server/HandyModeInputFilter;->getTempPointerCoordsWithMinSize(I)[Landroid/view/MotionEvent$PointerCoords;

    move-result-object v10

    .line 137
    .local v10, "coords":[Landroid/view/MotionEvent$PointerCoords;
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcom/android/server/HandyModeInputFilter;->getTempPointerPropertiesWithMinSize(I)[Landroid/view/MotionEvent$PointerProperties;

    move-result-object v9

    .line 138
    .local v9, "properties":[Landroid/view/MotionEvent$PointerProperties;
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_0
    move/from16 v0, v19

    if-ge v0, v8, :cond_1

    .line 139
    aget-object v3, v10, v19

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Landroid/view/MotionEvent;->getPointerCoords(ILandroid/view/MotionEvent$PointerCoords;)V

    .line 141
    const/4 v3, 0x2

    move/from16 v0, v20

    if-ne v0, v3, :cond_0

    sget v3, Lcom/android/server/HandyMode;->sScreenWidth:I

    int-to-float v0, v3

    move/from16 v23, v0

    .line 142
    .local v23, "xPivot":F
    :goto_1
    aget-object v3, v10, v19

    aget-object v4, v10, v19

    iget v4, v4, Landroid/view/MotionEvent$PointerCoords;->x:F

    const/4 v5, 0x0

    move/from16 v0, v22

    move/from16 v1, v23

    invoke-static {v4, v5, v0, v1}, Lcom/android/server/HandyModeInputFilter;->processCoordinate(FFFF)F

    move-result v4

    iput v4, v3, Landroid/view/MotionEvent$PointerCoords;->x:F

    .line 144
    sget v3, Lcom/android/server/HandyMode;->sScreenHeight:I

    int-to-float v0, v3

    move/from16 v24, v0

    .line 145
    .local v24, "yPivot":F
    aget-object v3, v10, v19

    aget-object v4, v10, v19

    iget v4, v4, Landroid/view/MotionEvent$PointerCoords;->y:F

    const/4 v5, 0x0

    move/from16 v0, v22

    move/from16 v1, v24

    invoke-static {v4, v5, v0, v1}, Lcom/android/server/HandyModeInputFilter;->processCoordinate(FFFF)F

    move-result v4

    iput v4, v3, Landroid/view/MotionEvent$PointerCoords;->y:F

    .line 147
    aget-object v3, v9, v19

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-virtual {v0, v1, v3}, Landroid/view/MotionEvent;->getPointerProperties(ILandroid/view/MotionEvent$PointerProperties;)V

    .line 138
    add-int/lit8 v19, v19, 0x1

    goto :goto_0

    .line 141
    .end local v23    # "xPivot":F
    .end local v24    # "yPivot":F
    :cond_0
    const/16 v23, 0x0

    goto :goto_1

    .line 149
    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v5

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v7

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v11

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v12

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getXPrecision()F

    move-result v13

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getYPrecision()F

    move-result v14

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getDeviceId()I

    move-result v15

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v16

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getSource()I

    move-result v17

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getFlags()I

    move-result v18

    invoke-static/range {v3 .. v18}, Landroid/view/MotionEvent;->obtain(JJII[Landroid/view/MotionEvent$PointerProperties;[Landroid/view/MotionEvent$PointerCoords;IIFFIIII)Landroid/view/MotionEvent;

    move-result-object v21

    .line 164
    .local v21, "newEvent":Landroid/view/MotionEvent;
    const/4 v3, 0x1

    if-ne v8, v3, :cond_8

    .line 165
    invoke-virtual/range {v21 .. v21}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_2

    .line 167
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/server/HandyModeInputFilter;->mWasInside:Z

    .line 168
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/android/server/HandyModeInputFilter;->findClickableRect(FF)Lcom/android/server/HandyModeInputFilter$ClickableRect;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/server/HandyModeInputFilter;->mClickingRect:Lcom/android/server/HandyModeInputFilter$ClickableRect;

    .line 171
    :cond_2
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/server/HandyModeInputFilter;->mWasInside:Z

    if-nez v3, :cond_6

    invoke-virtual/range {v21 .. v21}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual/range {v21 .. v21}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/android/server/HandyModeInputFilter;->isTouchInside(FF)Z

    move-result v3

    if-nez v3, :cond_6

    .line 172
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/HandyModeInputFilter;->mClickingRect:Lcom/android/server/HandyModeInputFilter$ClickableRect;

    if-eqz v3, :cond_3

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/HandyModeInputFilter;->mClickingRect:Lcom/android/server/HandyModeInputFilter$ClickableRect;

    iget-object v3, v3, Lcom/android/server/HandyModeInputFilter$ClickableRect;->mRect:Landroid/graphics/Rect;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->contains(II)Z

    move-result v3

    if-nez v3, :cond_3

    .line 173
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/server/HandyModeInputFilter;->mClickingRect:Lcom/android/server/HandyModeInputFilter$ClickableRect;

    .line 176
    :cond_3
    invoke-virtual/range {v21 .. v21}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_4

    .line 177
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/HandyModeInputFilter;->mClickingRect:Lcom/android/server/HandyModeInputFilter$ClickableRect;

    if-eqz v3, :cond_5

    .line 178
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/server/HandyModeInputFilter;->mClickingRect:Lcom/android/server/HandyModeInputFilter$ClickableRect;

    iget-object v3, v3, Lcom/android/server/HandyModeInputFilter$ClickableRect;->mClickListener:Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    .line 197
    :cond_4
    :goto_2
    invoke-virtual/range {v21 .. v21}, Landroid/view/MotionEvent;->recycle()V

    .line 201
    .end local v8    # "pointerCount":I
    .end local v9    # "properties":[Landroid/view/MotionEvent$PointerProperties;
    .end local v10    # "coords":[Landroid/view/MotionEvent$PointerCoords;
    .end local v19    # "i":I
    .end local v21    # "newEvent":Landroid/view/MotionEvent;
    .end local v22    # "scaleInverse":F
    :goto_3
    return-void

    .line 179
    .restart local v8    # "pointerCount":I
    .restart local v9    # "properties":[Landroid/view/MotionEvent$PointerProperties;
    .restart local v10    # "coords":[Landroid/view/MotionEvent$PointerCoords;
    .restart local v19    # "i":I
    .restart local v21    # "newEvent":Landroid/view/MotionEvent;
    .restart local v22    # "scaleInverse":F
    :cond_5
    invoke-virtual/range {v21 .. v21}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual/range {v21 .. v21}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    move-object/from16 v0, p0

    invoke-direct {v0, v3, v4}, Lcom/android/server/HandyModeInputFilter;->isTouchInsideOrEdge(FF)Z

    move-result v3

    if-nez v3, :cond_4

    .line 180
    const/4 v3, 0x0

    invoke-static {v3}, Lcom/android/server/HandyMode;->changeMode(I)V

    goto :goto_2

    .line 184
    :cond_6
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/server/HandyModeInputFilter;->mWasInside:Z

    if-nez v3, :cond_7

    invoke-virtual/range {v21 .. v21}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_7

    .line 185
    const/4 v3, 0x0

    move-object/from16 v0, v21

    invoke-virtual {v0, v3}, Landroid/view/MotionEvent;->setAction(I)V

    .line 187
    :cond_7
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/android/server/HandyModeInputFilter;->sendInputEvent(Landroid/view/InputEvent;I)V

    .line 188
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/server/HandyModeInputFilter;->mWasInside:Z

    .line 189
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/server/HandyModeInputFilter;->mClickingRect:Lcom/android/server/HandyModeInputFilter$ClickableRect;

    goto :goto_2

    .line 192
    :cond_8
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move/from16 v2, p2

    invoke-virtual {v0, v1, v2}, Lcom/android/server/HandyModeInputFilter;->sendInputEvent(Landroid/view/InputEvent;I)V

    .line 193
    const/4 v3, 0x1

    move-object/from16 v0, p0

    iput-boolean v3, v0, Lcom/android/server/HandyModeInputFilter;->mWasInside:Z

    .line 194
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/android/server/HandyModeInputFilter;->mClickingRect:Lcom/android/server/HandyModeInputFilter$ClickableRect;

    goto :goto_2

    .line 199
    .end local v8    # "pointerCount":I
    .end local v9    # "properties":[Landroid/view/MotionEvent$PointerProperties;
    .end local v10    # "coords":[Landroid/view/MotionEvent$PointerCoords;
    .end local v19    # "i":I
    .end local v21    # "newEvent":Landroid/view/MotionEvent;
    .end local v22    # "scaleInverse":F
    :cond_9
    invoke-super/range {p0 .. p2}, Landroid/view/InputFilter;->onInputEvent(Landroid/view/InputEvent;I)V

    goto :goto_3
.end method

.method static processCoordinate(FFFF)F
    .locals 1
    .param p0, "coordValue"    # F
    .param p1, "offset"    # F
    .param p2, "scale"    # F
    .param p3, "scalePivot"    # F

    .prologue
    .line 127
    sub-float v0, p3, p0

    mul-float/2addr v0, p2

    sub-float v0, p3, v0

    sub-float/2addr v0, p1

    return v0
.end method


# virtual methods
.method public addOutsideClickableRect(Landroid/graphics/Rect;Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "rect"    # Landroid/graphics/Rect;
    .param p2, "listener"    # Ljava/lang/Runnable;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/android/server/HandyModeInputFilter;->mOutsideClickableRects:Ljava/util/List;

    new-instance v1, Lcom/android/server/HandyModeInputFilter$ClickableRect;

    invoke-direct {v1, p1, p2}, Lcom/android/server/HandyModeInputFilter$ClickableRect;-><init>(Landroid/graphics/Rect;Ljava/lang/Runnable;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    return-void
.end method

.method declared-synchronized addPendingData(Landroid/view/KeyEvent;IIZZ)V
    .locals 6
    .param p1, "keyEvent"    # Landroid/view/KeyEvent;
    .param p2, "policyFlags"    # I
    .param p3, "index"    # I
    .param p4, "delayEnhance"    # Z
    .param p5, "isSended"    # Z

    .prologue
    const/4 v1, 0x1

    .line 399
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/android/server/HandyModeInputFilter;->mHandler:Lcom/android/server/HandyModeInputFilter$H;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/server/HandyModeInputFilter$H;->removeMessages(I)V

    .line 401
    new-instance v0, Lcom/android/server/HandyModeInputFilter$KeyData;

    invoke-direct {v0}, Lcom/android/server/HandyModeInputFilter$KeyData;-><init>()V

    .line 402
    .local v0, "keyData":Lcom/android/server/HandyModeInputFilter$KeyData;
    iput-object p1, v0, Lcom/android/server/HandyModeInputFilter$KeyData;->keyEvent:Landroid/view/KeyEvent;

    .line 403
    iput p2, v0, Lcom/android/server/HandyModeInputFilter$KeyData;->policyFlags:I

    .line 404
    iput-boolean p5, v0, Lcom/android/server/HandyModeInputFilter$KeyData;->isSended:Z

    .line 405
    if-gez p3, :cond_1

    .line 406
    iget-object v2, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 411
    :goto_0
    iget-object v2, p0, Lcom/android/server/HandyModeInputFilter;->mHandler:Lcom/android/server/HandyModeInputFilter$H;

    const/4 v3, 0x1

    sget v4, Lcom/android/server/HandyMode;->COMBINATION_CLICK_TIMEOUT:I

    if-eqz p4, :cond_0

    const/4 v1, 0x2

    :cond_0
    mul-int/2addr v1, v4

    int-to-long v4, v1

    invoke-virtual {v2, v3, v4, v5}, Lcom/android/server/HandyModeInputFilter$H;->sendEmptyMessageDelayed(IJ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 413
    monitor-exit p0

    return-void

    .line 408
    :cond_1
    :try_start_1
    iget-object v2, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    invoke-interface {v2, p3, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 399
    .end local v0    # "keyData":Lcom/android/server/HandyModeInputFilter$KeyData;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method checkKeyNeedListen(I)Z
    .locals 5
    .param p1, "keyCode"    # I

    .prologue
    const/4 v3, 0x0

    .line 334
    invoke-virtual {p0}, Lcom/android/server/HandyModeInputFilter;->getListenCombinationKeys()[[I

    move-result-object v2

    .line 335
    .local v2, "listenCombinationKeys":[[I
    array-length v0, v2

    .line 336
    .local v0, "N":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 337
    aget-object v4, v2, v1

    aget v4, v4, v3

    if-ne v4, p1, :cond_1

    .line 338
    const/4 v3, 0x1

    .line 341
    :cond_0
    return v3

    .line 336
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method checkSecondKey(I)Z
    .locals 8
    .param p1, "secondKeyCode"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 353
    invoke-virtual {p0}, Lcom/android/server/HandyModeInputFilter;->getListenCombinationKeys()[[I

    move-result-object v4

    .line 354
    .local v4, "listenCombinationKeys":[[I
    iget-object v5, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/server/HandyModeInputFilter$KeyData;

    iget-object v5, v5, Lcom/android/server/HandyModeInputFilter$KeyData;->keyEvent:Landroid/view/KeyEvent;

    invoke-virtual {v5}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    .line 355
    .local v1, "firstKeyCode":I
    array-length v0, v4

    .line 356
    .local v0, "N":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 357
    aget-object v3, v4, v2

    .line 358
    .local v3, "keySequence":[I
    aget v5, v3, v7

    if-ne v5, v1, :cond_0

    aget v5, v3, v6

    if-ne v5, p1, :cond_0

    move v5, v6

    .line 362
    .end local v3    # "keySequence":[I
    :goto_1
    return v5

    .line 356
    .restart local v3    # "keySequence":[I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v3    # "keySequence":[I
    :cond_1
    move v5, v7

    .line 362
    goto :goto_1
.end method

.method declared-synchronized clearPendingList()V
    .locals 2

    .prologue
    .line 416
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/server/HandyModeInputFilter;->mHandler:Lcom/android/server/HandyModeInputFilter$H;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/server/HandyModeInputFilter$H;->removeMessages(I)V

    .line 417
    iget-object v0, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 418
    monitor-exit p0

    return-void

    .line 416
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized flushPending()V
    .locals 4

    .prologue
    .line 389
    monitor-enter p0

    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 390
    iget-object v2, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/HandyModeInputFilter$KeyData;

    .line 391
    .local v1, "keyData":Lcom/android/server/HandyModeInputFilter$KeyData;
    iget-boolean v2, v1, Lcom/android/server/HandyModeInputFilter$KeyData;->isSended:Z

    if-nez v2, :cond_0

    .line 392
    iget-object v3, v1, Lcom/android/server/HandyModeInputFilter$KeyData;->keyEvent:Landroid/view/KeyEvent;

    iget-object v2, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/HandyModeInputFilter$KeyData;

    iget v2, v2, Lcom/android/server/HandyModeInputFilter$KeyData;->policyFlags:I

    invoke-virtual {p0, v3, v2}, Lcom/android/server/HandyModeInputFilter;->sendInputEvent(Landroid/view/InputEvent;I)V

    .line 389
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 395
    .end local v1    # "keyData":Lcom/android/server/HandyModeInputFilter$KeyData;
    :cond_1
    invoke-virtual {p0}, Lcom/android/server/HandyModeInputFilter;->clearPendingList()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 396
    monitor-exit p0

    return-void

    .line 389
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method getListenCombinationKeys()[[I
    .locals 1

    .prologue
    .line 345
    invoke-static {}, Lcom/android/server/HandyMode;->getMode()I

    move-result v0

    if-nez v0, :cond_0

    .line 346
    sget-object v0, Lcom/android/server/HandyModeInputFilter;->NOT_ENTERED_LISTEN_COMBINATION_KEYS:[[I

    .line 348
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/android/server/HandyModeInputFilter;->ENTERED_LISTEN_COMBINATION_KEYS:[[I

    goto :goto_0
.end method

.method public onInputEvent(Landroid/view/InputEvent;I)V
    .locals 1
    .param p1, "event"    # Landroid/view/InputEvent;
    .param p2, "policyFlags"    # I

    .prologue
    .line 106
    sget-boolean v0, Lcom/android/server/HandyMode;->sEnable:Z

    if-eqz v0, :cond_1

    .line 107
    instance-of v0, p1, Landroid/view/MotionEvent;

    if-eqz v0, :cond_0

    const/16 v0, 0x1002

    invoke-virtual {p1, v0}, Landroid/view/InputEvent;->isFromSource(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    check-cast p1, Landroid/view/MotionEvent;

    .end local p1    # "event":Landroid/view/InputEvent;
    invoke-direct {p0, p1, p2}, Lcom/android/server/HandyModeInputFilter;->onMotionEvent(Landroid/view/MotionEvent;I)V

    .line 116
    :goto_0
    return-void

    .line 110
    .restart local p1    # "event":Landroid/view/InputEvent;
    :cond_0
    instance-of v0, p1, Landroid/view/KeyEvent;

    if-eqz v0, :cond_1

    const/16 v0, 0x101

    invoke-virtual {p1, v0}, Landroid/view/InputEvent;->isFromSource(I)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 111
    check-cast p1, Landroid/view/KeyEvent;

    .end local p1    # "event":Landroid/view/InputEvent;
    invoke-direct {p0, p1, p2}, Lcom/android/server/HandyModeInputFilter;->onKeyEvent(Landroid/view/KeyEvent;I)V

    goto :goto_0

    .line 115
    .restart local p1    # "event":Landroid/view/InputEvent;
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/view/InputFilter;->onInputEvent(Landroid/view/InputEvent;I)V

    goto :goto_0
.end method

.method public onUninstalled()V
    .locals 1

    .prologue
    .line 120
    invoke-super {p0}, Landroid/view/InputFilter;->onUninstalled()V

    .line 121
    invoke-static {}, Lcom/android/server/HandyMode;->getMode()I

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/android/server/HandyMode;->changeMode(I)V

    .line 124
    :cond_0
    return-void
.end method

.method public removeOutsideClickableRect(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "listener"    # Ljava/lang/Runnable;

    .prologue
    .line 97
    iget-object v1, p0, Lcom/android/server/HandyModeInputFilter;->mOutsideClickableRects:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 98
    iget-object v1, p0, Lcom/android/server/HandyModeInputFilter;->mOutsideClickableRects:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/HandyModeInputFilter$ClickableRect;

    iget-object v1, v1, Lcom/android/server/HandyModeInputFilter$ClickableRect;->mClickListener:Ljava/lang/Runnable;

    if-ne v1, p1, :cond_0

    .line 99
    iget-object v1, p0, Lcom/android/server/HandyModeInputFilter;->mOutsideClickableRects:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 97
    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 102
    :cond_1
    return-void
.end method

.method declared-synchronized triggerCombinationClick()V
    .locals 4

    .prologue
    .line 366
    monitor-enter p0

    :try_start_0
    sget-object v1, Lcom/android/server/HandyMode;->sContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "screen_buttons_state"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    .line 386
    :goto_0
    monitor-exit p0

    return-void

    .line 370
    :cond_0
    const/4 v0, 0x0

    .line 371
    .local v0, "newMode":I
    :try_start_1
    iget-object v1, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/HandyModeInputFilter$KeyData;

    iget-object v1, v1, Lcom/android/server/HandyModeInputFilter$KeyData;->keyEvent:Landroid/view/KeyEvent;

    invoke-virtual {v1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_3

    .line 372
    const/4 v0, 0x2

    .line 377
    :cond_1
    :goto_1
    invoke-static {}, Lcom/android/server/HandyMode;->getMode()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 378
    const/4 v0, 0x0

    .line 381
    :cond_2
    invoke-direct {p0}, Lcom/android/server/HandyModeInputFilter;->needShowDialog()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 382
    invoke-static {v0}, Lcom/android/server/HandyMode;->alertToEnter(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 366
    .end local v0    # "newMode":I
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 373
    .restart local v0    # "newMode":I
    :cond_3
    :try_start_2
    iget-object v1, p0, Lcom/android/server/HandyModeInputFilter;->mPendingKeys:Ljava/util/List;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/HandyModeInputFilter$KeyData;

    iget-object v1, v1, Lcom/android/server/HandyModeInputFilter$KeyData;->keyEvent:Landroid/view/KeyEvent;

    invoke-virtual {v1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    const/16 v2, 0x52

    if-ne v1, v2, :cond_1

    .line 374
    const/4 v0, 0x1

    goto :goto_1

    .line 384
    :cond_4
    invoke-static {v0}, Lcom/android/server/HandyMode;->changeMode(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method
