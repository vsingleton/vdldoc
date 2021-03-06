<?xml version="1.0" encoding="UTF-8" ?>

<!--
 - Copyright (c) 2012, OmniFaces
 - All rights reserved.
 -
 - Redistribution and use in source and binary forms, with or without modification, are permitted provided that the
 - following conditions are met:
 -
 -     * Redistributions of source code must retain the above copyright notice, this list of conditions and the
 -       following disclaimer.
 -     * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the
 -       following disclaimer in the documentation and/or other materials provided with the distribution.
 -     * Neither the name of OmniFaces nor the names of its contributors may be used to endorse or promote products
 -       derived from this software without specific prior written permission.
 -
 - THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 - INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 - DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
 - OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 - DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 - STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 - EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-->

<!--
 - Creates the TLD summary page (right frame), listing the tags and functions that are in this particular tag library
 - and their descriptions.
 -
 - @author Bauke Scholtz
-->
<xsl:stylesheet
	xmlns:javaee="http://xmlns.jcp.org/xml/ns/javaee"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:vdldoc="http://vdldoc.omnifaces.org"
	version="2.0"
>
	<xsl:output method="html" indent="yes"
		doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
		doctype-system="http://www.w3.org/TR/html4/loose.dtd" />

	<xsl:param name="id">
		default
	</xsl:param>

	<xsl:template match="/">
		<xsl:apply-templates select="javaee:vdldoc/javaee:facelet-taglib" />
	</xsl:template>

	<xsl:template match="javaee:facelet-taglib">
		<xsl:if test="@id = $id">
			<xsl:variable name="title">
				<xsl:value-of select="$id" /> (<xsl:value-of select="/javaee:vdldoc/javaee:config/javaee:window-title" />)
			</xsl:variable>

			<html lang="en">
				<head>
					<title>
						<xsl:value-of select="$title" />
					</title>
					<link rel="stylesheet" type="text/css" title="Style">
						<xsl:attribute name="href">
							<xsl:value-of select="/javaee:vdldoc/javaee:config/@subfolder-css-location" />
						</xsl:attribute>
					</link>
				</head>
				<body>
					<noscript>
						<div>JavaScript is disabled on your browser.</div>
					</noscript>

					<!-- ========= START OF TOP NAVBAR ======= -->
					<div class="topNav">
						<a name="navbar_top"></a>
						<a href="#skip-navbar_top" title="Skip navigation links"></a>
						<a name="navbar_top_firstrow"></a>
						<ul class="navList" title="Navigation">
							<li><a href="../overview-summary.html">Overview</a></li>
							<li class="navBarCell1Rev">Library</li>
							<li>Tag</li>
							<li><a href="../help-doc.html">Help</a></li>
						</ul>
					</div>
					<div class="subNav">
						<ul class="navList">
							<li>
								<a target="_top">
									<xsl:attribute name="href">../index.html?<xsl:value-of select="$id" />/tld-summary.html</xsl:attribute>
									Frames
								</a>
							</li>
							<li><a href="tld-summary.html" target="_top">No Frames</a></li>
						</ul>
						<ul class="navList" id="alltags_navbar_top">
							<li><a href="../alltags-noframe.html">All Tags</a></li>
						</ul>
						<div>
							<script type="text/javascript">
								document.getElementById("alltags_navbar_top").style.display = (window == top) ? "block" : "none";
							</script>
						</div>
						<a name="skip-navbar_top"></a>
					</div>
					<!-- ========= END OF TOP NAVBAR ========= -->

					<div class="header">
						<h1 title="Library" class="title">
							<xsl:value-of select="$id" />
						</h1>
					</div>

					<div class="contentContainer">
						<div class="description">
							<ul class="blockList">
								<li class="blockList">
									<xsl:if test="normalize-space(javaee:namespace)">
										<dl>
											<dt>XML Declaration Syntax:</dt>
											<dd>
												<code>
													&lt;anyxmlelement xmlns:<xsl:value-of select="@id" />="<xsl:value-of select="javaee:namespace" />"/&gt;
												</code>
											</dd>
										</dl>
									</xsl:if>

									<dl>
										<dt>Description:</dt>
										<dd>
											<div class="block">
												<xsl:choose>
													<xsl:when test="normalize-space(javaee:description)">
														<xsl:value-of select="javaee:description" disable-output-escaping="yes" />
													</xsl:when>
													<xsl:otherwise>
														<i>No Description</i>
													</xsl:otherwise>
												</xsl:choose>
											</div>
										</dd>
									</dl>
								</li>
							</ul>
						</div>

						<div class="summary">
							<table class="overviewSummary" border="0" cellpadding="3" cellspacing="0" summary="Library Summary table, listing library information">
								<caption>
									<span>Tag Library Information</span>
									<span class="tabEnd">&#160;</span>
								</caption>
								<thead>
									<tr>
										<th class="colFirst" scope="col">Info</th>
										<th class="colLast" scope="col">Value</th>
									</tr>
								</thead>
								<tbody>
									<tr class="rowColor">
										<td class="colFirst">ID (tag prefix)</td>
										<td class="colLast"><code><xsl:value-of select="@id" /></code></td>
									</tr>
									<tr class="altColor">
										<td class="colFirst">URI</td>
										<td class="colLast">
											<xsl:choose>
												<xsl:when test="normalize-space(javaee:namespace)">
													<code><xsl:value-of select="javaee:namespace" /></code>
												</xsl:when>
												<xsl:otherwise>
													<i>None</i>
												</xsl:otherwise>
											</xsl:choose>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="summary">
							<!-- tags and tag files -->
							<xsl:if test="count(javaee:tag) > 0">
								<table class="overviewSummary" border="0" cellpadding="3" cellspacing="0" summary="Tag Summary table, listing tag information">
									<caption>
										<span>Tag Summary</span>
										<span class="tabEnd">&#160;</span>
									</caption>
									<thead>
										<tr>
											<th class="colOne" scope="col">Tag</th>
											<th class="colLast" scope="col">Description</th>
										</tr>
									</thead>
									<tbody>
										<xsl:apply-templates select="javaee:tag" />
									</tbody>
								</table>
							</xsl:if>

							<!-- functions -->
							<xsl:if test="count(javaee:function) > 0">
								<table class="overviewSummary" border="0" cellpadding="3" cellspacing="0"
									summary="Function Summary table, listing function information">
									<caption>
										<span>Function Summary</span>
										<span class="tabEnd">&#160;</span>
									</caption>
									<thead>
										<tr>
											<th class="colFirst" scope="col">Type</th>
											<th class="colOne" scope="col">Function</th>
											<th class="colLast" scope="col">Description</th>
										</tr>
									</thead>
									<tbody>
										<xsl:apply-templates select="javaee:function" />
									</tbody>
								</table>
							</xsl:if>
							
							<!-- tags and tag files -->
							<xsl:if test="count(javaee:taglib-extension/vdldoc:el-variable) > 0">
								<table class="overviewSummary" border="0" cellpadding="3" cellspacing="0"
									summary="EL Variable Summary table, listing function information">
									<caption>
										<span>EL Variable Summary</span>
										<span class="tabEnd">&#160;</span>
									</caption>
									<thead>
										<tr>
											<th class="colFirst" scope="col">EL Variable</th>
											<th class="colOne" scope="col">Type</th>
											<th class="colLast" scope="col">Description</th>
										</tr>
									</thead>
									<tbody>
										<xsl:apply-templates select="javaee:taglib-extension/vdldoc:el-variable" />
									</tbody>
								</table>
							</xsl:if>
							
						</div>
					</div>

					<!-- ========= START OF BOTTOM NAVBAR ======= -->
					<div class="bottomNav">
						<a name="navbar_bottom"></a>
						<a href="#skip-navbar_bottom" title="Skip navigation links"></a>
						<a name="navbar_bottom_firstrow"></a>
						<ul class="navList" title="Navigation">
							<li><a href="../overview-summary.html">Overview</a></li>
							<li class="navBarCell1Rev">Library</li>
							<li>Tag</li>
							<li><a href="../help-doc.html">Help</a></li>
						</ul>
					</div>
					<div class="subNav">
						<ul class="navList">
							<li>
								<a target="_top">
									<xsl:attribute name="href">../index.html?<xsl:value-of select="$id" />/tld-summary.html</xsl:attribute>
									Frames
								</a>
							</li>
							<li><a href="tld-summary.html" target="_top">No Frames</a></li>
						</ul>
						<ul class="navList" id="alltags_navbar_bottom">
							<li><a href="../alltags-noframe.html">All Tags</a></li>
						</ul>
						<script type="text/javascript">
							document.getElementById("alltags_navbar_bottom").style.display = (window == top) ? "block" : "none";
						</script>
						<a name="skip-navbar_bottom"></a>
					</div>
					<!-- ========= END OF BOTTOM NAVBAR ========= -->

					<xsl:if test="/javaee:vdldoc/javaee:config/@hide-generated-by != 'true'">
						<p class="about">Output generated by <a href="http://vdldoc.omnifaces.org" target="_blank">Vdldoc</a> View Declaration Language Documentation Generator.</p>
					</xsl:if>
				</body>
			</html>
		</xsl:if>
	</xsl:template>

	<xsl:template match="javaee:tag">
		<tr>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() mod 2 = 0">altColor</xsl:when>
					<xsl:otherwise>rowColor</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>

			<td class="colOne">
				<b>
					<a>
						<xsl:attribute name="href"><xsl:value-of select="javaee:tag-name" />.html</xsl:attribute>
						<xsl:choose>
							<!-- vdldoc:deprecation is deprecated. It has been replaced by vdldoc:deprecated. -->
							<xsl:when test="javaee:tag-extension/vdldoc:deprecated or javaee:tag-extension/vdldoc:deprecation/vdldoc:deprecated = 'true'">
								<del>
									<xsl:value-of select="javaee:tag-name" />
								</del>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="javaee:tag-name" />
							</xsl:otherwise>
						</xsl:choose>
					</a>
				</b>
			</td>
			<td class="colLast">
				<!-- vdldoc:deprecation is deprecated. It has been replaced by vdldoc:deprecated. -->
				<xsl:if test="javaee:tag-extension/vdldoc:deprecated or javaee:tag-extension/vdldoc:deprecation/vdldoc:deprecated = 'true'">
					<b>Deprecated. </b>
					<xsl:choose>
						<xsl:when test="javaee:tag-extension/vdldoc:deprecated">
							<xsl:value-of select="javaee:tag-extension/vdldoc:deprecated" />
						</xsl:when>
						<!-- vdldoc:deprecation is deprecated. It has been replaced by vdldoc:deprecated. -->
						<xsl:when test="javaee:tag-extension/vdldoc:deprecation/vdldoc:deprecated = 'true'">
							<xsl:value-of select="javaee:tag-extension/vdldoc:deprecation/vdldoc:description" />
						</xsl:when>
					</xsl:choose>
					<xsl:text>&#160;</xsl:text>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="normalize-space(javaee:description)">
						<xsl:value-of select="javaee:description" disable-output-escaping="yes" />
					</xsl:when>
					<xsl:otherwise>
						<i>No Description</i>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="javaee:function">
		<tr>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() mod 2 = 0">altColor</xsl:when>
					<xsl:otherwise>rowColor</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>

			<td class="colFirst">
				<code>
					<xsl:value-of select='substring-before(normalize-space(javaee:function-signature)," ")' />
				</code>
			</td>
			<td class="colOne">
				<code>
					<b>
						<a>
							<xsl:attribute name="href"><xsl:value-of select="javaee:function-name" />.fn.html</xsl:attribute>
							<xsl:value-of select="javaee:function-name" />
						</a>
					</b>(<xsl:value-of select='substring-after(normalize-space(javaee:function-signature),"(")' />
				</code>
			</td>
			<td class="colLast">
				<xsl:choose>
					<xsl:when test="normalize-space(javaee:description)">
						<xsl:value-of select="javaee:description" disable-output-escaping="yes" />
					</xsl:when>
					<xsl:otherwise>
						<i>No Description</i>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="javaee:taglib-extension/vdldoc:el-variable">
		<tr>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() mod 2 = 0">altColor</xsl:when>
					<xsl:otherwise>rowColor</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>

			<td class="colFirst">
				<b>
					<a>
						<xsl:attribute name="href"><xsl:value-of select="vdldoc:el-variable-name" />.el.html</xsl:attribute>
						<xsl:choose>
							<!-- vdldoc:deprecation is deprecated. It has been replaced by vdldoc:deprecated. -->
							<xsl:when test="vdldoc:deprecated or vdldoc:deprecation/vdldoc:deprecated = 'true'">
								<del>
									<xsl:value-of select="vdldoc:el-variable-name" />
								</del>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="vdldoc:el-variable-name" />
							</xsl:otherwise>
						</xsl:choose>
					</a>
				</b>
			</td>
			<td class="colOne">
				<code>
					<xsl:value-of select='vdldoc:type' />
				</code>
			</td>
			<td class="colLast">
				<!-- vdldoc:deprecation is deprecated. It has been replaced by vdldoc:deprecated. -->
				<xsl:if test="vdldoc:deprecated or vdldoc:deprecation/vdldoc:deprecated = 'true'">
					<b>Deprecated. </b>
					<xsl:choose>
						<xsl:when test="vdldoc:deprecated">
							<xsl:value-of select="vdldoc:deprecated" />
						</xsl:when>
						<!-- vdldoc:deprecation is deprecated. It has been replaced by vdldoc:deprecated. -->
						<xsl:when test="vdldoc:deprecation/vdldoc:deprecated = 'true'">
							<xsl:value-of select="vdldoc:deprecation/vdldoc:description" />
						</xsl:when>
					</xsl:choose>
					<xsl:text>&#160;</xsl:text>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="normalize-space(javaee:description)">
						<xsl:value-of select="javaee:description" disable-output-escaping="yes" />
					</xsl:when>
					<xsl:otherwise>
						<i>No Description</i>
					</xsl:otherwise>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>