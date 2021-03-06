<?xml version='1.0'  encoding="UTF-8" ?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:j="http://www.ibm.com/xmlns/prod/2009/jsonx"
	version='1.0'>

<xsl:output method="xml" indent="yes"/>
<xsl:variable name="programName" select="/j:object/j:string[@name='name']/text()" />
<xsl:param name="www" />

<xsl:template match="/">
<xsl:if test="string-length($programName)=0">
<xsl:message terminate="yes">program name is empty</xsl:message>
</xsl:if>
<xsl:apply-templates select="j:object"  mode="program.root"/>
</xsl:template>

<xsl:template match="j:object"  mode="program.root">
<program enabled="true">
<xsl:attribute name="name">
	<xsl:value-of select="$programName"/>
</xsl:attribute>

<xsl:if test="string-length($www)&gt;0">
	<xsl:attribute name="url">
		<xsl:value-of select="$www"/>
	</xsl:attribute>
</xsl:if>

<xsl:attribute name="category">
	<xsl:choose>
		<xsl:when test="j:string[@name='group']">
			<xsl:value-of select="j:string[@name='group']"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text>Others</xsl:text>
		</xsl:otherwise>
	</xsl:choose>
</xsl:attribute>

<xsl:if test="$programName='GCContentByInterval' or
			$programName='QualifyMissingIntervals'">
<xsl:attribute name="require-interval">
	<xsl:text>true</xsl:text>
</xsl:attribute>
</xsl:if>


<xsl:comment>The MIT License (MIT)

Copyright (c) 2015 Pierre Lindenbaum

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
</xsl:comment>
<description><xsl:apply-templates select="j:string[@name='summary']"/></description>
<options>
	<xsl:choose>
		<xsl:when test="$programName='DepthOfCoverage' or
						$programName='CountReads' or
						$programName='CountLoci' or
						$programName='CountReadEvents' or
						$programName='CountMales'or
						$programName='CountTerminusEvent' or
						$programName='DiagnoseTargets' or
						$programName='ErrorRatePerCycle' or
						$programName='FindCoveredIntervals' or
						$programName='FlagStat' or
						$programName='Pileup' or
						$programName='QualifyMissingIntervals' or
						$programName='ReadClippingStats' or
						$programName='ReadGroupProperties' or
						$programName='ReadLengthDistribution'  or
						$programName='BaseRecalibrator' or
						$programName='ClipReads' or
						$programName='IndelRealigner' or
						$programName='LeftAlignIndels' or
						$programName='PrintReads' or
						$programName='ReadAdaptorTrimmer' or
						$programName='RealignerTargetCreator' or
						$programName='SplitNCigarReads' or
						$programName='SplitSamFile' or
						$programName='HaplotypeCaller' or
						$programName='PhaseByTransmission' or
						$programName='ReadBackedPhasing' or
						$programName='UnifiedGenotyper' or
						$programName='VariantAnnotator'  or
						$programName='GenotypeAndValidate'  or
						$programName='HCMappingQualityFilter'  or
						$programName='VariantAnnotator' 
						">
				<option opt="I" label="BAM list" required="true">
					<xsl:attribute name="type">
						 <xsl:choose>
						 	<xsl:when test="$programName='SplitSamFile'">input-file</xsl:when>
						 	<xsl:otherwise>input-files</xsl:otherwise>
						 </xsl:choose> 
					</xsl:attribute>
					<description>Input Bam(s)</description>
					<filter label="BAMS">
						<extension indexed="true">bam</extension>
						<extension>list</extension>
					</filter>
				</option>
		</xsl:when>
		<xsl:when test="$programName='SelectVariants' or
						$programName='CountRODs' or
						$programName='CountRODsByRef' or
						$programName='CountIntervals' or
						$programName='CoveredByNSamplesSites' or
						$programName='FastaStats' or
						$programName='GCContentByInterval' or
						$programName='PrintRODs' or
						$programName='QCRef' or
						$programName='SimulateReadsForVariants' or
						$programName='BeagleOutputToVCF' or
						$programName='GenotypeGVCFs' or
						$programName='ProduceBeagleInput' or
						$programName='VariantRecalibrator' or
						$programName='VariantsToBeagleUnphased' or
						$programName='CalculateGenotypePosteriors' or
						$programName='CatVariants' or
						$programName='CombineGVCFs' or
						$programName='CombineVariants' or
						$programName='FilterLiftedVariants' or
						$programName='GenotypeConcordance' or
						$programName='HaplotypeResolver' or
						$programName='LeftAlignAndTrimVariants' or
						$programName='LiftoverVariants' or
						$programName='RandomlySplitVariants' or
						$programName='RegenotypeVariants' or
						$programName='SelectHeaders' or
						$programName='VariantEval' or
						$programName='VariantFiltration' or
						$programName='VariantsToAllelicPrimitives' or
						$programName='VariantFiltration' or
						$programName='VariantsToBinaryPed' or
						$programName='VariantsToTable' or
						$programName='VariantsToVCF' or
						$programName='ListAnnotations' or
						$programName='FastaAlternateReferenceMaker' or
						$programName='FastaReferenceMaker' or
						$programName='ValidateVariants' or
						$programName='ValidationSiteSelector' or
						$programName='FastaReferenceMaker' or
						$programName='FastaReferenceMaker' or
						$programName='VariantValidationAssessor'
						">
		</xsl:when>
		<xsl:when test="$programName='TODO' or (
					j:array[@name='arguments']/j:object[j:string[@name='type']='List[RodBinding[VariantContext]]' and j:string[@name='name']='--input' ]
					)">
				<option opt="I" label="VCF list" type="input-files"  required="true">
					<description>Input VCF(s)</description>
					<filter label="Variant Files">
						<extension indexed="true">vcf.gz</extension>
						<extension>vcf</extension>
						<extension>list</extension>
					</filter>
				</option>
		</xsl:when>
		<xsl:when test="$programName = 'CommandLineGATK' "></xsl:when>
		<xsl:otherwise>
			<xsl:message terminate="yes">Unknown walker type <xsl:value-of select="concat(j:string[@name='walkertype'],':',$programName)"/></xsl:message>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:apply-templates select="j:array[@name='arguments']/j:object" mode="argument"/>
