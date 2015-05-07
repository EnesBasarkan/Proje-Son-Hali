<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Arama.aspx.cs" Inherits="Foto_Dükkanı.Arama" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--pop-up Menü !-->
<link rel="stylesheet" href="css/popup.css" type="text/css" media="screen" />
	<script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js" type="text/javascript"></script>
	<script src="js/popup.js" type="text/javascript"></script>
    
    <!--pop-up Menü !-->
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <link rel="Stylesheet" href="css/hepsi.css" type="text/css" media="all" />
	<title>Foto Dükkanı | Online Fotoğraf Makinesi Alışverişi</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/style2.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/animate-custom.css" type="text/css" media="all" />

     <link rel="stylesheet" href="css/iletişim.css" type="text/css" media="all" />
    <script type="text/javascript">
<!--
    function odeme1() {
        document.getElementById("havale").style.visibility = "visible";
        document.getElementById("havale").style.position = "static";

        document.getElementById("kredikarti").style.visibility = "hidden";
        document.getElementById("kredikarti").style.position = "absolute";

        document.getElementById("kredikarti-taksitli").style.visibility = "hidden";
        document.getElementById("kredikarti-taksitli").style.position = "absolute";

        document.getElementById("ptt").style.visibility = "hidden";
        document.getElementById("ptt").style.position = "absolute";

    }

    function odeme2() {
        document.getElementById("havale").style.visibility = "hidden";
        document.getElementById("havale").style.position = "absolute";

        document.getElementById("kredikarti").style.visibility = "visible";
        document.getElementById("kredikarti").style.position = "static";

        document.getElementById("kredikarti-taksitli").style.visibility = "hidden";
        document.getElementById("kredikarti-taksitli").style.position = "absolute";

        document.getElementById("ptt").style.visibility = "hidden";
        document.getElementById("ptt").style.position = "absolute";

    }

    function odeme3() {
        document.getElementById("havale").style.visibility = "hidden";
        document.getElementById("havale").style.position = "absolute";

        document.getElementById("kredikarti").style.visibility = "hidden";
        document.getElementById("kredikarti").style.position = "absolute";

        document.getElementById("kredikarti-taksitli").style.visibility = "visible";
        document.getElementById("kredikarti-taksitli").style.position = "static";

        document.getElementById("ptt").style.visibility = "hidden";
        document.getElementById("ptt").style.position = "absolute";

    }

    function odeme4() {
        document.getElementById("havale").style.visibility = "hidden";
        document.getElementById("havale").style.position = "absolute";

        document.getElementById("kredikarti").style.visibility = "hidden";
        document.getElementById("kredikarti").style.position = "absolute";

        document.getElementById("kredikarti-taksitli").style.visibility = "hidden";
        document.getElementById("kredikarti-taksitli").style.position = "absolute";

        document.getElementById("ptt").style.visibility = "visible";
        document.getElementById("ptt").style.position = "static";
    }

    function fiyatyazdir(txt) {
        var kdvsi = txt * 18 / 100;
        var yenifiyat = parseInt(kdvsi) + parseInt(txt);
        document.getElementById('fiyatalani').innerHTML = yenifiyat + ' TL  (Kdv Dahildir)';
        document.getElementById('fiyatalani2').innerHTML = yenifiyat + ' TL  (Kdv Dahildir)';

        var indirim = txt * 5 / 100;
        var indirimli = parseInt(txt) - parseInt(indirim);
        var indirimlikdvli = parseInt(indirimli) * 18 / 100;
        var indirimlitoplam = parseInt(indirimlikdvli) + parseInt(txt)
        document.getElementById('fiyatalani3').innerHTML = yenifiyat + ' TL  (Kdv Dahildir)';

    }

    function formCheck(formobj) {
        // Enter name of mandatory fields
        var fieldRequired = Array("odemetipi", "ad", "soyad", "eposta", "telefon", "onay", "k_sehir", "e_adi", "e_mail", "captchacode");
        // Enter field description to appear in the dialog box
        var fieldDescription = Array("Ödeme Tipi", "Adınız", "Soyadınız", "E-Posta Adresiniz", "Telefon Numaranız", "Sözleşme Onayı", "Siteyi Kodlayan Kişi/Firma Şehir", "Adınız", "E-Posta Adresiniz", "Güvenlik Kodu");
        // dialog message
        var alertMsg = "Lütfen aşağıdaki bilgileri giriniz :\n\n";

        var l_Msg = alertMsg.length;

        for (var i = 0; i < fieldRequired.length; i++) {
            var obj = formobj.elements[fieldRequired[i]];
            if (obj) {
                switch (obj.type) {
                    case "select-one":
                        if (obj.selectedIndex == -1 || obj.options[obj.selectedIndex].text == "") {
                            alertMsg += " - " + fieldDescription[i] + "\n";
                        }
                        break;
                    case "select-multiple":
                        if (obj.selectedIndex == -1) {
                            alertMsg += " - " + fieldDescription[i] + "\n";
                        }
                        break;
                    case "text":
                    case "textarea":
                        if (obj.value == "" || obj.value == null) {
                            alertMsg += " - " + fieldDescription[i] + "\n";
                        }
                        break;
                    default:
                }
                if (obj.type == undefined) {
                    var blnchecked = false;
                    for (var j = 0; j < obj.length; j++) {
                        if (obj[j].checked) {
                            blnchecked = true;
                        }
                    }
                    if (!blnchecked) {
                        alertMsg += " - " + fieldDescription[i] + "\n";
                    }
                }
            }
        }

        if (alertMsg.length == l_Msg) {
            return true;
        } else {
            alert(alertMsg);
            return false;
        }
    }

    function theChecker() {
        if (document.odemeformu.onay.checked == false) {
            document.odemeformu.tamamla.disabled = true;
        }
        else {
            document.odemeformu.tamamla.disabled = false;
        }
    }

    //-->
