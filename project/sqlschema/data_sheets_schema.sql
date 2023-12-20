

CREATE TABLE "CollectionConsent" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "CollectionNotification" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "ConsentRevocation" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Counts" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Data" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "DataPackage" (
	id TEXT NOT NULL, 
	download_url TEXT, 
	license TEXT, 
	title TEXT, 
	description TEXT, 
	conforms_to TEXT, 
	conforms_to_schema TEXT, 
	conforms_to_class TEXT, 
	version TEXT, 
	language TEXT, 
	publisher TEXT, 
	issued DATETIME, 
	created_by TEXT, 
	created_on DATETIME, 
	compression TEXT, 
	was_derived_from TEXT, 
	page TEXT, 
	resources TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "DataResource" (
	id TEXT NOT NULL, 
	download_url TEXT, 
	license TEXT, 
	conforms_to TEXT, 
	conforms_to_schema TEXT, 
	conforms_to_class TEXT, 
	version TEXT, 
	language TEXT, 
	publisher TEXT, 
	issued DATETIME, 
	created_by TEXT, 
	created_on DATETIME, 
	compression TEXT, 
	was_derived_from TEXT, 
	page TEXT, 
	path TEXT, 
	title TEXT, 
	description TEXT, 
	format VARCHAR(22), 
	media_type TEXT, 
	encoding TEXT, 
	bytes INTEGER, 
	hash TEXT, 
	md5 TEXT, 
	sha256 TEXT, 
	dialect TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "DatasetCollection" (
	id TEXT NOT NULL, 
	download_url TEXT, 
	license TEXT, 
	title TEXT, 
	description TEXT, 
	conforms_to TEXT, 
	conforms_to_schema TEXT, 
	conforms_to_class TEXT, 
	version TEXT, 
	language TEXT, 
	publisher TEXT, 
	issued DATETIME, 
	created_by TEXT, 
	created_on DATETIME, 
	compression TEXT, 
	was_derived_from TEXT, 
	page TEXT, 
	resources TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "DatasetProperty" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Deidentification" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "DirectCollection" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "ExportControlRegulatoryRestrictions" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "ExtensionMechanism" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "FormatDialect" (
	comment_prefix TEXT, 
	delimiter TEXT, 
	double_quote TEXT, 
	header TEXT, 
	quote_char TEXT, 
	PRIMARY KEY (comment_prefix, delimiter, double_quote, header, quote_char)
);

CREATE TABLE "Grant" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	grant_number TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Grantor" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	ror_id TEXT, 
	wikidata_id TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "IPRestrictions" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Labels" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "LicenseAndUseTerms" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "MaintainerContact" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Missing" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "NamedThing" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "PreprocessingCleaningLabelingSoftware" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Relationships" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "RetentionLimits" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Sampling" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Splits" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "ThirdPartySharing" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "UpdatePlan" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "VersionAccess" (
	id TEXT NOT NULL, 
	name TEXT, 
	PRIMARY KEY (id)
);

CREATE TABLE "Dataset" (
	id TEXT NOT NULL, 
	download_url TEXT, 
	license TEXT, 
	conforms_to TEXT, 
	conforms_to_schema TEXT, 
	conforms_to_class TEXT, 
	version TEXT, 
	language TEXT, 
	publisher TEXT, 
	issued DATETIME, 
	created_by TEXT, 
	created_on DATETIME, 
	compression TEXT, 
	was_derived_from TEXT, 
	page TEXT, 
	path TEXT, 
	title TEXT, 
	description TEXT, 
	format VARCHAR(22), 
	media_type TEXT, 
	encoding TEXT, 
	bytes INTEGER, 
	hash TEXT, 
	md5 TEXT, 
	sha256 TEXT, 
	dialect TEXT, 
	license_and_use_terms TEXT, 
	ip_restrictions TEXT, 
	regulatory_restrictions TEXT, 
	updates TEXT, 
	retention_limit TEXT, 
	version_access TEXT, 
	extension_mechanism TEXT, 
	"DatasetCollection_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY(license_and_use_terms) REFERENCES "LicenseAndUseTerms" (id), 
	FOREIGN KEY(ip_restrictions) REFERENCES "IPRestrictions" (id), 
	FOREIGN KEY(regulatory_restrictions) REFERENCES "ExportControlRegulatoryRestrictions" (id), 
	FOREIGN KEY(updates) REFERENCES "UpdatePlan" (id), 
	FOREIGN KEY(retention_limit) REFERENCES "RetentionLimits" (id), 
	FOREIGN KEY(version_access) REFERENCES "VersionAccess" (id), 
	FOREIGN KEY(extension_mechanism) REFERENCES "ExtensionMechanism" (id), 
	FOREIGN KEY("DatasetCollection_id") REFERENCES "DatasetCollection" (id)
);

CREATE TABLE "CollectionConsent_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "CollectionConsent" (id)
);

