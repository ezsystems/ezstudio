-- Product name migration
START TRANSACTION;
DELETE FROM ezsite_data WHERE name IN ('ezpublish-version', 'ezplatform-release');
INSERT INTO ezsite_data (name, value) VALUES ('ezplatform-release', '3.0.0');
COMMIT;

--
ALTER TABLE ezcontentclass_attribute ALTER COLUMN data_text1 TYPE varchar(255);
--

--
ALTER TABLE ezcontentclass_attribute ADD is_thumbnail boolean DEFAULT false NOT NULL;
--

-- EZP-31471: Keywords versioning
ALTER TABLE ezkeyword_attribute_link ADD COLUMN version INT;

UPDATE ezkeyword_attribute_link SET "version" = (
    SELECT current_version
    FROM ezcontentobject_attribute AS cattr
    JOIN ezcontentobject AS contentobj
        ON cattr.contentobject_id = contentobj.id
        AND cattr.version = contentobj.current_version
    WHERE cattr.id = ezkeyword_attribute_link.objectattribute_id
);

ALTER TABLE ezkeyword_attribute_link ALTER COLUMN version SET NOT NULL;

CREATE INDEX ezkeyword_attr_link_oaid_ver ON ezkeyword_attribute_link (objectattribute_id, version);
--

-- EZP-31079: Provided default value for ezuser login pattern --
UPDATE "ezcontentclass_attribute" SET "data_text2" = '^[^@]+$'
    WHERE "data_type_string" = 'ezuser'
    AND "data_text2" IS NULL;
--

-- EZEE-2880: Added support for stage and transition actions --
ALTER TABLE ezeditorialworkflow_markings
    ADD COLUMN message TEXT NOT NULL DEFAULT '',
    ADD COLUMN reviewer_id INTEGER,
    ADD COLUMN result TEXT;
--

-- EZEE-2988: Added availability for schedule hide --
START TRANSACTION;
ALTER TABLE ezdatebasedpublisher_scheduled_version RENAME COLUMN publication_date TO action_timestamp;
ALTER TABLE ezdatebasedpublisher_scheduled_version ADD COLUMN action VARCHAR(32);
UPDATE ezdatebasedpublisher_scheduled_version SET action = 'publish';
ALTER TABLE ezdatebasedpublisher_scheduled_version ALTER COLUMN action SET NOT NULL ;
COMMIT;
--
START TRANSACTION;
ALTER TABLE ezdatebasedpublisher_scheduled_version
    RENAME TO ezdatebasedpublisher_scheduled_entries;
ALTER TABLE ezdatebasedpublisher_scheduled_entries
    ALTER COLUMN version_id DROP NOT NULL;
ALTER TABLE ezdatebasedpublisher_scheduled_entries
    ALTER COLUMN version_number DROP NOT NULL;
COMMIT;
--