</script>
   
	<!--[if lte IE 6]>
		<style type="text/css" media="screen">
			.tabbed { height:420px; }
		</style>
	<![endif]-->
	
	<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
	<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
	<script src="js/jquery.slide.js" type="text/javascript"></script>
	<script src="js/jquery-func.js" type="text/javascript"></script>
    <script src="css/js/cufon.js" type="text/javascript"></script>
    <script src="css/js/cufon-yui.js" type="text/javascript"></script>
	
</head>
<body>
    <form id="form1" runat="server">
<div id="top">
	
	<div class="shell">
		
		<!-- Header -->
		<div id="header">
			<h1 id="logo"><a href="index.aspx">a</a></h1>
			<div id="navigation">
                
				<ul>
                    <li><asp:Label ID="merhaba_yazisi" runat="server" ClientIDMode="AutoID"></asp:Label></li>
				    <li><a href="index.aspx">Ana Sayfa</a></li>
					<li><a href="Uye.aspx">
                        <asp:Label ID="Label2" runat="server" Text="Profil" Visible="False"></asp:Label></a></li>
					
                    <li><div id="girispanel"><a href="#">
                        <asp:Label ID="Label1" runat="server" Text="Üye Kayıt / Giriş"></asp:Label></a></div></li>
				
                    
				</ul>
                <a href="#">
                    <asp:LinkButton ID="guvenli_cikis" runat="server" OnClick="guvenli_cikis_Click" Visible="False">Güvenli Çıkış.</asp:LinkButton></a>
			</div>
		</div>
		<!-- End Header -->
        
		
	</div>
</div>
<!-- Top -->

<!-- Main -->
<div id="main">
	<div class="shell">
		
		<!-- Search, etc -->
		<div class="options">
			<div class="search">
					&nbsp;
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
				</div>
			

			
			<div class="right">
				<span class="cart">
					
					
				</span>
			</div>
		</div>
		<!-- End Search, etc -->
		
		<!-- Content -->
		<div id="content">
			
			<!-- Tabs -->
			<div class="tabs">
				<ul>
				    <li><a href="#" class="active"><span>Urunler</span></a></li>
				   
				</ul>
			</div>
			<!-- Tabs -->
			
			<!-- Container -->
			<div id="container">
				
				<div class="tabbed">
					
					<!-- First Tab Content -->
					<div class="tab-content" style="display:block;">
						<div class="items">
							<div class="cl">&nbsp;</div>
							<ul>
							    <li>
							    	<div class="image">
                                        <asp:Image ID="Image1" runat="server" />
							    	</div>
							    	<p>Ürün Kodu: <span>
                                        <asp:Label ID="Label19" runat="server" Text="Label"></asp:Label></span><br />
						    		Marka :<span><asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></span><br />
						    	  </p>
							    	<p class="price">Fiyat: <strong>
                                        <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></strong></p>
                                    
							    </li>
							    <li>
							    	<div class="image">
                                        <asp:Image ID="Image2" runat="server" />
							    	</div>
							    	<p>Ürün Kodu: <span>
                                        <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label></span><br />
Marka :<span><asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></span><br />
                                    </p>
                                    <p class="price">Fiyat: <strong>
                                        <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label></strong></p>
							    </li>
							    <li>
							    	<div class="image">
                                        <asp:Image ID="Image3" runat="server" />
							    	</div>
							    	<p>Ürün Kodu: <span>
                                        <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label></span><br />
Marka :<span><asp:Label ID="Label5" runat="server" Text="Label"></asp:Label></span><br />
                                    </p>
                                    <p class="price">Fiyat: <strong>
                                        <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label></strong></p>
							    </li>
							    <li>
							    	<div class="image">
                                        <asp:Image ID="Image4" runat="server" />
							    	</div>
							    	<p>Ürün Kodu: <span>
                                        <asp:Label ID="Label22" runat="server" Text="Label"></asp:Label></span><br />
