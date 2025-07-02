; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [406 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [806 x i64] [
	i64 15690660930947125, ; 0: Microsoft.DotNet.PlatformAbstractions.dll => 0x37be92af148835 => 222
	i64 24362543149721218, ; 1: Xamarin.AndroidX.DynamicAnimation => 0x568d9a9a43a682 => 308
	i64 98382396393917666, ; 2: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 248
	i64 120698629574877762, ; 3: Mono.Android => 0x1accec39cafe242 => 171
	i64 131669012237370309, ; 4: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 262
	i64 160518225272466977, ; 5: Microsoft.Extensions.Hosting.Abstractions => 0x23a4679b5576e21 => 238
	i64 196720943101637631, ; 6: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 58
	i64 210515253464952879, ; 7: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 295
	i64 229794953483747371, ; 8: System.ValueTuple.dll => 0x330654aed93802b => 151
	i64 232391251801502327, ; 9: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 336
	i64 295915112840604065, ; 10: Xamarin.AndroidX.SlidingPaneLayout => 0x41b4d3a3088a9a1 => 339
	i64 316157742385208084, ; 11: Xamarin.AndroidX.Core.Core.Ktx.dll => 0x46337caa7dc1b14 => 302
	i64 350667413455104241, ; 12: System.ServiceProcess.dll => 0x4ddd227954be8f1 => 132
	i64 374214195677100225, ; 13: Microsoft.CodeAnalysis.Razor => 0x53179d40b3df8c1 => 220
	i64 396868157601372792, ; 14: Microsoft.VisualStudio.DesignTools.TapContract => 0x581f57c947e5a78 => 401
	i64 422779754995088667, ; 15: System.IO.UnmanagedMemoryStream => 0x5de03f27ab57d1b => 56
	i64 435118502366263740, ; 16: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 338
	i64 482535784737928357, ; 17: Microsoft.AspNetCore.Diagnostics.Abstractions.dll => 0x6b24fbd58b7f4a5 => 186
	i64 535107122908063503, ; 18: Microsoft.Extensions.ObjectPool.dll => 0x76d1517d9b7670f => 246
	i64 545109961164950392, ; 19: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 370
	i64 560278790331054453, ; 20: System.Reflection.Primitives => 0x7c6829760de3975 => 95
	i64 634256334200181332, ; 21: Microsoft.CodeAnalysis.CSharp.dll => 0x8cd54c6888b1254 => 219
	i64 634308326490598313, ; 22: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x8cd840fee8b6ba9 => 321
	i64 649145001856603771, ; 23: System.Security.SecureString => 0x90239f09b62167b => 129
	i64 670564002081277297, ; 24: Microsoft.Identity.Client.dll => 0x94e526837380571 => 250
	i64 702024105029695270, ; 25: System.Drawing.Common => 0x9be17343c0e7726 => 271
	i64 750875890346172408, ; 26: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 145
	i64 798450721097591769, ; 27: Xamarin.AndroidX.Collection.Ktx.dll => 0xb14aab351ad2bd9 => 296
	i64 799765834175365804, ; 28: System.ComponentModel.dll => 0xb1956c9f18442ac => 18
	i64 849051935479314978, ; 29: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 373
	i64 864641107619353643, ; 30: Microsoft.AspNetCore.Mvc.DataAnnotations => 0xbffd2819dda142b => 202
	i64 872800313462103108, ; 31: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 307
	i64 895210737996778430, ; 32: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0xc6c6d6c5569cbbe => 322
	i64 937459790420187032, ; 33: Microsoft.SqlServer.Server.dll => 0xd0286b667351798 => 265
	i64 940822596282819491, ; 34: System.Transactions => 0xd0e792aa81923a3 => 150
	i64 960778385402502048, ; 35: System.Runtime.Handles.dll => 0xd555ed9e1ca1ba0 => 104
	i64 982068613551266738, ; 36: Microsoft.AspNetCore.ResponseCaching.Abstractions.dll => 0xda1023367c89bb2 => 213
	i64 1001381392624924420, ; 37: Microsoft.AspNetCore.Authentication.Core.dll => 0xde59f1230183704 => 178
	i64 1010599046655515943, ; 38: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 95
	i64 1060858978308751610, ; 39: Azure.Core.dll => 0xeb8ed9ebee080fa => 173
	i64 1120440138749646132, ; 40: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 351
	i64 1121665720830085036, ; 41: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 381
	i64 1268860745194512059, ; 42: System.Drawing.dll => 0x119be62002c19ebb => 36
	i64 1278906455852160409, ; 43: Microsoft.EntityFrameworkCore.SqlServer.dll => 0x11bf96a54a059599 => 226
	i64 1301626418029409250, ; 44: System.Diagnostics.FileVersionInfo => 0x12104e54b4e833e2 => 28
	i64 1315114680217950157, ; 45: Xamarin.AndroidX.Arch.Core.Common.dll => 0x124039d5794ad7cd => 291
	i64 1369545283391376210, ; 46: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 329
	i64 1404195534211153682, ; 47: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 50
	i64 1425944114962822056, ; 48: System.Runtime.Serialization.dll => 0x13c9f89e19eaf3a8 => 115
	i64 1476839205573959279, ; 49: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 70
	i64 1486715745332614827, ; 50: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 259
	i64 1492954217099365037, ; 51: System.Net.HttpListener => 0x14b809f350210aad => 65
	i64 1513467482682125403, ; 52: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 170
	i64 1537168428375924959, ; 53: System.Threading.Thread.dll => 0x15551e8a954ae0df => 145
	i64 1556147632182429976, ; 54: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 379
	i64 1576750169145655260, ; 55: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x15e1bdecc376bfdc => 350
	i64 1624659445732251991, ; 56: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 290
	i64 1628611045998245443, ; 57: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 325
	i64 1636321030536304333, ; 58: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0x16b5614ec39e16cd => 315
	i64 1639340239664632727, ; 59: Microsoft.AspNetCore.Cryptography.Internal.dll => 0x16c01b432b36d397 => 182
	i64 1651782184287836205, ; 60: System.Globalization.Calendars => 0x16ec4f2524cb982d => 40
	i64 1659332977923810219, ; 61: System.Reflection.DispatchProxy => 0x1707228d493d63ab => 89
	i64 1682513316613008342, ; 62: System.Net.dll => 0x17597cf276952bd6 => 81
	i64 1731380447121279447, ; 63: Newtonsoft.Json => 0x18071957e9b889d7 => 267
	i64 1735388228521408345, ; 64: System.Net.Mail.dll => 0x181556663c69b759 => 66
	i64 1743969030606105336, ; 65: System.Memory.dll => 0x1833d297e88f2af8 => 62
	i64 1767386781656293639, ; 66: System.Private.Uri.dll => 0x188704e9f5582107 => 86
	i64 1795316252682057001, ; 67: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 289
	i64 1825687700144851180, ; 68: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 106
	i64 1835311033149317475, ; 69: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 369
	i64 1836611346387731153, ; 70: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 336
	i64 1854145951182283680, ; 71: System.Runtime.CompilerServices.VisualC => 0x19bb3feb3df2e3a0 => 102
	i64 1865037103900624886, ; 72: Microsoft.Bcl.AsyncInterfaces => 0x19e1f15d56eb87f6 => 217
	i64 1875417405349196092, ; 73: System.Drawing.Primitives => 0x1a06d2319b6c713c => 35
	i64 1875917498431009007, ; 74: Xamarin.AndroidX.Annotation.dll => 0x1a08990699eb70ef => 286
	i64 1881198190668717030, ; 75: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 391
	i64 1897575647115118287, ; 76: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 338
	i64 1920760634179481754, ; 77: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 260
	i64 1959996714666907089, ; 78: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 391
	i64 1972384582241139858, ; 79: Microsoft.CodeAnalysis.CSharp => 0x1b5f5153d0f0bc92 => 219
	i64 1972385128188460614, ; 80: System.Security.Cryptography.Algorithms => 0x1b5f51d2edefbe46 => 119
	i64 1981742497975770890, ; 81: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 323
	i64 1983698669889758782, ; 82: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 365
	i64 2019660174692588140, ; 83: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 383
	i64 2040001226662520565, ; 84: System.Threading.Tasks.Extensions.dll => 0x1c4f8a4ea894a6f5 => 142
	i64 2062890601515140263, ; 85: System.Threading.Tasks.Dataflow => 0x1ca0dc1289cd44a7 => 141
	i64 2064708342624596306, ; 86: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x1ca7514c5eecb152 => 359
	i64 2080945842184875448, ; 87: System.IO.MemoryMappedFiles => 0x1ce10137d8416db8 => 53
	i64 2102659300918482391, ; 88: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 35
	i64 2106033277907880740, ; 89: System.Threading.Tasks.Dataflow.dll => 0x1d3a221ba6d9cb24 => 141
	i64 2133195048986300728, ; 90: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 267
	i64 2165310824878145998, ; 91: Xamarin.Android.Glide.GifDecoder => 0x1e0cbab9112b81ce => 283
	i64 2165725771938924357, ; 92: Xamarin.AndroidX.Browser => 0x1e0e341d75540745 => 293
	i64 2192948757939169934, ; 93: Microsoft.EntityFrameworkCore.Abstractions.dll => 0x1e6eeb46cf992a8e => 224
	i64 2200176636225660136, ; 94: Microsoft.Extensions.Logging.Debug.dll => 0x1e8898fe5d5824e8 => 245
	i64 2262844636196693701, ; 95: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 307
	i64 2269733267185212154, ; 96: Microsoft.AspNetCore.Html.Abstractions.dll => 0x1f7fb66185761afa => 189
	i64 2287834202362508563, ; 97: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 8
	i64 2287887973817120656, ; 98: System.ComponentModel.DataAnnotations.dll => 0x1fc035fd8d41f790 => 14
	i64 2302323944321350744, ; 99: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 387
	i64 2304837677853103545, ; 100: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0x1ffc6da80d5ed5b9 => 335
	i64 2315304989185124968, ; 101: System.IO.FileSystem.dll => 0x20219d9ee311aa68 => 51
	i64 2316229908869312383, ; 102: Microsoft.IdentityModel.Protocols.OpenIdConnect => 0x2024e6d4884a6f7f => 256
	i64 2329709569556905518, ; 103: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 318
	i64 2335503487726329082, ; 104: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 136
	i64 2337758774805907496, ; 105: System.Runtime.CompilerServices.Unsafe => 0x207163383edbc828 => 101
	i64 2414730492268170344, ; 106: Microsoft.AspNetCore.Mvc.Localization.dll => 0x2182d896c3f2cc68 => 204
	i64 2470498323731680442, ; 107: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 300
	i64 2479423007379663237, ; 108: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x2268ae16b2cba985 => 345
	i64 2497223385847772520, ; 109: System.Runtime => 0x22a7eb7046413568 => 116
	i64 2547086958574651984, ; 110: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 284
	i64 2554797818648757682, ; 111: System.Runtime.Caching.dll => 0x23747714858085b2 => 274
	i64 2592350477072141967, ; 112: System.Xml.dll => 0x23f9e10627330e8f => 163
	i64 2602673633151553063, ; 113: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 390
	i64 2606170708597053130, ; 114: Microsoft.AspNetCore.Identity.EntityFrameworkCore => 0x242afa738df496ca => 194
	i64 2612152650457191105, ; 115: Microsoft.IdentityModel.Tokens.dll => 0x24403afeed9892c1 => 257
	i64 2624866290265602282, ; 116: mscorlib.dll => 0x246d65fbde2db8ea => 166
	i64 2632269733008246987, ; 117: System.Net.NameResolution => 0x2487b36034f808cb => 67
	i64 2656907746661064104, ; 118: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 231
	i64 2662981627730767622, ; 119: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 365
	i64 2706075432581334785, ; 120: System.Net.WebSockets => 0x258de944be6c0701 => 80
	i64 2783046991838674048, ; 121: System.Runtime.CompilerServices.Unsafe.dll => 0x269f5e7e6dc37c80 => 101
	i64 2787234703088983483, ; 122: Xamarin.AndroidX.Startup.StartupRuntime => 0x26ae3f31ef429dbb => 340
	i64 2789714023057451704, ; 123: Microsoft.IdentityModel.JsonWebTokens.dll => 0x26b70e1f9943eab8 => 253
	i64 2815524396660695947, ; 124: System.Security.AccessControl => 0x2712c0857f68238b => 117
	i64 2851879596360956261, ; 125: System.Configuration.ConfigurationManager => 0x2793e9620b477965 => 270
	i64 2895129759130297543, ; 126: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 370
	i64 2923871038697555247, ; 127: Jsr305Binding => 0x2893ad37e69ec52f => 352
	i64 2974029546067041986, ; 128: Microsoft.AspNetCore.Mvc.Formatters.Json.dll => 0x2945e01d74d79ec2 => 203
	i64 3017136373564924869, ; 129: System.Net.WebProxy => 0x29df058bd93f63c5 => 78
	i64 3017704767998173186, ; 130: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 351
	i64 3021884968805928991, ; 131: Microsoft.AspNetCore.Authorization.Policy => 0x29efe45e55c5101f => 180
	i64 3062772059105072826, ; 132: Microsoft.VisualStudio.DesignTools.MobileTapContracts => 0x2a8126f5e2f316ba => 400
	i64 3063847325783385934, ; 133: System.ClientModel.dll => 0x2a84f8e8eb59674e => 269
	i64 3106852385031680087, ; 134: System.Runtime.Serialization.Xml => 0x2b1dc1c88b637057 => 114
	i64 3110390492489056344, ; 135: System.Security.Cryptography.Csp.dll => 0x2b2a53ac61900058 => 121
	i64 3135773902340015556, ; 136: System.IO.FileSystem.DriveInfo.dll => 0x2b8481c008eac5c4 => 48
	i64 3168817962471953758, ; 137: Microsoft.Extensions.Hosting.Abstractions.dll => 0x2bf9e725d304955e => 238
	i64 3168887168596639127, ; 138: Microsoft.AspNetCore.Mvc.Razor.Extensions.dll => 0x2bfa2617217efd97 => 206
	i64 3238539556702659506, ; 139: Microsoft.Win32.SystemEvents.dll => 0x2cf19a917c5023b2 => 266
	i64 3266690593535380875, ; 140: Microsoft.AspNetCore.Authorization => 0x2d559dc982c94d8b => 179
	i64 3281594302220646930, ; 141: System.Security.Principal => 0x2d8a90a198ceba12 => 128
	i64 3289520064315143713, ; 142: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 316
	i64 3303437397778967116, ; 143: Xamarin.AndroidX.Annotation.Experimental => 0x2dd82acf985b2a4c => 287
	i64 3311221304742556517, ; 144: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 82
	i64 3325875462027654285, ; 145: System.Runtime.Numerics => 0x2e27e21c8958b48d => 110
	i64 3328853167529574890, ; 146: System.Net.Sockets.dll => 0x2e327651a008c1ea => 75
	i64 3344514922410554693, ; 147: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 362
	i64 3396143930648122816, ; 148: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 235
	i64 3402534845034375023, ; 149: System.IdentityModel.Tokens.Jwt.dll => 0x2f383b6a0629a76f => 272
	i64 3429672777697402584, ; 150: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 262
	i64 3437845325506641314, ; 151: System.IO.MemoryMappedFiles.dll => 0x2fb5ae1beb8f7da2 => 53
	i64 3493805808809882663, ; 152: Xamarin.AndroidX.Tracing.Tracing.dll => 0x307c7ddf444f3427 => 342
	i64 3494946837667399002, ; 153: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 229
	i64 3508450208084372758, ; 154: System.Net.Ping => 0x30b084e02d03ad16 => 69
	i64 3522470458906976663, ; 155: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 341
	i64 3523004241079211829, ; 156: Microsoft.Extensions.Caching.Memory.dll => 0x30e439b10bb89735 => 228
	i64 3531994851595924923, ; 157: System.Numerics => 0x31042a9aade235bb => 83
	i64 3551103847008531295, ; 158: System.Private.CoreLib.dll => 0x31480e226177735f => 172
	i64 3567343442040498961, ; 159: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 385
	i64 3571415421602489686, ; 160: System.Runtime.dll => 0x319037675df7e556 => 116
	i64 3590588409150456806, ; 161: CesiZenMobileApp.dll => 0x31d45522660c43e6 => 0
	i64 3638003163729360188, ; 162: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 230
	i64 3647754201059316852, ; 163: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 156
	i64 3655542548057982301, ; 164: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 229
	i64 3659371656528649588, ; 165: Xamarin.Android.Glide.Annotations => 0x32c8b3222885dd74 => 281
	i64 3716579019761409177, ; 166: netstandard.dll => 0x3393f0ed5c8c5c99 => 167
	i64 3727469159507183293, ; 167: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 334
	i64 3772598417116884899, ; 168: Xamarin.AndroidX.DynamicAnimation.dll => 0x345af645b473efa3 => 308
	i64 3869221888984012293, ; 169: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 243
	i64 3869649043256705283, ; 170: System.Diagnostics.Tools => 0x35b3c14d74bf0103 => 32
	i64 3890352374528606784, ; 171: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 260
	i64 3919223565570527920, ; 172: System.Security.Cryptography.Encoding => 0x3663e111652bd2b0 => 122
	i64 3933965368022646939, ; 173: System.Net.Requests => 0x369840a8bfadc09b => 72
	i64 3966267475168208030, ; 174: System.Memory => 0x370b03412596249e => 62
	i64 4005135229510678782, ; 175: Microsoft.AspNetCore.DataProtection.Abstractions => 0x379519456862f8fe => 185
	i64 4006972109285359177, ; 176: System.Xml.XmlDocument => 0x379b9fe74ed9fe49 => 161
	i64 4009997192427317104, ; 177: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 113
	i64 4073500526318903918, ; 178: System.Private.Xml.dll => 0x3887fb25779ae26e => 88
	i64 4073631083018132676, ; 179: Microsoft.Maui.Controls.Compatibility.dll => 0x388871e311491cc4 => 258
	i64 4120493066591692148, ; 180: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 396
	i64 4148881117810174540, ; 181: System.Runtime.InteropServices.JavaScript.dll => 0x3993c9651a66aa4c => 105
	i64 4154383907710350974, ; 182: System.ComponentModel => 0x39a7562737acb67e => 18
	i64 4167269041631776580, ; 183: System.Threading.ThreadPool => 0x39d51d1d3df1cf44 => 146
	i64 4168469861834746866, ; 184: System.Security.Claims.dll => 0x39d96140fb94ebf2 => 118
	i64 4187479170553454871, ; 185: System.Linq.Expressions => 0x3a1cea1e912fa117 => 58
	i64 4201423742386704971, ; 186: Xamarin.AndroidX.Core.Core.Ktx => 0x3a4e74a233da124b => 302
	i64 4202567570116092282, ; 187: Newtonsoft.Json.Bson => 0x3a5284f05958a17a => 268
	i64 4205801962323029395, ; 188: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 17
	i64 4225924121207573736, ; 189: Microsoft.AspNetCore.Authentication.Abstractions => 0x3aa57f992c550ce8 => 177
	i64 4235503420553921860, ; 190: System.IO.IsolatedStorage.dll => 0x3ac787eb9b118544 => 52
	i64 4243591448627561453, ; 191: Microsoft.AspNetCore.Http.Extensions.dll => 0x3ae443f06354c3ed => 192
	i64 4250192876909962317, ; 192: Microsoft.AspNetCore.Hosting.Abstractions => 0x3afbb7e72f1d244d => 187
	i64 4282138915307457788, ; 193: System.Reflection.Emit => 0x3b6d36a7ddc70cfc => 92
	i64 4297871196403809295, ; 194: CesiZenModel => 0x3ba51b1500083c0f => 398
	i64 4321177614414309855, ; 195: Microsoft.VisualStudio.DesignTools.MobileTapContracts.dll => 0x3bf7e8254e88e9df => 400
	i64 4356591372459378815, ; 196: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 393
	i64 4373617458794931033, ; 197: System.IO.Pipes.dll => 0x3cb235e806eb2359 => 55
	i64 4388777479429739993, ; 198: Microsoft.Maui.Controls.HotReload.Forms.dll => 0x3ce811dd63a4d5d9 => 399
	i64 4397634830160618470, ; 199: System.Security.SecureString.dll => 0x3d0789940f9be3e6 => 129
	i64 4431618353714093320, ; 200: Microsoft.AspNetCore.Antiforgery => 0x3d804569b93add08 => 176
	i64 4477672992252076438, ; 201: System.Web.HttpUtility.dll => 0x3e23e3dcdb8ba196 => 152
	i64 4484706122338676047, ; 202: System.Globalization.Extensions.dll => 0x3e3ce07510042d4f => 41
	i64 4513320955448359355, ; 203: Microsoft.EntityFrameworkCore.Relational => 0x3ea2897f12d379bb => 225
	i64 4533124835995628778, ; 204: System.Reflection.Emit.dll => 0x3ee8e505540534ea => 92
	i64 4612482779465751747, ; 205: Microsoft.EntityFrameworkCore.Abstractions => 0x4002d4a662a99cc3 => 224
	i64 4636684751163556186, ; 206: Xamarin.AndroidX.VersionedParcelable.dll => 0x4058d0370893015a => 346
	i64 4659385769810716620, ; 207: Microsoft.AspNetCore.Identity.EntityFrameworkCore.dll => 0x40a976abd113e7cc => 194
	i64 4672453897036726049, ; 208: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 50
	i64 4679594760078841447, ; 209: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 363
	i64 4716677666592453464, ; 210: System.Xml.XmlSerializer => 0x417501590542f358 => 162
	i64 4743821336939966868, ; 211: System.ComponentModel.Annotations => 0x41d5705f4239b194 => 13
	i64 4759461199762736555, ; 212: Xamarin.AndroidX.Lifecycle.Process.dll => 0x420d00be961cc5ab => 320
	i64 4794310189461587505, ; 213: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 284
	i64 4795410492532947900, ; 214: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 341
	i64 4809057822547766521, ; 215: System.Drawing => 0x42bd349c3145ecf9 => 36
	i64 4814660307502931973, ; 216: System.Net.NameResolution.dll => 0x42d11c0a5ee2a005 => 67
	i64 4853321196694829351, ; 217: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 109
	i64 5055365687667823624, ; 218: Xamarin.AndroidX.Activity.Ktx.dll => 0x4628444ef7239408 => 285
	i64 5081566143765835342, ; 219: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 99
	i64 5099468265966638712, ; 220: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 99
	i64 5103417709280584325, ; 221: System.Collections.Specialized => 0x46d2fb5e161b6285 => 11
	i64 5112836352847824253, ; 222: Microsoft.AspNetCore.WebUtilities.dll => 0x46f47192ee32c57d => 216
	i64 5177565741364132164, ; 223: Microsoft.AspNetCore.Http => 0x47da689c1f3db944 => 190
	i64 5182934613077526976, ; 224: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 11
	i64 5205316157927637098, ; 225: Xamarin.AndroidX.LocalBroadcastManager => 0x483cff7778e0c06a => 327
	i64 5223612245689175824, ; 226: Microsoft.AspNetCore.Mvc.Localization => 0x487dffa95caf0f10 => 204
	i64 5244375036463807528, ; 227: System.Diagnostics.Contracts.dll => 0x48c7c34f4d59fc28 => 25
	i64 5262971552273843408, ; 228: System.Security.Principal.dll => 0x4909d4be0c44c4d0 => 128
	i64 5278787618751394462, ; 229: System.Net.WebClient.dll => 0x4942055efc68329e => 76
	i64 5280980186044710147, ; 230: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x4949cf7fd7123d03 => 319
	i64 5290786973231294105, ; 231: System.Runtime.Loader => 0x496ca6b869b72699 => 109
	i64 5376510917114486089, ; 232: Xamarin.AndroidX.VectorDrawable.Animated => 0x4a9d3431719e5d49 => 345
	i64 5408338804355907810, ; 233: Xamarin.AndroidX.Transition => 0x4b0e477cea9840e2 => 343
	i64 5423376490970181369, ; 234: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 106
	i64 5440320908473006344, ; 235: Microsoft.VisualBasic.Core => 0x4b7fe70acda9f908 => 2
	i64 5446034149219586269, ; 236: System.Diagnostics.Debug => 0x4b94333452e150dd => 26
	i64 5451019430259338467, ; 237: Xamarin.AndroidX.ConstraintLayout.dll => 0x4ba5e94a845c2ce3 => 298
	i64 5457765010617926378, ; 238: System.Xml.Serialization => 0x4bbde05c557002ea => 157
	i64 5471532531798518949, ; 239: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 389
	i64 5488847537322884930, ; 240: System.Windows.Extensions => 0x4c2c4dc108687f42 => 279
	i64 5507995362134886206, ; 241: System.Core.dll => 0x4c705499688c873e => 21
	i64 5522859530602327440, ; 242: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 392
	i64 5527431512186326818, ; 243: System.IO.FileSystem.Primitives.dll => 0x4cb561acbc2a8f22 => 49
	i64 5570799893513421663, ; 244: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 43
	i64 5573260873512690141, ; 245: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5574231584441077149, ; 246: Xamarin.AndroidX.Annotation.Jvm => 0x4d5ba617ae5f8d9d => 288
	i64 5591791169662171124, ; 247: System.Linq.Parallel => 0x4d9a087135e137f4 => 59
	i64 5593115988096097561, ; 248: Microsoft.AspNetCore.Routing.dll => 0x4d9ebd5b8a069d19 => 214
	i64 5610815111739789596, ; 249: Microsoft.AspNetCore.Authentication.Core => 0x4ddd9e9de3a4d11c => 178
	i64 5650097808083101034, ; 250: System.Security.Cryptography.Algorithms.dll => 0x4e692e055d01a56a => 119
	i64 5692067934154308417, ; 251: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 348
	i64 5724799082821825042, ; 252: Xamarin.AndroidX.ExifInterface => 0x4f72926f3e13b212 => 311
	i64 5741990095351817038, ; 253: Microsoft.Extensions.Localization.Abstractions.dll => 0x4fafa591c141a34e => 242
	i64 5757522595884336624, ; 254: Xamarin.AndroidX.Concurrent.Futures.dll => 0x4fe6d44bd9f885f0 => 297
	i64 5783556987928984683, ; 255: Microsoft.VisualBasic => 0x504352701bbc3c6b => 3
	i64 5896680224035167651, ; 256: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x51d5376bfbafdda3 => 317
	i64 5959344983920014087, ; 257: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x52b3d8b05c8ef307 => 337
	i64 5979151488806146654, ; 258: System.Formats.Asn1 => 0x52fa3699a489d25e => 38
	i64 5984759512290286505, ; 259: System.Security.Cryptography.Primitives => 0x530e23115c33dba9 => 124
	i64 6068057819846744445, ; 260: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 386
	i64 6102788177522843259, ; 261: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0x54b1758374b3de7b => 337
	i64 6200764641006662125, ; 262: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 386
	i64 6222399776351216807, ; 263: System.Text.Json.dll => 0x565a67a0ffe264a7 => 137
	i64 6251069312384999852, ; 264: System.Transactions.Local => 0x56c0426b870da1ac => 149
	i64 6278736998281604212, ; 265: System.Private.DataContractSerialization => 0x57228e08a4ad6c74 => 85
	i64 6284145129771520194, ; 266: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 90
	i64 6319713645133255417, ; 267: Xamarin.AndroidX.Lifecycle.Runtime => 0x57b42213b45b52f9 => 321
	i64 6357457916754632952, ; 268: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 402
	i64 6401687960814735282, ; 269: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 318
	i64 6459596646370694080, ; 270: Microsoft.AspNetCore.JsonPatch.dll => 0x59a518eceb3ad3c0 => 195
	i64 6478287442656530074, ; 271: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 374
	i64 6504860066809920875, ; 272: Xamarin.AndroidX.Browser.dll => 0x5a45e7c43bd43d6b => 293
	i64 6548213210057960872, ; 273: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 304
	i64 6557084851308642443, ; 274: Xamarin.AndroidX.Window.dll => 0x5aff71ee6c58c08b => 349
	i64 6560151584539558821, ; 275: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 247
	i64 6589202984700901502, ; 276: Xamarin.Google.ErrorProne.Annotations.dll => 0x5b718d34180a787e => 354
	i64 6591971792923354531, ; 277: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x5b7b636b7e9765a3 => 319
	i64 6617685658146568858, ; 278: System.Text.Encoding.CodePages => 0x5bd6be0b4905fa9a => 133
	i64 6702137467294796250, ; 279: Microsoft.AspNetCore.Mvc.Razor => 0x5d02c6845df149da => 205
	i64 6713440830605852118, ; 280: System.Reflection.TypeExtensions.dll => 0x5d2aeeddb8dd7dd6 => 96
	i64 6739853162153639747, ; 281: Microsoft.VisualBasic.dll => 0x5d88c4bde075ff43 => 3
	i64 6743165466166707109, ; 282: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 382
	i64 6772837112740759457, ; 283: System.Runtime.InteropServices.JavaScript => 0x5dfdf378527ec7a1 => 105
	i64 6777482997383978746, ; 284: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 385
	i64 6786606130239981554, ; 285: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 33
	i64 6798329586179154312, ; 286: System.Windows => 0x5e5884bd523ca188 => 154
	i64 6814185388980153342, ; 287: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 158
	i64 6876862101832370452, ; 288: System.Xml.Linq => 0x5f6f85a57d108914 => 155
	i64 6894844156784520562, ; 289: System.Numerics.Vectors => 0x5faf683aead1ad72 => 82
	i64 6911788284027924527, ; 290: Microsoft.AspNetCore.Hosting.Server.Abstractions => 0x5feb9ad2f830f02f => 188
	i64 7011053663211085209, ; 291: Xamarin.AndroidX.Fragment.Ktx => 0x614c442918e5dd99 => 313
	i64 7060448593242414269, ; 292: System.Security.Cryptography.Xml => 0x61fbc096731edcbd => 277
	i64 7060896174307865760, ; 293: System.Threading.Tasks.Parallel.dll => 0x61fd57a90988f4a0 => 143
	i64 7083547580668757502, ; 294: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 87
	i64 7101497697220435230, ; 295: System.Configuration => 0x628d9687c0141d1e => 19
	i64 7103753931438454322, ; 296: Xamarin.AndroidX.Interpolator.dll => 0x62959a90372c7632 => 314
	i64 7105430439328552570, ; 297: System.Security.Cryptography.Pkcs => 0x629b8f56a06d167a => 275
	i64 7112547816752919026, ; 298: System.IO.FileSystem => 0x62b4d88e3189b1f2 => 51
	i64 7123594442286643413, ; 299: Microsoft.AspNetCore.Razor.Runtime => 0x62dc1767207138d5 => 212
	i64 7192745174564810625, ; 300: Xamarin.Android.Glide.GifDecoder.dll => 0x63d1c3a0a1d72f81 => 283
	i64 7220009545223068405, ; 301: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 389
	i64 7270811800166795866, ; 302: System.Linq => 0x64e71ccf51a90a5a => 61
	i64 7299370801165188114, ; 303: System.IO.Pipes.AccessControl.dll => 0x654c9311e74f3c12 => 54
	i64 7316205155833392065, ; 304: Microsoft.Win32.Primitives => 0x658861d38954abc1 => 4
	i64 7331765743953618630, ; 305: Microsoft.AspNetCore.Http.dll => 0x65bfaa1948bba6c6 => 190
	i64 7338192458477945005, ; 306: System.Reflection => 0x65d67f295d0740ad => 97
	i64 7348123982286201829, ; 307: System.Memory.Data.dll => 0x65f9c7d471b2a3e5 => 273
	i64 7349431895026339542, ; 308: Xamarin.Android.Glide.DiskLruCache => 0x65fe6d5e9bf88ed6 => 282
	i64 7377312882064240630, ; 309: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 17
	i64 7473077275758116397, ; 310: Microsoft.DotNet.PlatformAbstractions => 0x67b5b430309b3e2d => 222
	i64 7488575175965059935, ; 311: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 155
	i64 7489048572193775167, ; 312: System.ObjectModel => 0x67ee71ff6b419e3f => 84
	i64 7496222613193209122, ; 313: System.IdentityModel.Tokens.Jwt => 0x6807eec000a1b522 => 272
	i64 7592577537120840276, ; 314: System.Diagnostics.Process => 0x695e410af5b2aa54 => 29
	i64 7637303409920963731, ; 315: System.IO.Compression.ZipFile.dll => 0x69fd26fcb637f493 => 45
	i64 7654504624184590948, ; 316: System.Net.Http => 0x6a3a4366801b8264 => 64
	i64 7694700312542370399, ; 317: System.Net.Mail => 0x6ac9112a7e2cda5f => 66
	i64 7708790323521193081, ; 318: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 380
	i64 7714652370974252055, ; 319: System.Private.CoreLib => 0x6b0ff375198b9c17 => 172
	i64 7725404731275645577, ; 320: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x6b3626ac11ce9289 => 322
	i64 7735176074855944702, ; 321: Microsoft.CSharp => 0x6b58dda848e391fe => 1
	i64 7735352534559001595, ; 322: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 357
	i64 7791074099216502080, ; 323: System.IO.FileSystem.AccessControl.dll => 0x6c1f749d468bcd40 => 47
	i64 7820441508502274321, ; 324: System.Data => 0x6c87ca1e14ff8111 => 24
	i64 7824823231109474690, ; 325: Microsoft.AspNetCore.Authorization.Policy.dll => 0x6c975b4560812982 => 180
	i64 7836164640616011524, ; 326: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 290
	i64 7919757340696389605, ; 327: Microsoft.Extensions.Diagnostics.Abstractions => 0x6de8a157378027e5 => 234
	i64 7972383140441761405, ; 328: Microsoft.Extensions.Caching.Abstractions.dll => 0x6ea3983a0b58267d => 227
	i64 8025517457475554965, ; 329: WindowsBase => 0x6f605d9b4786ce95 => 165
	i64 8031450141206250471, ; 330: System.Runtime.Intrinsics.dll => 0x6f757159d9dc03e7 => 108
	i64 8064050204834738623, ; 331: System.Collections.dll => 0x6fe942efa61731bf => 12
	i64 8083354569033831015, ; 332: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 316
	i64 8085230611270010360, ; 333: System.Net.Http.Json.dll => 0x703482674fdd05f8 => 63
	i64 8087206902342787202, ; 334: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 27
	i64 8103644804370223335, ; 335: System.Data.DataSetExtensions.dll => 0x7075ee03be6d50e7 => 23
	i64 8113615946733131500, ; 336: System.Reflection.Extensions => 0x70995ab73cf916ec => 93
	i64 8138277578025671259, ; 337: Microsoft.AspNetCore.Cors => 0x70f0f856b9bf1a5b => 181
	i64 8167236081217502503, ; 338: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 168
	i64 8185542183669246576, ; 339: System.Collections => 0x7198e33f4794aa70 => 12
	i64 8187640529827139739, ; 340: Xamarin.KotlinX.Coroutines.Android => 0x71a057ae90f0109b => 361
	i64 8234598844743906698, ; 341: Microsoft.Identity.Client.Extensions.Msal.dll => 0x72472c0540cd758a => 251
	i64 8246048515196606205, ; 342: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 263
	i64 8264926008854159966, ; 343: System.Diagnostics.Process.dll => 0x72b2ea6a64a3a25e => 29
	i64 8290740647658429042, ; 344: System.Runtime.Extensions => 0x730ea0b15c929a72 => 103
	i64 8318905602908530212, ; 345: System.ComponentModel.DataAnnotations => 0x7372b092055ea624 => 14
	i64 8342572048615572890, ; 346: Microsoft.AspNetCore.Cors.dll => 0x73c6c513ced5859a => 181
	i64 8368701292315763008, ; 347: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8398329775253868912, ; 348: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x748cdc6f3097d170 => 299
	i64 8399132193771933415, ; 349: Microsoft.Extensions.WebEncoders => 0x748fb63acf52cee7 => 249
	i64 8400357532724379117, ; 350: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 331
	i64 8410671156615598628, ; 351: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 91
	i64 8426919725312979251, ; 352: Xamarin.AndroidX.Lifecycle.Process => 0x74f26ed7aa033133 => 320
	i64 8442828414178614895, ; 353: Microsoft.AspNetCore.Cryptography.KeyDerivation => 0x752af3b5eeb0de6f => 183
	i64 8453144032365170736, ; 354: Microsoft.Extensions.Identity.Stores.dll => 0x754f99b5f456d030 => 240
	i64 8476857680833348370, ; 355: System.Security.Permissions.dll => 0x75a3d925fd9d0312 => 278
	i64 8513291706828295435, ; 356: Microsoft.SqlServer.Server => 0x762549b3b6c78d0b => 265
	i64 8518412311883997971, ; 357: System.Collections.Immutable => 0x76377add7c28e313 => 9
	i64 8519205576476231015, ; 358: Microsoft.AspNetCore.Mvc.Core.dll => 0x763a4c55ca648567 => 200
	i64 8563666267364444763, ; 359: System.Private.Uri => 0x76d841191140ca5b => 86
	i64 8598790081731763592, ; 360: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x77550a055fc61d88 => 310
	i64 8601935802264776013, ; 361: Xamarin.AndroidX.Transition.dll => 0x7760370982b4ed4d => 343
	i64 8611142787134128904, ; 362: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 0x7780ecbdb94c0308 => 188
	i64 8614108721271900878, ; 363: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 384
	i64 8623059219396073920, ; 364: System.Net.Quic.dll => 0x77ab42ac514299c0 => 71
	i64 8626175481042262068, ; 365: Java.Interop => 0x77b654e585b55834 => 168
	i64 8638972117149407195, ; 366: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 1
	i64 8639588376636138208, ; 367: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 330
	i64 8648495978913578441, ; 368: Microsoft.Win32.Registry.dll => 0x7805a1456889bdc9 => 5
	i64 8677882282824630478, ; 369: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 384
	i64 8684531736582871431, ; 370: System.IO.Compression.FileSystem => 0x7885a79a0fa0d987 => 44
	i64 8725526185868997716, ; 371: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 27
	i64 8853378295825400934, ; 372: Xamarin.Kotlin.StdLib.Common.dll => 0x7add84a720d38466 => 358
	i64 8886598895004054153, ; 373: Microsoft.AspNetCore.Mvc.Cors.dll => 0x7b538a9c9e187289 => 201
	i64 8893249077141143629, ; 374: Microsoft.AspNetCore.Mvc.ApiExplorer.dll => 0x7b6b2aeace11804d => 199
	i64 8941376889969657626, ; 375: System.Xml.XDocument => 0x7c1626e87187471a => 158
	i64 8951477988056063522, ; 376: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0x7c3a09cd9ccf5e22 => 333
	i64 8954753533646919997, ; 377: System.Runtime.Serialization.Json => 0x7c45ace50032d93d => 112
	i64 8955323522379913726, ; 378: Microsoft.Identity.Client => 0x7c47b34bd82799fe => 250
	i64 9045785047181495996, ; 379: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 394
	i64 9052662452269567435, ; 380: Microsoft.IdentityModel.Protocols => 0x7da184898b0b4dcb => 255
	i64 9111603110219107042, ; 381: Microsoft.Extensions.Caching.Memory => 0x7e72eac0def44ae2 => 228
	i64 9138683372487561558, ; 382: System.Security.Cryptography.Csp => 0x7ed3201bc3e3d156 => 121
	i64 9250544137016314866, ; 383: Microsoft.EntityFrameworkCore => 0x806088e191ee0bf2 => 223
	i64 9312692141327339315, ; 384: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 348
	i64 9324707631942237306, ; 385: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 289
	i64 9413000421947348542, ; 386: Microsoft.AspNetCore.Hosting.Abstractions.dll => 0x82a1b202f4c6163e => 187
	i64 9427266486299436557, ; 387: Microsoft.IdentityModel.Logging.dll => 0x82d460ebe6d2a60d => 254
	i64 9468215723722196442, ; 388: System.Xml.XPath.XDocument.dll => 0x8365dc09353ac5da => 159
	i64 9500688326720985260, ; 389: Microsoft.EntityFrameworkCore.SqlServer => 0x83d939b243e798ac => 226
	i64 9508211702228543126, ; 390: Microsoft.AspNetCore.Cryptography.KeyDerivation.dll => 0x83f3f42aa08b6696 => 183
	i64 9554839972845591462, ; 391: System.ServiceModel.Web => 0x84999c54e32a1ba6 => 131
	i64 9575902398040817096, ; 392: Xamarin.Google.Crypto.Tink.Android.dll => 0x84e4707ee708bdc8 => 353
	i64 9584643793929893533, ; 393: System.IO.dll => 0x85037ebfbbd7f69d => 57
	i64 9659729154652888475, ; 394: System.Text.RegularExpressions => 0x860e407c9991dd9b => 138
	i64 9662334977499516867, ; 395: System.Numerics.dll => 0x8617827802b0cfc3 => 83
	i64 9667360217193089419, ; 396: System.Diagnostics.StackTrace => 0x86295ce5cd89898b => 30
	i64 9678050649315576968, ; 397: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 300
	i64 9702891218465930390, ; 398: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 10
	i64 9780093022148426479, ; 399: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x87b9dec9576efaef => 350
	i64 9808709177481450983, ; 400: Mono.Android.dll => 0x881f890734e555e7 => 171
	i64 9819168441846169364, ; 401: Microsoft.IdentityModel.Protocols.dll => 0x8844b1ac75f77f14 => 255
	i64 9825649861376906464, ; 402: Xamarin.AndroidX.Concurrent.Futures => 0x885bb87d8abc94e0 => 297
	i64 9834056768316610435, ; 403: System.Transactions.dll => 0x8879968718899783 => 150
	i64 9836529246295212050, ; 404: System.Reflection.Metadata => 0x88825f3bbc2ac012 => 94
	i64 9864374015518639636, ; 405: Microsoft.AspNetCore.Cryptography.Internal => 0x88e54be746950614 => 182
	i64 9907349773706910547, ; 406: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x897dfa20b758db53 => 310
	i64 9933555792566666578, ; 407: System.Linq.Queryable.dll => 0x89db145cf475c552 => 60
	i64 9938556199016768930, ; 408: Microsoft.AspNetCore.Routing => 0x89ecd834cea6a5a2 => 214
	i64 9956195530459977388, ; 409: Microsoft.Maui => 0x8a2b8315b36616ac => 261
	i64 9974604633896246661, ; 410: System.Xml.Serialization.dll => 0x8a6cea111a59dd85 => 157
	i64 9991543690424095600, ; 411: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 369
	i64 9994308163963284983, ; 412: Newtonsoft.Json.Bson.dll => 0x8ab2ea52b0d16df7 => 268
	i64 10017511394021241210, ; 413: Microsoft.Extensions.Logging.Debug => 0x8b055989ae10717a => 245
	i64 10038780035334861115, ; 414: System.Net.Http.dll => 0x8b50e941206af13b => 64
	i64 10051358222726253779, ; 415: System.Private.Xml => 0x8b7d990c97ccccd3 => 88
	i64 10078727084704864206, ; 416: System.Net.WebSockets.Client => 0x8bded4e257f117ce => 79
	i64 10089571585547156312, ; 417: System.IO.FileSystem.AccessControl => 0x8c055be67469bb58 => 47
	i64 10092835686693276772, ; 418: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 259
	i64 10105485790837105934, ; 419: System.Threading.Tasks.Parallel => 0x8c3de5c91d9a650e => 143
	i64 10143853363526200146, ; 420: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 366
	i64 10226222362177979215, ; 421: Xamarin.Kotlin.StdLib.Jdk7 => 0x8dead70ebbc6434f => 359
	i64 10229024438826829339, ; 422: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 304
	i64 10236703004850800690, ; 423: System.Net.ServicePoint.dll => 0x8e101325834e4832 => 74
	i64 10243523786148452761, ; 424: Microsoft.AspNetCore.Http.Abstractions => 0x8e284e9c69a49999 => 191
	i64 10245369515835430794, ; 425: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 91
	i64 10252714262739571204, ; 426: Microsoft.Maui.Controls.HotReload.Forms => 0x8e48f54cfe2c5204 => 399
	i64 10321854143672141184, ; 427: Xamarin.Jetbrains.Annotations.dll => 0x8f3e97a7f8f8c580 => 356
	i64 10357309525532190134, ; 428: Microsoft.AspNetCore.Mvc.RazorPages.dll => 0x8fbc8e235a1da5b6 => 207
	i64 10360651442923773544, ; 429: System.Text.Encoding => 0x8fc86d98211c1e68 => 135
	i64 10364469296367737616, ; 430: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 90
	i64 10376576884623852283, ; 431: Xamarin.AndroidX.Tracing.Tracing => 0x900101b2f888c2fb => 342
	i64 10406448008575299332, ; 432: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 362
	i64 10430153318873392755, ; 433: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 301
	i64 10447083246144586668, ; 434: Microsoft.Bcl.AsyncInterfaces.dll => 0x90fb7edc816203ac => 217
	i64 10458986597687352396, ; 435: Microsoft.AspNetCore.Routing.Abstractions => 0x9125c8e581b9dc4c => 215
	i64 10506226065143327199, ; 436: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 364
	i64 10521980565667308266, ; 437: Microsoft.AspNetCore.Razor.dll => 0x920595939e29e2ea => 210
	i64 10546663366131771576, ; 438: System.Runtime.Serialization.Json.dll => 0x925d4673efe8e8b8 => 112
	i64 10566960649245365243, ; 439: System.Globalization.dll => 0x92a562b96dcd13fb => 42
	i64 10580371928413268116, ; 440: CesiZenMobileApp => 0x92d5083630966894 => 0
	i64 10595762989148858956, ; 441: System.Xml.XPath.XDocument => 0x930bb64cc472ea4c => 159
	i64 10670374202010151210, ; 442: Microsoft.Win32.Primitives.dll => 0x9414c8cd7b4ea92a => 4
	i64 10714184849103829812, ; 443: System.Runtime.Extensions.dll => 0x94b06e5aa4b4bb34 => 103
	i64 10785150219063592792, ; 444: System.Net.Primitives => 0x95ac8cfb68830758 => 70
	i64 10811915265162633087, ; 445: Microsoft.EntityFrameworkCore.Relational.dll => 0x960ba3a651a45f7f => 225
	i64 10822644899632537592, ; 446: System.Linq.Queryable => 0x9631c23204ca5ff8 => 60
	i64 10830817578243619689, ; 447: System.Formats.Tar => 0x964ecb340a447b69 => 39
	i64 10847732767863316357, ; 448: Xamarin.AndroidX.Arch.Core.Common => 0x968ae37a86db9f85 => 291
	i64 10889380495983713167, ; 449: Microsoft.Data.SqlClient.dll => 0x971ed9dddf2d1b8f => 221
	i64 10899834349646441345, ; 450: System.Web => 0x9743fd975946eb81 => 153
	i64 10929237632997888614, ; 451: Microsoft.AspNetCore.Html.Abstractions => 0x97ac73b8bcab9266 => 189
	i64 10943875058216066601, ; 452: System.IO.UnmanagedMemoryStream.dll => 0x97e07461df39de29 => 56
	i64 10964653383833615866, ; 453: System.Diagnostics.Tracing => 0x982a4628ccaffdfa => 34
	i64 10972388274974066310, ; 454: Microsoft.AspNetCore.Razor.Language => 0x9845c1007b7d8686 => 211
	i64 11002576679268595294, ; 455: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 244
	i64 11009005086950030778, ; 456: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 261
	i64 11019817191295005410, ; 457: Xamarin.AndroidX.Annotation.Jvm.dll => 0x98ee415998e1b2e2 => 288
	i64 11023048688141570732, ; 458: System.Core => 0x98f9bc61168392ac => 21
	i64 11037814507248023548, ; 459: System.Xml => 0x992e31d0412bf7fc => 163
	i64 11047101296015504039, ; 460: Microsoft.Win32.SystemEvents => 0x994f301942c2f2a7 => 266
	i64 11050168729868392624, ; 461: Microsoft.AspNetCore.Http.Features => 0x995a15e9dbef58b0 => 193
	i64 11051904132540108364, ; 462: Microsoft.Extensions.FileProviders.Composite.dll => 0x99604040c7b98e4c => 236
	i64 11071824625609515081, ; 463: Xamarin.Google.ErrorProne.Annotations => 0x99a705d600e0a049 => 354
	i64 11103970607964515343, ; 464: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 375
	i64 11136029745144976707, ; 465: Jsr305Binding.dll => 0x9a8b200d4f8cd543 => 352
	i64 11162124722117608902, ; 466: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 347
	i64 11188319605227840848, ; 467: System.Threading.Overlapped => 0x9b44e5671724e550 => 140
	i64 11220793807500858938, ; 468: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 378
	i64 11226290749488709958, ; 469: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 247
	i64 11235648312900863002, ; 470: System.Reflection.DispatchProxy.dll => 0x9bed0a9c8fac441a => 89
	i64 11329751333533450475, ; 471: System.Threading.Timer.dll => 0x9d3b5ccf6cc500eb => 147
	i64 11340910727871153756, ; 472: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 303
	i64 11341245327015630248, ; 473: System.Configuration.ConfigurationManager.dll => 0x9d643289535355a8 => 270
	i64 11347436699239206956, ; 474: System.Xml.XmlSerializer.dll => 0x9d7a318e8162502c => 162
	i64 11392833485892708388, ; 475: Xamarin.AndroidX.Print.dll => 0x9e1b79b18fcf6824 => 332
	i64 11432101114902388181, ; 476: System.AppContext => 0x9ea6fb64e61a9dd5 => 6
	i64 11446671985764974897, ; 477: Mono.Android.Export => 0x9edabf8623efc131 => 169
	i64 11448276831755070604, ; 478: System.Diagnostics.TextWriterTraceListener => 0x9ee0731f77186c8c => 31
	i64 11485890710487134646, ; 479: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 107
	i64 11508496261504176197, ; 480: Xamarin.AndroidX.Fragment.Ktx.dll => 0x9fb664600dde1045 => 313
	i64 11517440453979132662, ; 481: Microsoft.IdentityModel.Abstractions.dll => 0x9fd62b122523d2f6 => 252
	i64 11518296021396496455, ; 482: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 376
	i64 11529969570048099689, ; 483: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 347
	i64 11530571088791430846, ; 484: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 243
	i64 11564861549255168062, ; 485: Microsoft.CodeAnalysis.dll => 0xa07ea44e47ed903e => 218
	i64 11580057168383206117, ; 486: Xamarin.AndroidX.Annotation => 0xa0b4a0a4103262e5 => 286
	i64 11591352189662810718, ; 487: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0xa0dcc167234c525e => 340
	i64 11597308262950669618, ; 488: Microsoft.Extensions.Identity.Core.dll => 0xa0f1ea6b83e08d32 => 239
	i64 11597940890313164233, ; 489: netstandard => 0xa0f429ca8d1805c9 => 167
	i64 11622657603305904499, ; 490: Microsoft.Extensions.Identity.Stores => 0xa14bf982bf0a9973 => 240
	i64 11672361001936329215, ; 491: Xamarin.AndroidX.Interpolator => 0xa1fc8e7d0a8999ff => 314
	i64 11692977985522001935, ; 492: System.Threading.Overlapped.dll => 0xa245cd869980680f => 140
	i64 11705530742807338875, ; 493: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 372
	i64 11707554492040141440, ; 494: System.Linq.Parallel.dll => 0xa27996c7fe94da80 => 59
	i64 11743665907891708234, ; 495: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 144
	i64 11868746509924019608, ; 496: Microsoft.AspNetCore.Mvc.ApiExplorer => 0xa4b64211452dad98 => 199
	i64 11991047634523762324, ; 497: System.Net => 0xa668c24ad493ae94 => 81
	i64 12011556116648931059, ; 498: System.Security.Cryptography.ProtectedData => 0xa6b19ea5ec87aef3 => 276
	i64 12040886584167504988, ; 499: System.Net.ServicePoint => 0xa719d28d8e121c5c => 74
	i64 12058074296353848905, ; 500: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 237
	i64 12063623837170009990, ; 501: System.Security => 0xa76a99f6ce740786 => 130
	i64 12096697103934194533, ; 502: System.Diagnostics.Contracts => 0xa7e019eccb7e8365 => 25
	i64 12102847907131387746, ; 503: System.Buffers => 0xa7f5f40c43256f62 => 7
	i64 12123043025855404482, ; 504: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 93
	i64 12137774235383566651, ; 505: Xamarin.AndroidX.VectorDrawable => 0xa872095bbfed113b => 344
	i64 12145679461940342714, ; 506: System.Text.Json => 0xa88e1f1ebcb62fba => 137
	i64 12191646537372739477, ; 507: Xamarin.Android.Glide.dll => 0xa9316dee7f392795 => 280
	i64 12198439281774268251, ; 508: Microsoft.IdentityModel.Protocols.OpenIdConnect.dll => 0xa9498fe58c538f5b => 256
	i64 12201331334810686224, ; 509: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 113
	i64 12269460666702402136, ; 510: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 9
	i64 12310909314810916455, ; 511: Microsoft.Extensions.Localization.dll => 0xaad922cbbb5a2e67 => 241
	i64 12332222936682028543, ; 512: System.Runtime.Handles => 0xab24db6c07db5dff => 104
	i64 12375446203996702057, ; 513: System.Configuration.dll => 0xabbe6ac12e2e0569 => 19
	i64 12439275739440478309, ; 514: Microsoft.IdentityModel.JsonWebTokens => 0xaca12f61007bf865 => 253
	i64 12441092376399691269, ; 515: Microsoft.AspNetCore.Authentication.Abstractions.dll => 0xaca7a399c11fbe05 => 177
	i64 12449521524599790614, ; 516: Microsoft.AspNetCore.Mvc.dll => 0xacc595ddc1599c16 => 197
	i64 12451044538927396471, ; 517: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 312
	i64 12466513435562512481, ; 518: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 326
	i64 12475113361194491050, ; 519: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 402
	i64 12487638416075308985, ; 520: Xamarin.AndroidX.DocumentFile.dll => 0xad4d00fa21b0bfb9 => 306
	i64 12493213219680520345, ; 521: Microsoft.Data.SqlClient => 0xad60cf3b3e458899 => 221
	i64 12517810545449516888, ; 522: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 33
	i64 12538491095302438457, ; 523: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 294
	i64 12550732019250633519, ; 524: System.IO.Compression => 0xae2d28465e8e1b2f => 46
	i64 12681088699309157496, ; 525: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 377
	i64 12699999919562409296, ; 526: System.Diagnostics.StackTrace.dll => 0xb03f76a3ad01c550 => 30
	i64 12700543734426720211, ; 527: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 295
	i64 12708238894395270091, ; 528: System.IO => 0xb05cbbf17d3ba3cb => 57
	i64 12708922737231849740, ; 529: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 134
	i64 12717050818822477433, ; 530: System.Runtime.Serialization.Xml.dll => 0xb07c0a5786811679 => 114
	i64 12742166704152928552, ; 531: Microsoft.CodeAnalysis.Razor.dll => 0xb0d5451b45d86128 => 220
	i64 12753841065332862057, ; 532: Xamarin.AndroidX.Window => 0xb0febee04cf46c69 => 349
	i64 12823819093633476069, ; 533: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 390
	i64 12828192437253469131, ; 534: Xamarin.Kotlin.StdLib.Jdk8.dll => 0xb206e50e14d873cb => 360
	i64 12835242264250840079, ; 535: System.IO.Pipes => 0xb21ff0d5d6c0740f => 55
	i64 12843321153144804894, ; 536: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 248
	i64 12843770487262409629, ; 537: System.AppContext.dll => 0xb23e3d357debf39d => 6
	i64 12859557719246324186, ; 538: System.Net.WebHeaderCollection.dll => 0xb276539ce04f41da => 77
	i64 12963446364377008305, ; 539: System.Drawing.Common.dll => 0xb3e769c8fd8548b1 => 271
	i64 12982280885948128408, ; 540: Xamarin.AndroidX.CustomView.PoolingContainer => 0xb42a53aec5481c98 => 305
	i64 12991459499837607210, ; 541: Microsoft.CodeAnalysis => 0xb44aef9559b1cd2a => 218
	i64 13068258254871114833, ; 542: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 111
	i64 13070736518021853291, ; 543: Microsoft.AspNetCore.JsonPatch => 0xb564959c856b306b => 195
	i64 13086625805112021739, ; 544: Microsoft.AspNetCore.DataProtection.Abstractions.dll => 0xb59d08d5762992eb => 185
	i64 13122923747915422861, ; 545: Microsoft.AspNetCore.Localization => 0xb61dfd9ed9095c8d => 196
	i64 13129914918964716986, ; 546: Xamarin.AndroidX.Emoji2.dll => 0xb636d40db3fe65ba => 309
	i64 13162471042547327635, ; 547: System.Security.Permissions => 0xb6aa7dace9662293 => 278
	i64 13173818576982874404, ; 548: System.Runtime.CompilerServices.VisualC.dll => 0xb6d2ce32a8819924 => 102
	i64 13221551921002590604, ; 549: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 364
	i64 13222659110913276082, ; 550: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 378
	i64 13308002692117796025, ; 551: Microsoft.AspNetCore.Routing.Abstractions.dll => 0xb8af85f08d9f94b9 => 215
	i64 13343850469010654401, ; 552: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 170
	i64 13370592475155966277, ; 553: System.Runtime.Serialization => 0xb98de304062ea945 => 115
	i64 13381594904270902445, ; 554: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 372
	i64 13401370062847626945, ; 555: Xamarin.AndroidX.VectorDrawable.dll => 0xb9fb3b1193964ec1 => 344
	i64 13404347523447273790, ; 556: Xamarin.AndroidX.ConstraintLayout.Core => 0xba05cf0da4f6393e => 299
	i64 13404984788036896679, ; 557: Microsoft.AspNetCore.Http.Abstractions.dll => 0xba0812a45e7447a7 => 191
	i64 13431476299110033919, ; 558: System.Net.WebClient => 0xba663087f18829ff => 76
	i64 13454009404024712428, ; 559: Xamarin.Google.Guava.ListenableFuture => 0xbab63e4543a86cec => 355
	i64 13463706743370286408, ; 560: System.Private.DataContractSerialization.dll => 0xbad8b1f3069e0548 => 85
	i64 13465488254036897740, ; 561: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 357
	i64 13467053111158216594, ; 562: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 392
	i64 13491513212026656886, ; 563: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0xbb3b7bc905569876 => 292
	i64 13540124433173649601, ; 564: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 393
	i64 13545416393490209236, ; 565: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 376
	i64 13550417756503177631, ; 566: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 235
	i64 13572454107664307259, ; 567: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 334
	i64 13578472628727169633, ; 568: System.Xml.XPath => 0xbc706ce9fba5c261 => 160
	i64 13580399111273692417, ; 569: Microsoft.VisualBasic.Core.dll => 0xbc77450a277fbd01 => 2
	i64 13618112415141049676, ; 570: Microsoft.AspNetCore.Mvc.Core => 0xbcfd4116f7d1b54c => 200
	i64 13621154251410165619, ; 571: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0xbd080f9faa1acf73 => 305
	i64 13637569584472253285, ; 572: Microsoft.AspNetCore.Mvc => 0xbd4261483a23e365 => 197
	i64 13647894001087880694, ; 573: System.Data.dll => 0xbd670f48cb071df6 => 24
	i64 13675589307506966157, ; 574: Xamarin.AndroidX.Activity.Ktx => 0xbdc97404d0153e8d => 285
	i64 13702626353344114072, ; 575: System.Diagnostics.Tools.dll => 0xbe29821198fb6d98 => 32
	i64 13710614125866346983, ; 576: System.Security.AccessControl.dll => 0xbe45e2e7d0b769e7 => 117
	i64 13713329104121190199, ; 577: System.Dynamic.Runtime => 0xbe4f8829f32b5737 => 37
	i64 13717397318615465333, ; 578: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 16
	i64 13742054908850494594, ; 579: Azure.Identity => 0xbeb596218df25c82 => 174
	i64 13755568601956062840, ; 580: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 371
	i64 13768883594457632599, ; 581: System.IO.IsolatedStorage => 0xbf14e6adb159cf57 => 52
	i64 13814445057219246765, ; 582: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 374
	i64 13828521679616088467, ; 583: Xamarin.Kotlin.StdLib.Common => 0xbfe8c733724e1993 => 358
	i64 13881769479078963060, ; 584: System.Console.dll => 0xc0a5f3cade5c6774 => 20
	i64 13882652712560114096, ; 585: System.Windows.Extensions.dll => 0xc0a91716b04239b0 => 279
	i64 13911222732217019342, ; 586: System.Security.Cryptography.OpenSsl.dll => 0xc10e975ec1226bce => 123
	i64 13921917134693230900, ; 587: Microsoft.AspNetCore.WebUtilities => 0xc13495df5dd06934 => 216
	i64 13928444506500929300, ; 588: System.Windows.dll => 0xc14bc67b8bba9714 => 154
	i64 13939962644205322370, ; 589: Microsoft.AspNetCore.Razor.Language.dll => 0xc174b22af612c082 => 211
	i64 13955418299340266673, ; 590: Microsoft.Extensions.DependencyModel.dll => 0xc1ab9b0118299cb1 => 233
	i64 13959074834287824816, ; 591: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 312
	i64 14075334701871371868, ; 592: System.ServiceModel.Web.dll => 0xc355a25647c5965c => 131
	i64 14100563506285742564, ; 593: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 366
	i64 14124974489674258913, ; 594: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 294
	i64 14125464355221830302, ; 595: System.Threading.dll => 0xc407bafdbc707a9e => 148
	i64 14133832980772275001, ; 596: Microsoft.EntityFrameworkCore.dll => 0xc425763635a1c339 => 223
	i64 14178052285788134900, ; 597: Xamarin.Android.Glide.Annotations.dll => 0xc4c28f6f75511df4 => 281
	i64 14199657271608119382, ; 598: Microsoft.AspNetCore.Localization.dll => 0xc50f510e367e9056 => 196
	i64 14212104595480609394, ; 599: System.Security.Cryptography.Cng.dll => 0xc53b89d4a4518272 => 120
	i64 14220608275227875801, ; 600: System.Diagnostics.FileVersionInfo.dll => 0xc559bfe1def019d9 => 28
	i64 14226382999226559092, ; 601: System.ServiceProcess => 0xc56e43f6938e2a74 => 132
	i64 14232023429000439693, ; 602: System.Resources.Writer.dll => 0xc5824de7789ba78d => 100
	i64 14254574811015963973, ; 603: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 134
	i64 14261073672896646636, ; 604: Xamarin.AndroidX.Print => 0xc5e982f274ae0dec => 332
	i64 14261232074598307362, ; 605: Microsoft.AspNetCore.Mvc.Abstractions => 0xc5ea130339d6d622 => 198
	i64 14298246716367104064, ; 606: System.Web.dll => 0xc66d93a217f4e840 => 153
	i64 14327695147300244862, ; 607: System.Reflection.dll => 0xc6d632d338eb4d7e => 97
	i64 14327709162229390963, ; 608: System.Security.Cryptography.X509Certificates => 0xc6d63f9253cade73 => 125
	i64 14331727281556788554, ; 609: Xamarin.Android.Glide.DiskLruCache.dll => 0xc6e48607a2f7954a => 282
	i64 14346402571976470310, ; 610: System.Net.Ping.dll => 0xc718a920f3686f26 => 69
	i64 14367533376751069365, ; 611: CesiZenModel.dll => 0xc763bb7bd3d0e8b5 => 398
	i64 14461014870687870182, ; 612: System.Net.Requests.dll => 0xc8afd8683afdece6 => 72
	i64 14464374589798375073, ; 613: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 387
	i64 14486659737292545672, ; 614: Xamarin.AndroidX.Lifecycle.LiveData => 0xc90af44707469e88 => 317
	i64 14495724990987328804, ; 615: Xamarin.AndroidX.ResourceInspection.Annotation => 0xc92b2913e18d5d24 => 335
	i64 14522721392235705434, ; 616: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 368
	i64 14528548208938697926, ; 617: Microsoft.AspNetCore.Mvc.Abstractions.dll => 0xc99fc59ed7edc4c6 => 198
	i64 14551742072151931844, ; 618: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 136
	i64 14561513370130550166, ; 619: System.Security.Cryptography.Primitives.dll => 0xca14e3428abb8d96 => 124
	i64 14569958227297576184, ; 620: Microsoft.AspNetCore.Mvc.Razor.Extensions => 0xca32e3d0125a24f8 => 206
	i64 14574160591280636898, ; 621: System.Net.Quic => 0xca41d1d72ec783e2 => 71
	i64 14590759218726834633, ; 622: CesiZenInfrastructure => 0xca7cca344b7811c9 => 397
	i64 14622043554576106986, ; 623: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 111
	i64 14644440854989303794, ; 624: Xamarin.AndroidX.LocalBroadcastManager.dll => 0xcb3b815e37daeff2 => 327
	i64 14648804764802849406, ; 625: Azure.Identity.dll => 0xcb4b0252261f9a7e => 174
	i64 14669215534098758659, ; 626: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 231
	i64 14690985099581930927, ; 627: System.Web.HttpUtility => 0xcbe0dd1ca5233daf => 152
	i64 14705122255218365489, ; 628: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 379
	i64 14711489710198462279, ; 629: Microsoft.AspNetCore.Mvc.ViewFeatures.dll => 0xcc29b5f255319747 => 209
	i64 14744092281598614090, ; 630: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 395
	i64 14792063746108907174, ; 631: Xamarin.Google.Guava.ListenableFuture.dll => 0xcd47f79af9c15ea6 => 355
	i64 14832630590065248058, ; 632: System.Security.Claims => 0xcdd816ef5d6e873a => 118
	i64 14835122486566269605, ; 633: Microsoft.AspNetCore.Mvc.TagHelpers.dll => 0xcde0f14d3b3132a5 => 208
	i64 14852515768018889994, ; 634: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 303
	i64 14889905118082851278, ; 635: GoogleGson.dll => 0xcea391d0969961ce => 175
	i64 14892012299694389861, ; 636: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 396
	i64 14904040806490515477, ; 637: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 363
	i64 14912225920358050525, ; 638: System.Security.Principal.Windows => 0xcef2de7759506add => 127
	i64 14935719434541007538, ; 639: System.Text.Encoding.CodePages.dll => 0xcf4655b160b702b2 => 133
	i64 14954917835170835695, ; 640: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 232
	i64 14984936317414011727, ; 641: System.Net.WebHeaderCollection => 0xcff5302fe54ff34f => 77
	i64 14987728460634540364, ; 642: System.IO.Compression.dll => 0xcfff1ba06622494c => 46
	i64 14988210264188246988, ; 643: Xamarin.AndroidX.DocumentFile => 0xd000d1d307cddbcc => 306
	i64 14997925763760621062, ; 644: Microsoft.AspNetCore.Razor.Runtime.dll => 0xd02356050ca18606 => 212
	i64 15015154896917945444, ; 645: System.Net.Security.dll => 0xd0608bd33642dc64 => 73
	i64 15024878362326791334, ; 646: System.Net.Http.Json => 0xd0831743ebf0f4a6 => 63
	i64 15051741671811457419, ; 647: Microsoft.Extensions.Diagnostics.Abstractions.dll => 0xd0e2874d8f44218b => 234
	i64 15071021337266399595, ; 648: System.Resources.Reader.dll => 0xd127060e7a18a96b => 98
	i64 15076659072870671916, ; 649: System.ObjectModel.dll => 0xd13b0d8c1620662c => 84
	i64 15111608613780139878, ; 650: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 380
	i64 15115185479366240210, ; 651: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 43
	i64 15133485256822086103, ; 652: System.Linq.dll => 0xd204f0a9127dd9d7 => 61
	i64 15138356091203993725, ; 653: Microsoft.IdentityModel.Abstractions => 0xd2163ea89395c07d => 252
	i64 15150743910298169673, ; 654: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xd2424150783c3149 => 333
	i64 15188318564056798176, ; 655: Microsoft.AspNetCore.Mvc.TagHelpers => 0xd2c7bf434a1393e0 => 208
	i64 15227001540531775957, ; 656: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 230
	i64 15234786388537674379, ; 657: System.Dynamic.Runtime.dll => 0xd36cd580c5be8a8b => 37
	i64 15250465174479574862, ; 658: System.Globalization.Calendars.dll => 0xd3a489469852174e => 40
	i64 15272359115529052076, ; 659: Xamarin.AndroidX.Collection.Ktx => 0xd3f251b2fb4edfac => 296
	i64 15279429628684179188, ; 660: Xamarin.KotlinX.Coroutines.Android.dll => 0xd40b704b1c4c96f4 => 361
	i64 15299439993936780255, ; 661: System.Xml.XPath.dll => 0xd452879d55019bdf => 160
	i64 15332518387094693223, ; 662: Microsoft.AspNetCore.Mvc.DataAnnotations.dll => 0xd4c80c3ce6eca567 => 202
	i64 15338463749992804988, ; 663: System.Resources.Reader => 0xd4dd2b839286f27c => 98
	i64 15370028218478381000, ; 664: Microsoft.Extensions.Localization.Abstractions => 0xd54d4f3b162247c8 => 242
	i64 15370334346939861994, ; 665: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 301
	i64 15383240894167415497, ; 666: System.Memory.Data => 0xd57c4016df1c7ac9 => 273
	i64 15391712275433856905, ; 667: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 232
	i64 15481710163200268842, ; 668: Microsoft.Extensions.FileProviders.Composite => 0xd6da155e291b5a2a => 236
	i64 15526743539506359484, ; 669: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 135
	i64 15527772828719725935, ; 670: System.Console => 0xd77dbb1e38cd3d6f => 20
	i64 15530465045505749832, ; 671: System.Net.HttpListener.dll => 0xd7874bacc9fdb348 => 65
	i64 15536481058354060254, ; 672: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 367
	i64 15541854775306130054, ; 673: System.Security.Cryptography.X509Certificates.dll => 0xd7afc292e8d49286 => 125
	i64 15557562860424774966, ; 674: System.Net.Sockets => 0xd7e790fe7a6dc536 => 75
	i64 15565247197164990907, ; 675: Microsoft.AspNetCore.Http.Extensions => 0xd802dddb8c29f1bb => 192
	i64 15582737692548360875, ; 676: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 325
	i64 15592226634512578529, ; 677: Microsoft.AspNetCore.Authorization.dll => 0xd862b7834f81b7e1 => 179
	i64 15609085926864131306, ; 678: System.dll => 0xd89e9cf3334914ea => 164
	i64 15620595871140898079, ; 679: Microsoft.Extensions.DependencyModel => 0xd8c7812eef49651f => 233
	i64 15637608551555227372, ; 680: Microsoft.AspNetCore.Mvc.Razor.dll => 0xd903f220440f5eec => 205
	i64 15661133872274321916, ; 681: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 156
	i64 15664356999916475676, ; 682: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 367
	i64 15710114879900314733, ; 683: Microsoft.Win32.Registry => 0xda058a3f5d096c6d => 5
	i64 15735700225633954557, ; 684: Microsoft.Extensions.Localization => 0xda606ffbe0f22afd => 241
	i64 15743187114543869802, ; 685: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 375
	i64 15755368083429170162, ; 686: System.IO.FileSystem.Primitives => 0xdaa64fcbde529bf2 => 49
	i64 15777549416145007739, ; 687: Xamarin.AndroidX.SlidingPaneLayout.dll => 0xdaf51d99d77eb47b => 339
	i64 15783653065526199428, ; 688: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 368
	i64 15817206913877585035, ; 689: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 144
	i64 15847085070278954535, ; 690: System.Threading.Channels.dll => 0xdbec27e8f35f8e27 => 139
	i64 15852824340364052161, ; 691: Microsoft.AspNetCore.Http.Features.dll => 0xdc008bbee610c6c1 => 193
	i64 15885744048853936810, ; 692: System.Resources.Writer => 0xdc75800bd0b6eaaa => 100
	i64 15928521404965645318, ; 693: Microsoft.Maui.Controls.Compatibility => 0xdd0d79d32c2eec06 => 258
	i64 15934062614519587357, ; 694: System.Security.Cryptography.OpenSsl => 0xdd2129868f45a21d => 123
	i64 15937190497610202713, ; 695: System.Security.Cryptography.Cng => 0xdd2c465197c97e59 => 120
	i64 15963349826457351533, ; 696: System.Threading.Tasks.Extensions => 0xdd893616f748b56d => 142
	i64 15971679995444160383, ; 697: System.Formats.Tar.dll => 0xdda6ce5592a9677f => 39
	i64 16018552496348375205, ; 698: System.Net.NetworkInformation.dll => 0xde4d54a020caa8a5 => 68
	i64 16027684189145026053, ; 699: Microsoft.AspNetCore.DataProtection => 0xde6dc5da0a224e05 => 184
	i64 16046481083542319511, ; 700: Microsoft.Extensions.ObjectPool => 0xdeb08d870f90b197 => 246
	i64 16054465462676478687, ; 701: System.Globalization.Extensions => 0xdecceb47319bdadf => 41
	i64 16153500642854367575, ; 702: Microsoft.Extensions.WebEncoders.dll => 0xe02cc33ff060f157 => 249
	i64 16154507427712707110, ; 703: System => 0xe03056ea4e39aa26 => 164
	i64 16219561732052121626, ; 704: System.Net.Security => 0xe1177575db7c781a => 73
	i64 16288847719894691167, ; 705: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 381
	i64 16315482530584035869, ; 706: WindowsBase.dll => 0xe26c3ceb1e8d821d => 165
	i64 16321164108206115771, ; 707: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 244
	i64 16337011941688632206, ; 708: System.Security.Principal.Windows.dll => 0xe2b8b9cdc3aa638e => 127
	i64 16344871930018146979, ; 709: Microsoft.AspNetCore.ResponseCaching.Abstractions => 0xe2d4a66be7fc2aa3 => 213
	i64 16361933716545543812, ; 710: Xamarin.AndroidX.ExifInterface.dll => 0xe3114406a52f1e84 => 311
	i64 16423015068819898779, ; 711: Xamarin.Kotlin.StdLib.Jdk8 => 0xe3ea453135e5c19b => 360
	i64 16454459195343277943, ; 712: System.Net.NetworkInformation => 0xe459fb756d988f77 => 68
	i64 16496768397145114574, ; 713: Mono.Android.Export.dll => 0xe4f04b741db987ce => 169
	i64 16523284800709429098, ; 714: Microsoft.AspNetCore.DataProtection.dll => 0xe54e7ffb6ce5876a => 184
	i64 16586971685355653868, ; 715: Microsoft.AspNetCore.Mvc.RazorPages => 0xe630c2ddc5160aec => 207
	i64 16589693266713801121, ; 716: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xe63a6e214f2a71a1 => 324
	i64 16621146507174665210, ; 717: Xamarin.AndroidX.ConstraintLayout => 0xe6aa2caf87dedbfa => 298
	i64 16649148416072044166, ; 718: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 263
	i64 16677317093839702854, ; 719: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 331
	i64 16702652415771857902, ; 720: System.ValueTuple => 0xe7cbbde0b0e6d3ee => 151
	i64 16709499819875633724, ; 721: System.IO.Compression.ZipFile => 0xe7e4118e32240a3c => 45
	i64 16737807731308835127, ; 722: System.Runtime.Intrinsics => 0xe848a3736f733137 => 108
	i64 16758309481308491337, ; 723: System.IO.FileSystem.DriveInfo => 0xe89179af15740e49 => 48
	i64 16762783179241323229, ; 724: System.Reflection.TypeExtensions => 0xe8a15e7d0d927add => 96
	i64 16765015072123548030, ; 725: System.Diagnostics.TextWriterTraceListener.dll => 0xe8a94c621bfe717e => 31
	i64 16793451114543296636, ; 726: Microsoft.AspNetCore.Mvc.ViewFeatures => 0xe90e52d02b3db07c => 209
	i64 16822611501064131242, ; 727: System.Data.DataSetExtensions => 0xe975ec07bb5412aa => 23
	i64 16833383113903931215, ; 728: mscorlib => 0xe99c30c1484d7f4f => 166
	i64 16856067890322379635, ; 729: System.Data.Common.dll => 0xe9ecc87060889373 => 22
	i64 16890310621557459193, ; 730: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 138
	i64 16896024368574352025, ; 731: CesiZenInfrastructure.dll => 0xea7abca4ed37ca99 => 397
	i64 16933958494752847024, ; 732: System.Net.WebProxy.dll => 0xeb018187f0f3b4b0 => 78
	i64 16942731696432749159, ; 733: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 388
	i64 16945858842201062480, ; 734: Azure.Core => 0xeb2bc8d57f4e7c50 => 173
	i64 16977952268158210142, ; 735: System.IO.Pipes.AccessControl => 0xeb9dcda2851b905e => 54
	i64 16989020923549080504, ; 736: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xebc52084add25bb8 => 324
	i64 16998075588627545693, ; 737: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 329
	i64 17006954551347072385, ; 738: System.ClientModel => 0xec04d70ec8414d81 => 269
	i64 17008137082415910100, ; 739: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 10
	i64 17024911836938395553, ; 740: Xamarin.AndroidX.Annotation.Experimental.dll => 0xec44a31d250e5fa1 => 287
	i64 17026344819618783825, ; 741: Microsoft.VisualStudio.DesignTools.TapContract.dll => 0xec49ba676cb0a251 => 401
	i64 17031351772568316411, ; 742: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 328
	i64 17037200463775726619, ; 743: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xec704b8e0a78fc1b => 315
	i64 17047637518392099970, ; 744: Microsoft.AspNetCore.Antiforgery.dll => 0xec9560002f620482 => 176
	i64 17062143951396181894, ; 745: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 16
	i64 17089008752050867324, ; 746: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 395
	i64 17118171214553292978, ; 747: System.Threading.Channels => 0xed8ff6060fc420b2 => 139
	i64 17126545051278881272, ; 748: Microsoft.Net.Http.Headers.dll => 0xedadb5fbdb33b1f8 => 264
	i64 17137864900836977098, ; 749: Microsoft.IdentityModel.Tokens => 0xedd5ed53b705e9ca => 257
	i64 17187273293601214786, ; 750: System.ComponentModel.Annotations.dll => 0xee8575ff9aa89142 => 13
	i64 17197986060146327831, ; 751: Microsoft.Identity.Client.Extensions.Msal => 0xeeab8533ef244117 => 251
	i64 17201328579425343169, ; 752: System.ComponentModel.EventBasedAsync => 0xeeb76534d96c16c1 => 15
	i64 17202182880784296190, ; 753: System.Security.Cryptography.Encoding.dll => 0xeeba6e30627428fe => 122
	i64 17205988430934219272, ; 754: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 237
	i64 17230721278011714856, ; 755: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 87
	i64 17234219099804750107, ; 756: System.Transactions.Local.dll => 0xef2c3ef5e11d511b => 149
	i64 17260702271250283638, ; 757: System.Data.Common => 0xef8a5543bba6bc76 => 22
	i64 17311256152179951039, ; 758: Microsoft.AspNetCore.Mvc.Formatters.Json => 0xf03defc05e7b45bf => 203
	i64 17333249706306540043, ; 759: System.Diagnostics.Tracing.dll => 0xf08c12c5bb8b920b => 34
	i64 17338386382517543202, ; 760: System.Net.WebSockets.Client.dll => 0xf09e528d5c6da122 => 79
	i64 17342750010158924305, ; 761: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 373
	i64 17360349973592121190, ; 762: Xamarin.Google.Crypto.Tink.Android => 0xf0ec5a52686b9f66 => 353
	i64 17371436720558481852, ; 763: System.Runtime.Caching => 0xf113bda8d710a1bc => 274
	i64 17438153253682247751, ; 764: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 388
	i64 17470386307322966175, ; 765: System.Threading.Timer => 0xf27347c8d0d5709f => 147
	i64 17509662556995089465, ; 766: System.Net.WebSockets.dll => 0xf2fed1534ea67439 => 80
	i64 17514990004910432069, ; 767: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 371
	i64 17522591619082469157, ; 768: GoogleGson => 0xf32cc03d27a5bf25 => 175
	i64 17523946658117960076, ; 769: System.Security.Cryptography.ProtectedData.dll => 0xf33190a3c403c18c => 276
	i64 17590473451926037903, ; 770: Xamarin.Android.Glide => 0xf41dea67fcfda58f => 280
	i64 17623389608345532001, ; 771: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 383
	i64 17627500474728259406, ; 772: System.Globalization => 0xf4a176498a351f4e => 42
	i64 17685921127322830888, ; 773: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 26
	i64 17702523067201099846, ; 774: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 394
	i64 17704177640604968747, ; 775: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 326
	i64 17710060891934109755, ; 776: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 323
	i64 17712670374920797664, ; 777: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 107
	i64 17727630781806093631, ; 778: Microsoft.AspNetCore.Diagnostics.Abstractions => 0xf605324562d5253f => 186
	i64 17777860260071588075, ; 779: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 110
	i64 17790600151040787804, ; 780: Microsoft.IdentityModel.Logging => 0xf6e4e89427cc055c => 254
	i64 17830780619298983968, ; 781: Microsoft.AspNetCore.Razor => 0xf773a880713c5020 => 210
	i64 17838668724098252521, ; 782: System.Buffers.dll => 0xf78faeb0f5bf3ee9 => 7
	i64 17891337867145587222, ; 783: Xamarin.Jetbrains.Annotations => 0xf84accff6fb52a16 => 356
	i64 17910264068556501837, ; 784: Microsoft.Extensions.Identity.Core => 0xf88e0a4717c0b34d => 239
	i64 17911643751311784505, ; 785: Microsoft.Net.Http.Headers => 0xf892f1178448ba39 => 264
	i64 17928294245072900555, ; 786: System.IO.Compression.FileSystem.dll => 0xf8ce18a0b24011cb => 44
	i64 17992315986609351877, ; 787: System.Xml.XmlDocument.dll => 0xf9b18c0ffc6eacc5 => 161
	i64 18017743553296241350, ; 788: Microsoft.Extensions.Caching.Abstractions => 0xfa0be24cb44e92c6 => 227
	i64 18025913125965088385, ; 789: System.Threading => 0xfa28e87b91334681 => 148
	i64 18099568558057551825, ; 790: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 382
	i64 18116111925905154859, ; 791: Xamarin.AndroidX.Arch.Core.Runtime => 0xfb695bd036cb632b => 292
	i64 18121036031235206392, ; 792: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 328
	i64 18146411883821974900, ; 793: System.Formats.Asn1.dll => 0xfbd50176eb22c574 => 38
	i64 18146811631844267958, ; 794: System.ComponentModel.EventBasedAsync.dll => 0xfbd66d08820117b6 => 15
	i64 18203743254473369877, ; 795: System.Security.Cryptography.Pkcs.dll => 0xfca0b00ad94c6915 => 275
	i64 18225059387460068507, ; 796: System.Threading.ThreadPool.dll => 0xfcec6af3cff4a49b => 146
	i64 18245806341561545090, ; 797: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 8
	i64 18260797123374478311, ; 798: Xamarin.AndroidX.Emoji2 => 0xfd6b623bde35f3e7 => 309
	i64 18305135509493619199, ; 799: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 330
	i64 18318849532986632368, ; 800: System.Security.dll => 0xfe39a097c37fa8b0 => 130
	i64 18324163916253801303, ; 801: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 377
	i64 18380184030268848184, ; 802: Xamarin.AndroidX.VersionedParcelable => 0xff1387fe3e7b7838 => 346
	i64 18427086088365902170, ; 803: Microsoft.AspNetCore.Mvc.Cors => 0xffba292a9e97895a => 201
	i64 18428404840311395189, ; 804: System.Security.Cryptography.Xml.dll => 0xffbed8907bd99375 => 277
	i64 18439108438687598470 ; 805: System.Reflection.Metadata.dll => 0xffe4df6e2ee1c786 => 94
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [806 x i32] [
	i32 222, ; 0
	i32 308, ; 1
	i32 248, ; 2
	i32 171, ; 3
	i32 262, ; 4
	i32 238, ; 5
	i32 58, ; 6
	i32 295, ; 7
	i32 151, ; 8
	i32 336, ; 9
	i32 339, ; 10
	i32 302, ; 11
	i32 132, ; 12
	i32 220, ; 13
	i32 401, ; 14
	i32 56, ; 15
	i32 338, ; 16
	i32 186, ; 17
	i32 246, ; 18
	i32 370, ; 19
	i32 95, ; 20
	i32 219, ; 21
	i32 321, ; 22
	i32 129, ; 23
	i32 250, ; 24
	i32 271, ; 25
	i32 145, ; 26
	i32 296, ; 27
	i32 18, ; 28
	i32 373, ; 29
	i32 202, ; 30
	i32 307, ; 31
	i32 322, ; 32
	i32 265, ; 33
	i32 150, ; 34
	i32 104, ; 35
	i32 213, ; 36
	i32 178, ; 37
	i32 95, ; 38
	i32 173, ; 39
	i32 351, ; 40
	i32 381, ; 41
	i32 36, ; 42
	i32 226, ; 43
	i32 28, ; 44
	i32 291, ; 45
	i32 329, ; 46
	i32 50, ; 47
	i32 115, ; 48
	i32 70, ; 49
	i32 259, ; 50
	i32 65, ; 51
	i32 170, ; 52
	i32 145, ; 53
	i32 379, ; 54
	i32 350, ; 55
	i32 290, ; 56
	i32 325, ; 57
	i32 315, ; 58
	i32 182, ; 59
	i32 40, ; 60
	i32 89, ; 61
	i32 81, ; 62
	i32 267, ; 63
	i32 66, ; 64
	i32 62, ; 65
	i32 86, ; 66
	i32 289, ; 67
	i32 106, ; 68
	i32 369, ; 69
	i32 336, ; 70
	i32 102, ; 71
	i32 217, ; 72
	i32 35, ; 73
	i32 286, ; 74
	i32 391, ; 75
	i32 338, ; 76
	i32 260, ; 77
	i32 391, ; 78
	i32 219, ; 79
	i32 119, ; 80
	i32 323, ; 81
	i32 365, ; 82
	i32 383, ; 83
	i32 142, ; 84
	i32 141, ; 85
	i32 359, ; 86
	i32 53, ; 87
	i32 35, ; 88
	i32 141, ; 89
	i32 267, ; 90
	i32 283, ; 91
	i32 293, ; 92
	i32 224, ; 93
	i32 245, ; 94
	i32 307, ; 95
	i32 189, ; 96
	i32 8, ; 97
	i32 14, ; 98
	i32 387, ; 99
	i32 335, ; 100
	i32 51, ; 101
	i32 256, ; 102
	i32 318, ; 103
	i32 136, ; 104
	i32 101, ; 105
	i32 204, ; 106
	i32 300, ; 107
	i32 345, ; 108
	i32 116, ; 109
	i32 284, ; 110
	i32 274, ; 111
	i32 163, ; 112
	i32 390, ; 113
	i32 194, ; 114
	i32 257, ; 115
	i32 166, ; 116
	i32 67, ; 117
	i32 231, ; 118
	i32 365, ; 119
	i32 80, ; 120
	i32 101, ; 121
	i32 340, ; 122
	i32 253, ; 123
	i32 117, ; 124
	i32 270, ; 125
	i32 370, ; 126
	i32 352, ; 127
	i32 203, ; 128
	i32 78, ; 129
	i32 351, ; 130
	i32 180, ; 131
	i32 400, ; 132
	i32 269, ; 133
	i32 114, ; 134
	i32 121, ; 135
	i32 48, ; 136
	i32 238, ; 137
	i32 206, ; 138
	i32 266, ; 139
	i32 179, ; 140
	i32 128, ; 141
	i32 316, ; 142
	i32 287, ; 143
	i32 82, ; 144
	i32 110, ; 145
	i32 75, ; 146
	i32 362, ; 147
	i32 235, ; 148
	i32 272, ; 149
	i32 262, ; 150
	i32 53, ; 151
	i32 342, ; 152
	i32 229, ; 153
	i32 69, ; 154
	i32 341, ; 155
	i32 228, ; 156
	i32 83, ; 157
	i32 172, ; 158
	i32 385, ; 159
	i32 116, ; 160
	i32 0, ; 161
	i32 230, ; 162
	i32 156, ; 163
	i32 229, ; 164
	i32 281, ; 165
	i32 167, ; 166
	i32 334, ; 167
	i32 308, ; 168
	i32 243, ; 169
	i32 32, ; 170
	i32 260, ; 171
	i32 122, ; 172
	i32 72, ; 173
	i32 62, ; 174
	i32 185, ; 175
	i32 161, ; 176
	i32 113, ; 177
	i32 88, ; 178
	i32 258, ; 179
	i32 396, ; 180
	i32 105, ; 181
	i32 18, ; 182
	i32 146, ; 183
	i32 118, ; 184
	i32 58, ; 185
	i32 302, ; 186
	i32 268, ; 187
	i32 17, ; 188
	i32 177, ; 189
	i32 52, ; 190
	i32 192, ; 191
	i32 187, ; 192
	i32 92, ; 193
	i32 398, ; 194
	i32 400, ; 195
	i32 393, ; 196
	i32 55, ; 197
	i32 399, ; 198
	i32 129, ; 199
	i32 176, ; 200
	i32 152, ; 201
	i32 41, ; 202
	i32 225, ; 203
	i32 92, ; 204
	i32 224, ; 205
	i32 346, ; 206
	i32 194, ; 207
	i32 50, ; 208
	i32 363, ; 209
	i32 162, ; 210
	i32 13, ; 211
	i32 320, ; 212
	i32 284, ; 213
	i32 341, ; 214
	i32 36, ; 215
	i32 67, ; 216
	i32 109, ; 217
	i32 285, ; 218
	i32 99, ; 219
	i32 99, ; 220
	i32 11, ; 221
	i32 216, ; 222
	i32 190, ; 223
	i32 11, ; 224
	i32 327, ; 225
	i32 204, ; 226
	i32 25, ; 227
	i32 128, ; 228
	i32 76, ; 229
	i32 319, ; 230
	i32 109, ; 231
	i32 345, ; 232
	i32 343, ; 233
	i32 106, ; 234
	i32 2, ; 235
	i32 26, ; 236
	i32 298, ; 237
	i32 157, ; 238
	i32 389, ; 239
	i32 279, ; 240
	i32 21, ; 241
	i32 392, ; 242
	i32 49, ; 243
	i32 43, ; 244
	i32 126, ; 245
	i32 288, ; 246
	i32 59, ; 247
	i32 214, ; 248
	i32 178, ; 249
	i32 119, ; 250
	i32 348, ; 251
	i32 311, ; 252
	i32 242, ; 253
	i32 297, ; 254
	i32 3, ; 255
	i32 317, ; 256
	i32 337, ; 257
	i32 38, ; 258
	i32 124, ; 259
	i32 386, ; 260
	i32 337, ; 261
	i32 386, ; 262
	i32 137, ; 263
	i32 149, ; 264
	i32 85, ; 265
	i32 90, ; 266
	i32 321, ; 267
	i32 402, ; 268
	i32 318, ; 269
	i32 195, ; 270
	i32 374, ; 271
	i32 293, ; 272
	i32 304, ; 273
	i32 349, ; 274
	i32 247, ; 275
	i32 354, ; 276
	i32 319, ; 277
	i32 133, ; 278
	i32 205, ; 279
	i32 96, ; 280
	i32 3, ; 281
	i32 382, ; 282
	i32 105, ; 283
	i32 385, ; 284
	i32 33, ; 285
	i32 154, ; 286
	i32 158, ; 287
	i32 155, ; 288
	i32 82, ; 289
	i32 188, ; 290
	i32 313, ; 291
	i32 277, ; 292
	i32 143, ; 293
	i32 87, ; 294
	i32 19, ; 295
	i32 314, ; 296
	i32 275, ; 297
	i32 51, ; 298
	i32 212, ; 299
	i32 283, ; 300
	i32 389, ; 301
	i32 61, ; 302
	i32 54, ; 303
	i32 4, ; 304
	i32 190, ; 305
	i32 97, ; 306
	i32 273, ; 307
	i32 282, ; 308
	i32 17, ; 309
	i32 222, ; 310
	i32 155, ; 311
	i32 84, ; 312
	i32 272, ; 313
	i32 29, ; 314
	i32 45, ; 315
	i32 64, ; 316
	i32 66, ; 317
	i32 380, ; 318
	i32 172, ; 319
	i32 322, ; 320
	i32 1, ; 321
	i32 357, ; 322
	i32 47, ; 323
	i32 24, ; 324
	i32 180, ; 325
	i32 290, ; 326
	i32 234, ; 327
	i32 227, ; 328
	i32 165, ; 329
	i32 108, ; 330
	i32 12, ; 331
	i32 316, ; 332
	i32 63, ; 333
	i32 27, ; 334
	i32 23, ; 335
	i32 93, ; 336
	i32 181, ; 337
	i32 168, ; 338
	i32 12, ; 339
	i32 361, ; 340
	i32 251, ; 341
	i32 263, ; 342
	i32 29, ; 343
	i32 103, ; 344
	i32 14, ; 345
	i32 181, ; 346
	i32 126, ; 347
	i32 299, ; 348
	i32 249, ; 349
	i32 331, ; 350
	i32 91, ; 351
	i32 320, ; 352
	i32 183, ; 353
	i32 240, ; 354
	i32 278, ; 355
	i32 265, ; 356
	i32 9, ; 357
	i32 200, ; 358
	i32 86, ; 359
	i32 310, ; 360
	i32 343, ; 361
	i32 188, ; 362
	i32 384, ; 363
	i32 71, ; 364
	i32 168, ; 365
	i32 1, ; 366
	i32 330, ; 367
	i32 5, ; 368
	i32 384, ; 369
	i32 44, ; 370
	i32 27, ; 371
	i32 358, ; 372
	i32 201, ; 373
	i32 199, ; 374
	i32 158, ; 375
	i32 333, ; 376
	i32 112, ; 377
	i32 250, ; 378
	i32 394, ; 379
	i32 255, ; 380
	i32 228, ; 381
	i32 121, ; 382
	i32 223, ; 383
	i32 348, ; 384
	i32 289, ; 385
	i32 187, ; 386
	i32 254, ; 387
	i32 159, ; 388
	i32 226, ; 389
	i32 183, ; 390
	i32 131, ; 391
	i32 353, ; 392
	i32 57, ; 393
	i32 138, ; 394
	i32 83, ; 395
	i32 30, ; 396
	i32 300, ; 397
	i32 10, ; 398
	i32 350, ; 399
	i32 171, ; 400
	i32 255, ; 401
	i32 297, ; 402
	i32 150, ; 403
	i32 94, ; 404
	i32 182, ; 405
	i32 310, ; 406
	i32 60, ; 407
	i32 214, ; 408
	i32 261, ; 409
	i32 157, ; 410
	i32 369, ; 411
	i32 268, ; 412
	i32 245, ; 413
	i32 64, ; 414
	i32 88, ; 415
	i32 79, ; 416
	i32 47, ; 417
	i32 259, ; 418
	i32 143, ; 419
	i32 366, ; 420
	i32 359, ; 421
	i32 304, ; 422
	i32 74, ; 423
	i32 191, ; 424
	i32 91, ; 425
	i32 399, ; 426
	i32 356, ; 427
	i32 207, ; 428
	i32 135, ; 429
	i32 90, ; 430
	i32 342, ; 431
	i32 362, ; 432
	i32 301, ; 433
	i32 217, ; 434
	i32 215, ; 435
	i32 364, ; 436
	i32 210, ; 437
	i32 112, ; 438
	i32 42, ; 439
	i32 0, ; 440
	i32 159, ; 441
	i32 4, ; 442
	i32 103, ; 443
	i32 70, ; 444
	i32 225, ; 445
	i32 60, ; 446
	i32 39, ; 447
	i32 291, ; 448
	i32 221, ; 449
	i32 153, ; 450
	i32 189, ; 451
	i32 56, ; 452
	i32 34, ; 453
	i32 211, ; 454
	i32 244, ; 455
	i32 261, ; 456
	i32 288, ; 457
	i32 21, ; 458
	i32 163, ; 459
	i32 266, ; 460
	i32 193, ; 461
	i32 236, ; 462
	i32 354, ; 463
	i32 375, ; 464
	i32 352, ; 465
	i32 347, ; 466
	i32 140, ; 467
	i32 378, ; 468
	i32 247, ; 469
	i32 89, ; 470
	i32 147, ; 471
	i32 303, ; 472
	i32 270, ; 473
	i32 162, ; 474
	i32 332, ; 475
	i32 6, ; 476
	i32 169, ; 477
	i32 31, ; 478
	i32 107, ; 479
	i32 313, ; 480
	i32 252, ; 481
	i32 376, ; 482
	i32 347, ; 483
	i32 243, ; 484
	i32 218, ; 485
	i32 286, ; 486
	i32 340, ; 487
	i32 239, ; 488
	i32 167, ; 489
	i32 240, ; 490
	i32 314, ; 491
	i32 140, ; 492
	i32 372, ; 493
	i32 59, ; 494
	i32 144, ; 495
	i32 199, ; 496
	i32 81, ; 497
	i32 276, ; 498
	i32 74, ; 499
	i32 237, ; 500
	i32 130, ; 501
	i32 25, ; 502
	i32 7, ; 503
	i32 93, ; 504
	i32 344, ; 505
	i32 137, ; 506
	i32 280, ; 507
	i32 256, ; 508
	i32 113, ; 509
	i32 9, ; 510
	i32 241, ; 511
	i32 104, ; 512
	i32 19, ; 513
	i32 253, ; 514
	i32 177, ; 515
	i32 197, ; 516
	i32 312, ; 517
	i32 326, ; 518
	i32 402, ; 519
	i32 306, ; 520
	i32 221, ; 521
	i32 33, ; 522
	i32 294, ; 523
	i32 46, ; 524
	i32 377, ; 525
	i32 30, ; 526
	i32 295, ; 527
	i32 57, ; 528
	i32 134, ; 529
	i32 114, ; 530
	i32 220, ; 531
	i32 349, ; 532
	i32 390, ; 533
	i32 360, ; 534
	i32 55, ; 535
	i32 248, ; 536
	i32 6, ; 537
	i32 77, ; 538
	i32 271, ; 539
	i32 305, ; 540
	i32 218, ; 541
	i32 111, ; 542
	i32 195, ; 543
	i32 185, ; 544
	i32 196, ; 545
	i32 309, ; 546
	i32 278, ; 547
	i32 102, ; 548
	i32 364, ; 549
	i32 378, ; 550
	i32 215, ; 551
	i32 170, ; 552
	i32 115, ; 553
	i32 372, ; 554
	i32 344, ; 555
	i32 299, ; 556
	i32 191, ; 557
	i32 76, ; 558
	i32 355, ; 559
	i32 85, ; 560
	i32 357, ; 561
	i32 392, ; 562
	i32 292, ; 563
	i32 393, ; 564
	i32 376, ; 565
	i32 235, ; 566
	i32 334, ; 567
	i32 160, ; 568
	i32 2, ; 569
	i32 200, ; 570
	i32 305, ; 571
	i32 197, ; 572
	i32 24, ; 573
	i32 285, ; 574
	i32 32, ; 575
	i32 117, ; 576
	i32 37, ; 577
	i32 16, ; 578
	i32 174, ; 579
	i32 371, ; 580
	i32 52, ; 581
	i32 374, ; 582
	i32 358, ; 583
	i32 20, ; 584
	i32 279, ; 585
	i32 123, ; 586
	i32 216, ; 587
	i32 154, ; 588
	i32 211, ; 589
	i32 233, ; 590
	i32 312, ; 591
	i32 131, ; 592
	i32 366, ; 593
	i32 294, ; 594
	i32 148, ; 595
	i32 223, ; 596
	i32 281, ; 597
	i32 196, ; 598
	i32 120, ; 599
	i32 28, ; 600
	i32 132, ; 601
	i32 100, ; 602
	i32 134, ; 603
	i32 332, ; 604
	i32 198, ; 605
	i32 153, ; 606
	i32 97, ; 607
	i32 125, ; 608
	i32 282, ; 609
	i32 69, ; 610
	i32 398, ; 611
	i32 72, ; 612
	i32 387, ; 613
	i32 317, ; 614
	i32 335, ; 615
	i32 368, ; 616
	i32 198, ; 617
	i32 136, ; 618
	i32 124, ; 619
	i32 206, ; 620
	i32 71, ; 621
	i32 397, ; 622
	i32 111, ; 623
	i32 327, ; 624
	i32 174, ; 625
	i32 231, ; 626
	i32 152, ; 627
	i32 379, ; 628
	i32 209, ; 629
	i32 395, ; 630
	i32 355, ; 631
	i32 118, ; 632
	i32 208, ; 633
	i32 303, ; 634
	i32 175, ; 635
	i32 396, ; 636
	i32 363, ; 637
	i32 127, ; 638
	i32 133, ; 639
	i32 232, ; 640
	i32 77, ; 641
	i32 46, ; 642
	i32 306, ; 643
	i32 212, ; 644
	i32 73, ; 645
	i32 63, ; 646
	i32 234, ; 647
	i32 98, ; 648
	i32 84, ; 649
	i32 380, ; 650
	i32 43, ; 651
	i32 61, ; 652
	i32 252, ; 653
	i32 333, ; 654
	i32 208, ; 655
	i32 230, ; 656
	i32 37, ; 657
	i32 40, ; 658
	i32 296, ; 659
	i32 361, ; 660
	i32 160, ; 661
	i32 202, ; 662
	i32 98, ; 663
	i32 242, ; 664
	i32 301, ; 665
	i32 273, ; 666
	i32 232, ; 667
	i32 236, ; 668
	i32 135, ; 669
	i32 20, ; 670
	i32 65, ; 671
	i32 367, ; 672
	i32 125, ; 673
	i32 75, ; 674
	i32 192, ; 675
	i32 325, ; 676
	i32 179, ; 677
	i32 164, ; 678
	i32 233, ; 679
	i32 205, ; 680
	i32 156, ; 681
	i32 367, ; 682
	i32 5, ; 683
	i32 241, ; 684
	i32 375, ; 685
	i32 49, ; 686
	i32 339, ; 687
	i32 368, ; 688
	i32 144, ; 689
	i32 139, ; 690
	i32 193, ; 691
	i32 100, ; 692
	i32 258, ; 693
	i32 123, ; 694
	i32 120, ; 695
	i32 142, ; 696
	i32 39, ; 697
	i32 68, ; 698
	i32 184, ; 699
	i32 246, ; 700
	i32 41, ; 701
	i32 249, ; 702
	i32 164, ; 703
	i32 73, ; 704
	i32 381, ; 705
	i32 165, ; 706
	i32 244, ; 707
	i32 127, ; 708
	i32 213, ; 709
	i32 311, ; 710
	i32 360, ; 711
	i32 68, ; 712
	i32 169, ; 713
	i32 184, ; 714
	i32 207, ; 715
	i32 324, ; 716
	i32 298, ; 717
	i32 263, ; 718
	i32 331, ; 719
	i32 151, ; 720
	i32 45, ; 721
	i32 108, ; 722
	i32 48, ; 723
	i32 96, ; 724
	i32 31, ; 725
	i32 209, ; 726
	i32 23, ; 727
	i32 166, ; 728
	i32 22, ; 729
	i32 138, ; 730
	i32 397, ; 731
	i32 78, ; 732
	i32 388, ; 733
	i32 173, ; 734
	i32 54, ; 735
	i32 324, ; 736
	i32 329, ; 737
	i32 269, ; 738
	i32 10, ; 739
	i32 287, ; 740
	i32 401, ; 741
	i32 328, ; 742
	i32 315, ; 743
	i32 176, ; 744
	i32 16, ; 745
	i32 395, ; 746
	i32 139, ; 747
	i32 264, ; 748
	i32 257, ; 749
	i32 13, ; 750
	i32 251, ; 751
	i32 15, ; 752
	i32 122, ; 753
	i32 237, ; 754
	i32 87, ; 755
	i32 149, ; 756
	i32 22, ; 757
	i32 203, ; 758
	i32 34, ; 759
	i32 79, ; 760
	i32 373, ; 761
	i32 353, ; 762
	i32 274, ; 763
	i32 388, ; 764
	i32 147, ; 765
	i32 80, ; 766
	i32 371, ; 767
	i32 175, ; 768
	i32 276, ; 769
	i32 280, ; 770
	i32 383, ; 771
	i32 42, ; 772
	i32 26, ; 773
	i32 394, ; 774
	i32 326, ; 775
	i32 323, ; 776
	i32 107, ; 777
	i32 186, ; 778
	i32 110, ; 779
	i32 254, ; 780
	i32 210, ; 781
	i32 7, ; 782
	i32 356, ; 783
	i32 239, ; 784
	i32 264, ; 785
	i32 44, ; 786
	i32 161, ; 787
	i32 227, ; 788
	i32 148, ; 789
	i32 382, ; 790
	i32 292, ; 791
	i32 328, ; 792
	i32 38, ; 793
	i32 15, ; 794
	i32 275, ; 795
	i32 146, ; 796
	i32 8, ; 797
	i32 309, ; 798
	i32 330, ; 799
	i32 130, ; 800
	i32 377, ; 801
	i32 346, ; 802
	i32 201, ; 803
	i32 277, ; 804
	i32 94 ; 805
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ a8cd27e430e55df3e3c1e3a43d35c11d9512a2db"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