</options>
</program>
</xsl:template>

<xsl:template match="j:object"  mode="argument">
<xsl:variable name="optName" select="j:string[@name='name']"/>
<xsl:variable name="type0" select="j:string[@name='type']/text()"/>
<xsl:variable name="type">
	<xsl:choose>
		<xsl:when test="$programName = 'CommandLineGATK' and $optName = '--analysis_type' ">
			<xsl:text></xsl:text>
		</xsl:when>
		
		<xsl:when test="( count(j:array[@name='options']/j:object)&gt;0) or 
						($programName = 'DepthOfCoverage' and  $optName = '--outputFormat' ) ">
			<xsl:text>enum</xsl:text>
		</xsl:when>
		
		<xsl:when test="$type0 = 'List[File]'">
			<xsl:text>input-files</xsl:text>
		</xsl:when>
		
		<xsl:when test="$type0 = 'File'">
			<xsl:text>input-file</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'byte'">
			<xsl:text>int</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'String'">
			<xsl:text>string</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'Boolean'">
			<xsl:text>boolean</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'Integer'">
			<xsl:text>int</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'Long'">
			<xsl:text>long</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'Double'">
			<xsl:text>double</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'int' or $type0 = 'long' or $type0 = 'double'  or $type0 = 'boolean'">
			<xsl:value-of select="$type0"/>
		</xsl:when>
		<xsl:when test="$type0 = 'int[]' or $type0='List[Integer]'">
			<xsl:text>int-list</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'List[Double]'">
			<xsl:text>double-list</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'Map[DoCOutputType,PrintStream]'">
			<xsl:text>output-file</xsl:text>
		</xsl:when>
		<!-- <xsl:when test="$type0 = 'RodBinding[VariantContext]'">
			<xsl:text>output-file</xsl:text>
		</xsl:when> -->
		<xsl:when test="$type0 = 'List[String]' or $type0 = 'ArrayList[String]' or $type0 = 'String[]'">
			<xsl:text>string-list</xsl:text>
		</xsl:when>
		
		<xsl:when test="$type0 = 'Set[String]' or $type0 = 'HashSet[String]' ">
			<xsl:text>string-list</xsl:text>
		</xsl:when>
		
		<xsl:when test="$type0 = 'Set[File]' or $type0 = 'List[RodBinding[VariantContext]]'">
			<xsl:text>input-files</xsl:text>
		</xsl:when>
		
		<xsl:when test="$type0 = 'Set[Partition]'">
			<xsl:text>enum-set</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'List[Type]' or $type0 = 'List[ValidationType]'">
			<xsl:text>enum-set</xsl:text>
		</xsl:when>
		
		<xsl:when test="$type0 = 'VariantContextWriter'">
			<xsl:text>output-file</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'PrintStream'">
			<xsl:text>output-file</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'List[IntervalBinding[Feature]]'">
			<xsl:text>strings-or-files</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'RodBinding[VariantContext]' and starts-with(j:string[@name='summary'],'Output')">
			<xsl:text>output-file</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'RodBinding[VariantContext]'">
			<xsl:text>input-file</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'RodBinding[Feature]'">
			<xsl:text>input-file</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'List[RodBinding[Feature]]'">
			<xsl:text>strings-or-files</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'GATKSAMFileWriter'">
			<xsl:text>output-file</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'SAMFileWriter'">
			<xsl:text>output-file</xsl:text>
		</xsl:when>
		<xsl:when test="$type0 = 'IntervalBinding[Feature]'">
			<xsl:text>input-file</xsl:text>
		</xsl:when>

		<xsl:when test="$type0 = 'RodBinding[BeagleFeature]'">
			<xsl:text>rod-files</xsl:text>
		</xsl:when>
		
		<xsl:when test="$type0 = 'List[RodBindingCollection[VariantContext]]'">
			<xsl:text>input-files</xsl:text>
		</xsl:when>
		
		
		
		<xsl:otherwise>
			<xsl:message terminate="yes">#### <xsl:value-of select="concat($programName,'/',$optName,'/',$type0)"/></xsl:message>
			<xsl:text></xsl:text>
		</xsl:otherwise>
	</xsl:choose>
