<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ArtistDetails.aspx.cs" Inherits="ArtistDetails" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- set the viewport width and initial-scale on mobile devices -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />

	<!-- set the encoding of your site -->
	<meta charset="utf-8">
	<title>MultiTracks.com</title>
	<!-- include the site stylesheet -->
	
	<link media="all" rel="stylesheet" href="./css/index.css">
</head>
	<body class="premium standard u-fix-fancybox-iframe">
        
		<form runat="server">
			<asp:ScriptManager runat="server" />
			<noscript>
				<div>Javascript must be enabled for the correct page display</div>
			</noscript>

			<!-- allow a user to go to the main content of the page -->
			<a class="accessibility" href="#main" tabindex="21">Skip to Content</a>

			<div class="wrapper mod-standard mod-gray">
				<div class="details-banner">
					<div class="details-banner--overlay"></div>
					<div class="details-banner--hero">
                        <asp:PlaceHolder runat="server" ID="phBanner">

                        </asp:PlaceHolder>					
					</div>
					<div class="details-banner--info">
						<a href="#" class="details-banner--info--box">
							<asp:PlaceHolder runat="server" ID="phInfoBox">

							</asp:PlaceHolder>								
						</a>

						<h1 class="details-banner--info--name">
							<asp:PlaceHolder runat="server" ID="phTitle">

							</asp:PlaceHolder>				
						</h1>
					</div>
				</div>
				<asp:UpdatePanel runat="server" ID="upDiscovery">
                    <ContentTemplate>
                <asp:PlaceHolder runat="server" ID="phButtonGroup"></asp:PlaceHolder>

                
				<div class="discovery--container u-container">
							<main class="discovery--section">

                                <asp:Panel runat="server" ID="pnlTopSongs">
								<section class="standard--holder">
									<div class="discovery--section--header">
										<h2>Top Songs</h2>
										<a class="discovery--section--header--view-all" runat="server" onserverclick="btn_ViewSongs" >View All</a>
									</div><!-- /.discovery-select -->

									<ul id="playlist" class="song-list mod-new mod-menu">
                                        <asp:PlaceHolder runat="server" ID="phTopSongs" ></asp:PlaceHolder>										
									</ul><!-- /.song-list -->
								</section><!-- /.songs-section -->
									</asp:Panel>

								<asp:Panel runat="server" ID="pnlSongs" Visible="false">
								<section class="standard--holder">
									<div class="discovery--section--header">
										<h2>All Songs</h2>
									</div><!-- /.discovery-select -->

									<ul id="songs" class="song-list mod-new mod-menu">
                                        <asp:PlaceHolder runat="server" ID="phAllSongs" ></asp:PlaceHolder>										
									</ul><!-- /.song-list -->
								</section><!-- /.songs-section -->
									</asp:Panel>

                                <asp:Panel runat="server" ID="pnlAlbums">
									<div class="discovery--space-saver">
									<section class="standard--holder">
										<div class="discovery--section--header">
											<h2>Albums</h2>
										</div><!-- /.discovery-select -->

										<div class="discovery--grid-holder">
											<div class="ly-grid ly-grid-cranberries">
                                                <asp:PlaceHolder runat="server" ID="phAlbum">

                                                </asp:PlaceHolder>											
											</div><!-- /.grid -->
										</div><!-- /.discovery-grid-holder -->
									</section><!-- /.songs-section -->
								</div>
                                </asp:Panel>

								<section class="standard--holder">
									<div class="discovery--section--header">
										<h2>Biography</h2>
									</div><!-- /.discovery-section-header -->

									<div class="artist-details--biography biography">
                                        <asp:PlaceHolder runat="server" ID="phBio" >

                                        </asp:PlaceHolder>
										<a href="#">Read More...</a>
									</div>
								</section><!-- /.biography-section -->
							</main><!-- /.discovery-section -->
				</div><!-- /.standard-container -->
						</ContentTemplate>
                </asp:UpdatePanel>
			</div><!-- /.wrapper -->

			

			<a class="accessibility" href="#wrapper" tabindex="20">Back to top</a>
		</form>
	</body>
</html>