CREATE TABLE "CollectionNotification_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "CollectionNotification" (id)
);

CREATE TABLE "ConsentRevocation_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "ConsentRevocation" (id)
);

CREATE TABLE "Counts_count_values" (
	backref_id TEXT, 
	count_values INTEGER, 
	PRIMARY KEY (backref_id, count_values), 
	FOREIGN KEY(backref_id) REFERENCES "Counts" (id)
);

CREATE TABLE "Data_type" (
	backref_id TEXT, 
	type TEXT, 
	PRIMARY KEY (backref_id, type), 
	FOREIGN KEY(backref_id) REFERENCES "Data" (id)
);

CREATE TABLE "DataPackage_keywords" (
	backref_id TEXT, 
	keywords TEXT, 
	PRIMARY KEY (backref_id, keywords), 
	FOREIGN KEY(backref_id) REFERENCES "DataPackage" (id)
);

CREATE TABLE "DataPackage_test_roles" (
	backref_id TEXT, 
	test_roles VARCHAR(14), 
	PRIMARY KEY (backref_id, test_roles), 
	FOREIGN KEY(backref_id) REFERENCES "DataPackage" (id)
);

CREATE TABLE "DataResource_keywords" (
	backref_id TEXT, 
	keywords TEXT, 
	PRIMARY KEY (backref_id, keywords), 
	FOREIGN KEY(backref_id) REFERENCES "DataResource" (id)
);

CREATE TABLE "DataResource_test_roles" (
	backref_id TEXT, 
	test_roles VARCHAR(14), 
	PRIMARY KEY (backref_id, test_roles), 
	FOREIGN KEY(backref_id) REFERENCES "DataResource" (id)
);

CREATE TABLE "DatasetCollection_keywords" (
	backref_id TEXT, 
	keywords TEXT, 
	PRIMARY KEY (backref_id, keywords), 
	FOREIGN KEY(backref_id) REFERENCES "DatasetCollection" (id)
);

CREATE TABLE "DatasetCollection_test_roles" (
	backref_id TEXT, 
	test_roles VARCHAR(14), 
	PRIMARY KEY (backref_id, test_roles), 
	FOREIGN KEY(backref_id) REFERENCES "DatasetCollection" (id)
);

CREATE TABLE "Deidentification_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "Deidentification" (id)
);

CREATE TABLE "DirectCollection_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "DirectCollection" (id)
);

CREATE TABLE "ExportControlRegulatoryRestrictions_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "ExportControlRegulatoryRestrictions" (id)
);

CREATE TABLE "ExtensionMechanism_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "ExtensionMechanism" (id)
);

CREATE TABLE "IPRestrictions_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "IPRestrictions" (id)
);

CREATE TABLE "Labels_label" (
	backref_id TEXT, 
	label TEXT, 
	PRIMARY KEY (backref_id, label), 
	FOREIGN KEY(backref_id) REFERENCES "Labels" (id)
);

CREATE TABLE "LicenseAndUseTerms_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "LicenseAndUseTerms" (id)
);

CREATE TABLE "MaintainerContact_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "MaintainerContact" (id)
);

CREATE TABLE "MaintainerContact_email" (
	backref_id TEXT, 
	email TEXT, 
	PRIMARY KEY (backref_id, email), 
	FOREIGN KEY(backref_id) REFERENCES "MaintainerContact" (id)
);

CREATE TABLE "Missing_missing" (
	backref_id TEXT, 
	missing TEXT, 
	PRIMARY KEY (backref_id, missing), 
	FOREIGN KEY(backref_id) REFERENCES "Missing" (id)
);