</xsl:variable>

<xsl:choose>
<xsl:when test="string-length($type)&gt;0">
<option>

<xsl:attribute name="opt">
	<xsl:value-of select="substring($optName,2)"/>
</xsl:attribute>

<xsl:attribute name="label">
	<xsl:value-of select="translate($optName,'-','')"/>
</xsl:attribute>

<xsl:attribute name="type">
	<xsl:value-of select="$type"/>
</xsl:attribute>






<xsl:if test="$type0 = 'Set[Partition]'">
	<xsl:attribute name="enum-class">org.broadinstitute.gatk.tools.walkers.coverage.DoCOutputType.Partition</xsl:attribute>
</xsl:if>
<xsl:if test="$type0 = 'List[Type]'">
	<xsl:attribute name="enum-class">htsjdk.variant.variantcontext.VariantContext.Type</xsl:attribute>
</xsl:if>
<xsl:if test="$type0 = 'List[ValidationType]'">
	<xsl:attribute name="enum-class">org.broadinstitute.gatk.tools.walkers.variantutils.ValidateVariants.ValidationType</xsl:attribute>
</xsl:if>





	<xsl:choose>
		<xsl:when test="$type = 'boolean'"></xsl:when>
		<xsl:when test="j:string[@name='required']/text() = 'yes'">
			<xsl:attribute name="required">true</xsl:attribute>
		</xsl:when>
		<xsl:when test="j:string[@name='required']/text() = 'no'">
			<xsl:attribute name="required">false</xsl:attribute>
		</xsl:when>
	</xsl:choose>

	<xsl:choose>
		<xsl:when test="j:string[@name='defaultValue'] = 'NA' and $type = 'boolean' ">
			<xsl:attribute name="default">false</xsl:attribute>
		</xsl:when>
		<xsl:when test="j:string[@name='required']/text() = 'no'">
		</xsl:when>
		<xsl:when test="j:string[@name='defaultValue'] != 'NA'">
			<xsl:attribute name="default"><xsl:value-of select="j:string[@name='defaultValue']"/></xsl:attribute>
		</xsl:when>
	</xsl:choose>

	<xsl:if test="$type ='int'">
		<xsl:if test="j:string[@name='minValue']/text()!='NA'  and j:string[@name='minValue']/text()!='-Infinity'">
			<xsl:attribute name="min-inclusive"><xsl:value-of select="j:string[@name='minValue']"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="j:string[@name='maxValue']/text()!='NA' and j:string[@name='maxValue']/text()!='Infinity'">
			<xsl:attribute name="max-inclusive"><xsl:value-of select="j:string[@name='maxValue']"/></xsl:attribute>
		</xsl:if>
	</xsl:if>

	

	<description><xsl:apply-templates select="j:string[@name='summary']"/></description>
	<xsl:apply-templates select="j:array[@name='options' and count(j:object)&gt;0]" mode='enum'/>

	<xsl:choose>
		<xsl:when test="
		  			($type0 = 'VariantContextWriter' and $type='output-file') or
					($type0 = 'RodBinding[VariantContext]' and $type='output-file') ">
			<extension>vcf</extension>
		</xsl:when>
		
		
		
		<xsl:when test="($type0 = 'GATKSAMFileWriter') or ($type0 = 'SAMFileWriter')">
			<extension>bam</extension>
		</xsl:when>


		
		<xsl:when test="($type0 = 'RodBinding[VariantContext]' and $type='input-file') or
						($type0 = 'List[RodBinding[VariantContext]]')
						">
			<filter label="Variant">
				<extension>vcf</extension>
				<extension>bcf</extension>
				<extension>vcf.gz</extension>
			</filter>
		</xsl:when>
	</xsl:choose>
	
	<xsl:if test="$programName = 'CommandLineGATK' and  $optName = '--reference_sequence' ">
		<filter label="Fasta">
			<extension>fa</extension>
			<extension>fasta</extension>
		</filter>
	</xsl:if>
	
	<xsl:if test="$programName = 'CommandLineGATK' and  $optName = '--reference_sequence' ">
		<filter label="Fasta">
			<extension>fa</extension>
			<extension>fasta</extension>
		</filter>
	</xsl:if>
	
	<xsl:if test="($programName = 'DepthOfCoverage' and  $optName = '--pedigree' )">
		<filter label="Pedigree">
			<extension>ped</extension>
		</filter>
	</xsl:if>
	

	
	
</option>
</xsl:when>
<xsl:otherwise>
	<xsl:message>IGNORING TYPE="<xsl:value-of select="$programName"/>" : <xsl:value-of select="$type"/>: <xsl:value-of select="$type0"/> : "<xsl:value-of select="$optName"/>"</xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="j:array[@name='options']" mode='enum'>
  <enum>
  	<xsl:for-each select="j:object">
  		<item>
  			<xsl:attribute name="value">
  			<xsl:value-of select="j:string[@name='name']"/>
  			</xsl:attribute>
			<description><xsl:value-of select="translate(j:string[@name='summary'],'&#13;&#10;','  ')"/></description>  			
  		</item>
  	</xsl:for-each>
  </enum>
</xsl:template>



</xsl:stylesheet>