Marka :<span><asp:Label ID="Label6" runat="server" Text="Label"></asp:Label></span><br />
                                    </p>
                                    <p class="price">Fiyat: <strong>
                                        <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label></strong></p>
							    </li>
							    <li>
							    	<div class="image">
                                        <asp:Image ID="Image5" runat="server" />
							    	</div>
							    	<p>Ürün Kodu: <span>
                                        <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label></span><br />
Marka :<span><asp:Label ID="Label7" runat="server" Text="Label"></asp:Label></span><br />
                                    </p>
                                  <p class="price">Fiyat: <strong>
                                      <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label></strong><br />
                                  </p>
							    </li>
							    <li>
							    	<div class="image">
                                        <asp:Image ID="Image6" runat="server" />
							    	</div>
							    	<p>Ürün Kodu: <span>
                                        <asp:Label ID="Label24" runat="server" Text="Label"></asp:Label></span><br />
Marka :<span><asp:Label ID="Label8" runat="server" Text="Label"></asp:Label></span><br />
                                    </p>
                                    <p class="price">Fiyat: <strong>
                                        <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label></strong></p>
							    </li>
							    <li>
							    	<div class="image">
                                        <asp:Image ID="Image7" runat="server" />
							    	</div>
							    	<p>Ürün Kodu: <span>
                                        <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label></span><br />
Marka :<span><asp:Label ID="Label9" runat="server" Text="Label"></asp:Label></span><br />
                                    </p>
                                    <p class="price">Fiyat: <strong>
                                        <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label></strong></p>
							    </li>
							    <li>
							    	<div class="image">
                                        <asp:Image ID="Image8" runat="server" />
							    	</div>
							    	<p>Ürün Kodu: <span>
                                        <asp:Label ID="Label26" runat="server" Text="Label"></asp:Label></span><br />
Marka :<span><asp:Label ID="Label10" runat="server" Text="Label"></asp:Label></span><br />
                                    </p>
                                    <p class="price">Fiyat: <strong>
                                        <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label></strong></p>
							    </li>
							</ul>
							<div class="cl">&nbsp;</div>
						</div>
					</div>
					<!-- End First Tab Content -->
					
				
					
				</div>
				
				
				
				<!-- Footer -->
				<div id="footer">
					<div class="left">Ana Sayfa<span>|</span>Hakkımızda<span>|</span>Hizmet Sözleşmesi<span>|</span>Müşteri Hizmetleri<span>|</span>İletişim</div>
					<div class="right">
					&copy; FotoDukkani.com | Tüm Hakları Saklıdır.</div>
				</div>
				<!-- End Footer -->
				
			</div>
			<!-- End Container -->
			
		</div>
		<!-- End Content -->
		
	</div>
</div>
<!-- End Main -->
	<!--Pop-up Menü Üye Girişi -->
		<div id="popupContact">
		
		
		
			

            <div class="container">
            <!-- Codrops top bar -->
            <div class="codrops-top"></div>
            <header> </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                                <h1>ÜYE GİRİŞİ</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" > Kullanıcı Adı</label>
                                    <asp:TextBox ID="txt_giris_ad" runat="server"></asp:TextBox>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Şifre </label>
                                    <asp:TextBox ID="txt_giris_sifre" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="txt_sifre_unutma" AutoCompleteType="None"  runat="server"></asp:TextBox>
                                </p>
                            <asp:LinkButton ID="lbtn_sifre_unutma" runat="server" OnClick="lbtn_sifre_unutma_Click">Şifremi Unuttum</asp:LinkButton>
                                <p class="login button"> 
                                    
                                     
                                    <asp:Button ID="btn_giris" runat="server" Text="Giriş Yap" OnClick="btn_giris_Click" />
								</p>
                                
                                <p class="change_link">
									Üye Değil Misiniz ?
									<a href="#toregister" class="to_register">Üye Ol !</a>
								</p>
                        </div>

                        <div id="register" class="animate form">
                                <h1> ÜYE KAYIT </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Kullanıcı Adı</label>
                                    <asp:TextBox runat="server" id="txt_kayit_kul_ad" />
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" > E-Mail</label>
                                    <asp:TextBox runat="server" id="txt_kayit_mail" /> 
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Şifre </label>
                                     <asp:TextBox runat="server" id="txt_kayit_sifre" /> 
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Şifre Tekrar </label>
                                    <asp:TextBox runat="server" id="txt_kayit_sifre2" /> 
                                    
                                    
                                </p>
                            
                                <p class="signin button"> 
								 <asp:Button ID="btn_kayit" runat="server" Text="Kayıt Ol" OnClick="btn_kayit_Click" /> 
								
                                </p>
                                <p class="change_link">  
									
									<a href="#tologin" class="to_register"> Giriş Yap </a>
								</p>
                        </div>
						
                    </div>
                </div>  
            </section>
        </div>
			
            



			
		
	</div>
	<div id="backgroundPopup"></div>
		<!--Pop-up Menü Üye Girişi -->
        
       
    </form>
        
       
</body>
</html>