CREATE TABLE "Missing_why_missing" (
	backref_id TEXT, 
	why_missing TEXT, 
	PRIMARY KEY (backref_id, why_missing), 
	FOREIGN KEY(backref_id) REFERENCES "Missing" (id)
);

CREATE TABLE "PreprocessingCleaningLabelingSoftware_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "PreprocessingCleaningLabelingSoftware" (id)
);

CREATE TABLE "Relationships_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "Relationships" (id)
);

CREATE TABLE "RetentionLimits_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "RetentionLimits" (id)
);

CREATE TABLE "Sampling_ia_sample" (
	backref_id TEXT, 
	ia_sample BOOLEAN, 
	PRIMARY KEY (backref_id, ia_sample), 
	FOREIGN KEY(backref_id) REFERENCES "Sampling" (id)
);

CREATE TABLE "Sampling_israndom" (
	backref_id TEXT, 
	israndom BOOLEAN, 
	PRIMARY KEY (backref_id, israndom), 
	FOREIGN KEY(backref_id) REFERENCES "Sampling" (id)
);

CREATE TABLE "Sampling_source_data" (
	backref_id TEXT, 
	source_data TEXT, 
	PRIMARY KEY (backref_id, source_data), 
	FOREIGN KEY(backref_id) REFERENCES "Sampling" (id)
);

CREATE TABLE "Sampling_is_representative" (
	backref_id TEXT, 
	is_representative BOOLEAN, 
	PRIMARY KEY (backref_id, is_representative), 
	FOREIGN KEY(backref_id) REFERENCES "Sampling" (id)
);

CREATE TABLE "Sampling_representative_verification" (
	backref_id TEXT, 
	representative_verification TEXT, 
	PRIMARY KEY (backref_id, representative_verification), 
	FOREIGN KEY(backref_id) REFERENCES "Sampling" (id)
);

CREATE TABLE "Sampling_why_not_representative" (
	backref_id TEXT, 
	why_not_representative TEXT, 
	PRIMARY KEY (backref_id, why_not_representative), 
	FOREIGN KEY(backref_id) REFERENCES "Sampling" (id)
);

CREATE TABLE "Splits_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "Splits" (id)
);

CREATE TABLE "ThirdPartySharing_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "ThirdPartySharing" (id)
);

CREATE TABLE "UpdatePlan_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "UpdatePlan" (id)
);

CREATE TABLE "VersionAccess_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "VersionAccess" (id)
);

CREATE TABLE "AddressingGap" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	response TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "CollectionMechanism" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "CollectionTimeframe" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "Confidentiality" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "ContentWarning" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "Creator" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	principal_investigator TEXT, 
	institution TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "DataAnomaly" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "DataCollector" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "DataProtectionImpact" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "DiscouragedUse" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "DistributionDate" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "DistributionFormat" (
	id TEXT NOT NULL, 
	name TEXT, 
	doi TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "Erratum" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "EthicalReview" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "ExistingUse" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "ExternalResource" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "Funder" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	grantor TEXT, 
	grant TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY(grantor) REFERENCES "Grantor" (id), 
	FOREIGN KEY(grant) REFERENCES "Grant" (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "FutureUseImpact" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "Instance" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "InstanceAcquisition" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "Maintainer" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "OtherTask" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "PreprocessingCleaningLabeling" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "Purpose" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	response TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "RawData" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "SamplingStrategy" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "SensitiveElement" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "Subpopulation" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "Task" (
	id TEXT NOT NULL, 
	name TEXT, 
	description TEXT, 
	response TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "UseRepository" (
	id TEXT NOT NULL, 
	name TEXT, 
	"Dataset_id" TEXT, 
	PRIMARY KEY (id), 
	FOREIGN KEY("Dataset_id") REFERENCES "Dataset" (id)
);

CREATE TABLE "Dataset_keywords" (
	backref_id TEXT, 
	keywords TEXT, 
	PRIMARY KEY (backref_id, keywords), 
	FOREIGN KEY(backref_id) REFERENCES "Dataset" (id)
);

CREATE TABLE "Dataset_test_roles" (
	backref_id TEXT, 
	test_roles VARCHAR(14), 
	PRIMARY KEY (backref_id, test_roles), 
	FOREIGN KEY(backref_id) REFERENCES "Dataset" (id)
);

CREATE TABLE "CollectionMechanism_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "CollectionMechanism" (id)
);

CREATE TABLE "CollectionTimeframe_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "CollectionTimeframe" (id)
);

CREATE TABLE "Confidentiality_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "Confidentiality" (id)
);

CREATE TABLE "ContentWarning_warnings" (
	backref_id TEXT, 
	warnings TEXT, 
	PRIMARY KEY (backref_id, warnings), 
	FOREIGN KEY(backref_id) REFERENCES "ContentWarning" (id)
);

CREATE TABLE "DataAnomaly_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "DataAnomaly" (id)
);

CREATE TABLE "DataCollector_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "DataCollector" (id)
);

CREATE TABLE "DataProtectionImpact_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "DataProtectionImpact" (id)
);

CREATE TABLE "DiscouragedUse_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "DiscouragedUse" (id)
);

CREATE TABLE "DistributionDate_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "DistributionDate" (id)
);

CREATE TABLE "DistributionFormat_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "DistributionFormat" (id)
);

CREATE TABLE "Erratum_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "Erratum" (id)
);

CREATE TABLE "EthicalReview_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "EthicalReview" (id)
);

CREATE TABLE "ExistingUse_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "ExistingUse" (id)
);

CREATE TABLE "ExternalResource_external_resources" (
	backref_id TEXT, 
	external_resources TEXT, 
	PRIMARY KEY (backref_id, external_resources), 
	FOREIGN KEY(backref_id) REFERENCES "ExternalResource" (id)
);

CREATE TABLE "ExternalResource_future_guarantees" (
	backref_id TEXT, 
	future_guarantees TEXT, 
	PRIMARY KEY (backref_id, future_guarantees), 
	FOREIGN KEY(backref_id) REFERENCES "ExternalResource" (id)
);

CREATE TABLE "ExternalResource_archival" (
	backref_id TEXT, 
	archival BOOLEAN, 
	PRIMARY KEY (backref_id, archival), 
	FOREIGN KEY(backref_id) REFERENCES "ExternalResource" (id)
);

CREATE TABLE "ExternalResource_restrictions" (
	backref_id TEXT, 
	restrictions TEXT, 
	PRIMARY KEY (backref_id, restrictions), 
	FOREIGN KEY(backref_id) REFERENCES "ExternalResource" (id)
);

CREATE TABLE "FutureUseImpact_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "FutureUseImpact" (id)
);

CREATE TABLE "Instance_representation" (
	backref_id TEXT, 
	representation TEXT, 
	PRIMARY KEY (backref_id, representation), 
	FOREIGN KEY(backref_id) REFERENCES "Instance" (id)
);

CREATE TABLE "InstanceAcquisition_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "InstanceAcquisition" (id)
);

CREATE TABLE "Maintainer_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "Maintainer" (id)
);

CREATE TABLE "OtherTask_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "OtherTask" (id)
);

CREATE TABLE "PreprocessingCleaningLabeling_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "PreprocessingCleaningLabeling" (id)
);

CREATE TABLE "RawData_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "RawData" (id)
);

CREATE TABLE "SamplingStrategy_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "SamplingStrategy" (id)
);

CREATE TABLE "SensitiveElement_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "SensitiveElement" (id)
);

CREATE TABLE "Subpopulation_identification" (
	backref_id TEXT, 
	identification TEXT, 
	PRIMARY KEY (backref_id, identification), 
	FOREIGN KEY(backref_id) REFERENCES "Subpopulation" (id)
);

CREATE TABLE "Subpopulation_distribution" (
	backref_id TEXT, 
	distribution TEXT, 
	PRIMARY KEY (backref_id, distribution), 
	FOREIGN KEY(backref_id) REFERENCES "Subpopulation" (id)
);

CREATE TABLE "UseRepository_description" (
	backref_id TEXT, 
	description TEXT, 
	PRIMARY KEY (backref_id, description), 
	FOREIGN KEY(backref_id) REFERENCES "UseRepository" (id)
);
